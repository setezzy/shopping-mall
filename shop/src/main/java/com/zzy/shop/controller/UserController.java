package com.zzy.shop.controller;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import com.zzy.shop.po.User;


@Controller
@RequestMapping("/user")
public class UserController {

    private static Logger log = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(HttpServletRequest request, Model model){
        int userId = Integer.parseInt(request.getParameter("id"));
        System.out.println(userId);
        User user = null;
        if (userId == 1){
            user = new User();
            user.setUid(1);
            user.setPassword("123");
            user.setUname("pororo");
        }
        log.debug(user.toString());
        model.addAttribute("user", user);
        return "/index";
    }

}
