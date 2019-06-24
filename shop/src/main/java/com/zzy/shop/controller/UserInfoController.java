package com.zzy.shop.controller;

import com.zzy.shop.service.AddressService;
import com.zzy.shop.serviceimpl.AddressServiceImpl;
import com.zzy.shop.serviceimpl.UserServiceImpl;
import com.zzy.shop.util.Result;
import com.zzy.shop.po.Address;
import com.zzy.shop.po.Category;
import com.zzy.shop.po.Product;
import com.zzy.shop.po.User;

import com.zzy.shop.vo.AddressVO;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/uc/user")
public class UserInfoController {

    @Autowired
    private AddressServiceImpl addressServiceImpl;

    @Autowired
    private UserServiceImpl userServiceImpl;

    // GET 个人中心
    @RequestMapping("/portal")
    public String portal(){
        return "/user/user_portal";
    }

    // 修改个人密码
    @RequestMapping(value = "/info")
    public Object infoModify(){
        return "/user/user_password";
    }

    @RequestMapping(value =  "/info/update", method = RequestMethod.POST)
    @ResponseBody
    public Object passUpdate(@RequestParam("password") String password,
                             @RequestParam("password_new") String passwordNew,
                             HttpSession session){
        User user = (User) session.getAttribute("user");
        if(! password.equalsIgnoreCase(user.getPassword())){
            return new Result(0, "原密码错误");
        }
        else{
            user.setPassword(passwordNew);
        }
        Integer count = userServiceImpl.updateUser(user);
        if(count == 1) {
            return new Result(1, "更新密码成功");
        } else {
            return new Result(0, "更新密码失败");
        }
    }




    // GET 收货地址
    @RequestMapping("/address")
    public String address(
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
            @RequestParam(value = "limit", required = false, defaultValue = "3") Integer limit,
            HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("user");
        List<Address> addresses = addressServiceImpl.pageAddressInfo(page, limit, user.getUid());

        com.zzy.shop.util.PageInfo info = new com.zzy.shop.util.PageInfo(page.intValue(), limit.intValue(), "", "");
        info.setTotal((int) addressServiceImpl.getAddressPage().getTotal());
        request.setAttribute("addresses", addresses);
        request.setAttribute("pageInfo", info);

        return "/user/user_address";
    }

    // POST 创建收货地址
    @RequestMapping(value = "/address/insert", method = RequestMethod.POST)
    @ResponseBody
    public Object addressCreate(Address address, HttpSession session) {
        User user = (User) session.getAttribute("user");
        address.setUid(user.getUid());
        Integer count = addressServiceImpl.insertAddress(address);
        if(count == 1) {
            return new Result(1, "新增收货地址成功");
        } else {
            return new Result(0, "新增收货地址失败");
        }

    }


    //PUT 更新收货地址
    @RequestMapping(value = "/address/update", method = RequestMethod.POST)
    @ResponseBody
    public Object addressUpdate(AddressVO addressvo, HttpSession session) {
        User user = (User) session.getAttribute("user");
        Address address = new Address();
        BeanUtils.copyProperties(addressvo, address);
        address.setUid(user.getUid());
        Integer count = addressServiceImpl.updateAddress(address);
        if(count == 1) {
            return new Result(1, "更新收货地址成功");
        } else {
            return new Result(0, "更新收货地址失败");
        }
    }

    // 删除收货地址
    @RequestMapping(value = "/address/{addrid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object addressDelete(@PathVariable("addrid") Integer addrid, HttpSession session) {
        Integer count = addressServiceImpl.deleteAddress(addrid);
        if(count == 1) {
            return new Result(1, "删除收货地址成功");
        } else {
            return new Result(0, "删除收货地址失败");
        }
    }

}
