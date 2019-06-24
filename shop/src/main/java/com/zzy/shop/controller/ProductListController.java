package com.zzy.shop.controller;

import com.zzy.shop.po.Product;
import com.zzy.shop.po.Category;
import com.zzy.shop.serviceimpl.CategoryServiceImpl;
import com.zzy.shop.serviceimpl.ProductServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class ProductListController {

    @Autowired
    private CategoryServiceImpl categoryServiceImpl;
    @Autowired
    private ProductServiceImpl productServiceImpl;

    // GET 分类列表
    @RequestMapping("/list")
    public String categoryList(
            @RequestParam(value = "cid", required = false, defaultValue = "1") String reqCid,
            @RequestParam(value = "sort", required = false, defaultValue = "0") String reqSort,
            @RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
            @RequestParam(value = "limit", required = false, defaultValue = "4") Integer limit,
            HttpServletRequest request){

        // 请求参数:类目ID,如果类目ID不存在或者不为Integer类型,则默认1/全部商品
        Integer cid = StringUtils.isNumeric(reqCid) ? Integer.valueOf(reqCid) : 1;
        // 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/推荐排序
        Integer sort = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : 0;
        // 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
        Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;

        Category category = categoryServiceImpl.getByCategoryId(cid);
        if(category!=null){
            // 分页查找商品
            List<Product> products = productServiceImpl.pageProductInfo(cid, sort, page, limit);

            // 查找二级分类
            List<Category> childCategories = categoryServiceImpl.listChildCategories(cid);

            //查找父分类
            List<Category> parentCategories = categoryServiceImpl.listParentCategories(cid);

            com.zzy.shop.util.PageInfo info = new  com.zzy.shop.util.PageInfo(page.intValue(), limit.intValue(), "", "");

            info.setTotal((int) productServiceImpl.getL().getTotal());

            request.setAttribute("sort", reqSort);
            request.setAttribute("category", category);
            request.setAttribute("products", products);
            request.setAttribute("pageInfo", info);
            request.setAttribute("childCategories", childCategories);
            request.setAttribute("parentCategories", parentCategories);
        }
        return "/product/product_list";
    }
}
