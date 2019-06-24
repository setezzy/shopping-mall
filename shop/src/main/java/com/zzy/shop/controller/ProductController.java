package com.zzy.shop.controller;

import com.zzy.shop.po.Product;
import com.zzy.shop.serviceimpl.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class ProductController {

    @Autowired
    private ProductServiceImpl productServiceImpl;

    @RequestMapping("/detail/{pnumber}")
    public String getProductDetail(HttpServletRequest request, @PathVariable Integer pnumber){
        Product product = productServiceImpl.getProductDetail(pnumber);
        request.setAttribute("product", product);
        return "/product/product_detail";
    }

}
