package com.zzy.shop.controller;
import com.zzy.shop.util.Result;
import com.zzy.shop.po.*;
import com.zzy.shop.serviceimpl.AddressServiceImpl;
import com.zzy.shop.serviceimpl.OrderServiceImpl;
import com.zzy.shop.serviceimpl.ProductServiceImpl;
import com.zzy.shop.util.GetRandom;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/buy")
public class OrderController {
    @Autowired
    private AddressServiceImpl addressServiceImpl;
    @Autowired
    private OrderServiceImpl orderServiceImpl;
    @Autowired
    private ProductServiceImpl productServiceImpl;


    @RequestMapping(value = "/product", method = RequestMethod.POST)
    @ResponseBody
    public Result product(@RequestParam("pnumber") Integer pnumber,
                           HttpSession session, HttpServletRequest request) {

        User user = (User) session.getAttribute("user");
        if(user == null){
            return new Result(401, "请先登录");
        }

        // 选中商品
        Product product = productServiceImpl.getProductDetail(pnumber);

        if(product==null) {
            return new Result(0, "出错了");
        }
        else{
            session.setAttribute("product", product);
            return new Result(1,"");
        }
    }

    // 填写订单信息
    @RequestMapping(value = "/checkout")
    public String checkout(HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        // 收货地址
        List<Address> addresses = addressServiceImpl.listAddress(user.getUid());
        request.setAttribute("addresses", addresses);

        return "/order/checkout";
    }


    //  提交订单
    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    @ResponseBody
    public Object confirm(Order order, @RequestParam(value = "addrid") Integer addrid, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Product product =  (Product) session.getAttribute("product");
        if(user == null){
            return new Result(0, "您还没有登录");
        }

        // 收货地址
        Address address = addressServiceImpl.getAddress(addrid);
        if(address!=null) {
            //随机生成订单编号
            Long num = GetRandom.getNumber();

            order.setOnumber(num);
            order.setOdate(new Date());
            order.setOprice(product.getPrice());
            order.setOstate(new Integer(1)); //提交
            order.setUid(user.getUid());

            //保存order 获得 order id
            Integer oid = orderServiceImpl.saveOrder(order);
            order.setOid(oid);

            Integer available = product.getAmount();
            if(available >= 1){
                //减商品库存
                int count = orderServiceImpl.updateProductStock(product.getPid());
                if(count==1){
                    //保存订单商品
                    OrderProduct orderProduct = new OrderProduct();
                    orderProduct.setOid(oid);
                    orderProduct.setPnumber(product.getPnumber());
                    orderProduct.setPname(product.getPname());
                    orderProduct.setImage(product.getImage());

                    orderProduct.setPrice(product.getPrice());
                    orderServiceImpl.saveOrderProduct(orderProduct);

                    //保存订单配送收货地址
                    OrderShipment orderShipment = new OrderShipment();
                    orderShipment.setOid(oid);
                    BeanUtils.copyProperties(address, orderShipment);
                    orderServiceImpl.saveOrderShipment(orderShipment);

                    //保存订单状态
                    OrderState orderState = new OrderState();
                    orderState.setOid(oid);
                    orderState.setOstate(new Integer("1"));
                    orderServiceImpl.saveOrderState(orderState);
                }else{
                    return new Result(0, "商品库存不足");
                }
            }else{
                return new Result(0,"商品库存不足");
            }

            return new Result(1, String.valueOf(num));
        }
        return null;
    }


    // 确认订单
    @RequestMapping(value = "/confirm/{onumber}")
    public String confirmShow( @PathVariable Long onumber, HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        Order order = orderServiceImpl.getByOrderNumber(onumber, user.getUid());

        if (order != null) {

            List<OrderProduct> orderProducts = orderServiceImpl.getProductsByOrderId(order.getOid());

            OrderShipment orderShipment = orderServiceImpl.getShipmentByOrderId(order.getOid());

            request.setAttribute("order", order); // 订单信息
            request.setAttribute("orderProducts", orderProducts);// 订单详情表
            request.setAttribute("orderShipment", orderShipment);// 订单配送表
            return "/order/confirm";
        }

        return "/order/confirm";
    }
}

