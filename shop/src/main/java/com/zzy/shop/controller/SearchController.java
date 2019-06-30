package com.zzy.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class SearchController {

    @RequestMapping("/search")
    public String search(HttpServletRequest request){
        return "/product/product_search";
    }
}
