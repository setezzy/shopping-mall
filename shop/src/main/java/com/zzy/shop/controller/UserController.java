package com.zzy.shop.controller;

import com.zzy.shop.util.Result;
import com.zzy.shop.po.User;
import com.zzy.shop.serviceimpl.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class UserController {

    @Autowired
    private UserServiceImpl UserServiceImpl;

    // login
    @RequestMapping(value = {"/login", "/"})
    public String loginUI(HttpServletRequest request){
        return "/user/user_login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(@RequestParam("uname") String uname,
                        @RequestParam("password") String password,
                        @RequestParam("vcode") String vcode,
                        HttpSession session){

        String sessionCode = (String) session.getAttribute("verifycode");
        if(!sessionCode.equalsIgnoreCase(vcode)){
            return new Result(0, "登录失败，验证码错误");
        }

        User user = UserServiceImpl.selectUser(uname, password);
        if(user == null){
            return new Result(0, "登录失败，用户名或密码错误");
        }
        if(password.equals(user.getPassword())){
            user.setState(1);
            UserServiceImpl.updateUser(user);
            session.setAttribute("user", user);
            return new Result(1, "欢迎登录");
        }
        else{
            return new Result(0, "登录失败，用户名或密码错误");
        }

    }

    // logout
    @RequestMapping("/logout")
    public String loginUI(HttpServletRequest request, HttpSession session){
        User user = (User) session.getAttribute("user");
        user.setState(0);
        UserServiceImpl.updateUser(user);
        session.invalidate();
        return "redirect:/index";
    }

}
