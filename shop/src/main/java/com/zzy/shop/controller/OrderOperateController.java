package com.zzy.shop.controller;

import com.zzy.shop.serviceimpl.OrderServiceImpl;
import com.zzy.shop.po.User;
import com.zzy.shop.po.Order;
import com.zzy.shop.vo.OrderVO;
import com.zzy.shop.util.PageInfo;

import com.zzy.shop.util.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/uc/order")
public class OrderOperateController {

    @Autowired
    private OrderServiceImpl orderServiceImpl;

    @RequestMapping("/list")
    public String orderUI(HttpSession session, HttpServletRequest request,
                          @RequestParam(value="ostate", required=false, defaultValue = "0") Integer ostate,
                          @RequestParam(value="page", required=false, defaultValue="1") Integer page,
                          @RequestParam(value="limit", required = false, defaultValue = "8") Integer limit){

        User user = (User) session.getAttribute("user");

        List<OrderVO> orderVOList;

        Integer uid = user.getUid();

        if(ostate == 0){
            orderVOList = orderServiceImpl.getPageOrderByUserId(uid, page, limit);
        }
        else {
            orderVOList = orderServiceImpl.getByOrderState(ostate, uid, page, limit);
        }

        PageInfo pageInfo = new PageInfo(page.intValue(), limit.intValue(), "", "");
        pageInfo.setTotal((int)orderServiceImpl.getL().getTotal());
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("orderVOList", orderVOList);

        return "/user/user_order";
    }


    @RequestMapping("//{onumber}")
    public String orderUI(@PathVariable Long onumber, HttpSession session, HttpServletRequest request){
        OrderVO orderVO = orderServiceImpl.getOrderByOrderNumber(onumber);
        request.setAttribute("orderVO", orderVO);

        return "/user/user_order_view";
    }

    @RequestMapping(value = "/cancel", method = RequestMethod.POST)
    @ResponseBody
    public Object cancelOrder(Order order){
        int count = orderServiceImpl.updateOrder(order);
        if(count == 1) {
            return new Result(1, "取消订单成功");
        } else {
            return new Result(0, "取消订单失败");
        }
    }

    @RequestMapping(value = "/close", method = RequestMethod.POST)
    @ResponseBody
    public Object closeOrder(Order order){
        int count = orderServiceImpl.updateOrder(order);
        if(count == 1) {
            return new Result(1, "关闭订单成功");
        } else {
            return new Result(0, "关闭订单失败");
        }
    }

}
