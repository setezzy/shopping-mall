package com.zzy.shop.controller;

import com.zzy.shop.po.OrderState;
import com.zzy.shop.serviceimpl.OrderServiceImpl;
import com.zzy.shop.util.PageInfo;
import com.zzy.shop.util.Result;
import com.zzy.shop.vo.OrderVO;
import com.zzy.shop.po.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminOrderController {
    @Autowired
    private OrderServiceImpl orderServiceImpl;

    @RequestMapping("/orders")
    public String orderUI(HttpServletRequest request,
                          @RequestParam(value="page", required=false, defaultValue="1") Integer page,
                          @RequestParam(value="limit", required = false, defaultValue = "8") Integer limit){

        List<OrderVO> orderVOList = orderServiceImpl.getOrders(page, limit);
        PageInfo pageInfo = new PageInfo(page.intValue(), limit.intValue(), "", "");
        pageInfo.setTotal((int)orderServiceImpl.getL().getTotal());
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("orderVOList", orderVOList);

        return "/admin/order/list";

    }

    @RequestMapping(value = "/orders/admit", method = RequestMethod.POST)
    @ResponseBody
    public Object orderAdmit(Order order){
        int count = orderServiceImpl.updateOrder(order);
        OrderState orderState = new OrderState();
        orderState.setOid(order.getOid());
        orderState.setOstate(order.getOstate());
        orderServiceImpl.updateOrderState(orderState);

        if(count==1){
            return new Result(1,"发货成功");
        }else{
            return new Result(0,"发货失败");
        }
    }

    @RequestMapping(value = "/orders/refuse", method = RequestMethod.POST)
    @ResponseBody
    public Object orderRefuse(Order order){
        int count = orderServiceImpl.updateOrder(order);
        OrderState orderState = new OrderState();
        orderState.setOid(order.getOid());
        orderState.setOstate(order.getOstate());
        orderServiceImpl.updateOrderState(orderState);

        if(count==1){
            return new Result(1,"已拒绝");
        }else{
            return new Result(0,"操作失败");
        }
    }

    @RequestMapping(value = "/orders/delete/{oid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object orderDelete(@PathVariable("oid") Integer oid){
        int count = orderServiceImpl.deleteOrder(oid);
        if(count == 1) {
            return new Result(1, "删除订单成功");
        } else {
            return new Result(0, "删除订单失败");
        }
    }

}
