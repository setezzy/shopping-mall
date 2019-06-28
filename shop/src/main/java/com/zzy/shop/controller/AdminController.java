package com.zzy.shop.controller;

import com.zzy.shop.po.Admin;
import com.zzy.shop.util.Result;
import com.zzy.shop.serviceimpl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminServiceImpl adminServiceImpl;

    // login
    @RequestMapping("/login")
    public String loginUI(HttpServletRequest request){
        return "/admin/admin_login";
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

        Admin admin = adminServiceImpl.selectUser(uname, password);
        if(admin == null){
            return new Result(0, "登录失败，用户名或密码错误");
        }
        if(password.equals(admin.getPassword())){
            admin.setState(1);
            adminServiceImpl.updateUser(admin);
            session.setAttribute("admin", admin);
            return new Result(1, "欢迎登录");
        }
        else{
            return new Result(0, "登录失败，用户名或密码错误");
        }

    }

    // logout
    @RequestMapping("/logout")
    public String loginUI(HttpServletRequest request, HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        admin.setState(0);
        adminServiceImpl.updateUser(admin);
        session.invalidate();
        return "redirect:/admin/login";
    }

    @RequestMapping("/info")
    public Object infoModify(){
        return "/admin/admin_password";
    }

    @RequestMapping(value = "/info/update", method = RequestMethod.POST)
    @ResponseBody
    public Object passUpdate(@RequestParam("password") String password,
                             @RequestParam("password_new") String passwordNew,
                             HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        System.out.print(passwordNew);
        if(! password.equalsIgnoreCase(admin.getPassword())){
            return new Result(0, "原密码错误");
        }
        else if(passwordNew == "" || passwordNew == null){
            return new Result(0, "请输入新密码");
        }
        else{
            admin.setPassword(passwordNew);
        }
        Integer count = adminServiceImpl.updateUser(admin);
        if(count == 1) {
            return new Result(1, "更新密码成功");
        } else {
            return new Result(0, "更新密码失败");
        }
    }

    // index
    @RequestMapping("/index")
    public String adminIndex(HttpServletRequest request, HttpSession session){
        return "/admin/admin_index";
    }
}
