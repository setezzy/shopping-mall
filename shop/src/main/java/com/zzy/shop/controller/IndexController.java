package com.zzy.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzy.shop.serviceimpl.CategoryServiceImpl;
import com.zzy.shop.vo.CategoryVO;


@Controller
public class IndexController {

    @Autowired
    CategoryServiceImpl CategoryServiceImpl;

    @RequestMapping("/index")
    public String index(HttpServletRequest request, HttpSession session){
        //导航栏商品信息
        List<CategoryVO> category = CategoryServiceImpl.getIndexCategory();
        session.setAttribute("categories", category);
        return "/index";
    }
}
