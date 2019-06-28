package com.zzy.shop.controller;

import com.zzy.shop.po.Category;
import com.zzy.shop.po.Product;
import com.zzy.shop.po.ProductCategory;
import com.zzy.shop.serviceimpl.AdminProductServiceImpl;
import com.zzy.shop.serviceimpl.CategoryServiceImpl;
import com.zzy.shop.serviceimpl.ProductServiceImpl;
import com.zzy.shop.util.Result;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminProductController {

    @Autowired
    private AdminProductServiceImpl adminProductServiceImpl;
    @Autowired
    private CategoryServiceImpl categoryServiceImpl;

    @RequestMapping("/product")
    public String product(
            @RequestParam(value = "cid", required = false, defaultValue = "1") String reqCid,
            @RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
            @RequestParam(value = "limit", required = false, defaultValue = "11") Integer limit,
            HttpServletRequest request, HttpSession session){

        Integer cid = StringUtils.isNumeric(reqCid) ? Integer.valueOf(reqCid) : 1;
        Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;

        Category category = categoryServiceImpl.getByCategoryId(cid);

        if(category!=null){
            // 分页查找商品
            List<Product> products = adminProductServiceImpl.pageProductInfo(cid, page, limit);

            // 查找二级分类
            List<Category> childCategories = categoryServiceImpl.listChildCategories(cid);

            //查找父分类
            List<Category> parentCategories = categoryServiceImpl.listParentCategories(cid);

            com.zzy.shop.util.PageInfo info = new  com.zzy.shop.util.PageInfo(page.intValue(), limit.intValue(), "", "");

            info.setTotal((int) adminProductServiceImpl.getL().getTotal());

            request.setAttribute("category", category);
            request.setAttribute("products", products);
            request.setAttribute("pageInfo", info);
            request.setAttribute("childCategories", childCategories);
            request.setAttribute("parentCategories", parentCategories);
        }

        return "/admin/product/list";

    }


    @RequestMapping(value = "/product/delete/{pid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteProduct(@PathVariable("pid") Integer pid, HttpSession session){
        Integer count = adminProductServiceImpl.deleteProduct(pid);
        if(count == 1) {
            return new Result(1, "删除商品成功");
        } else {
            return new Result(0, "删除商品失败");
        }
    }

    @RequestMapping(value = "/product/insert", method = RequestMethod.POST)
    @ResponseBody
    public Object insertProduct(Product product, ProductCategory productCategory){

        Integer pid = adminProductServiceImpl.insertProduct(product);
        product.setPid(pid);
        product.setPdate(new Date());

        Integer pnumber = adminProductServiceImpl.selectMaxNumber(pid) + 1;
        product.setPnumber(pnumber);
        adminProductServiceImpl.updateProduct(product);

        productCategory.setPid(pid);
        int count = adminProductServiceImpl.insertCategory(productCategory);

        if(count == 0 ) {
            return new Result(0, "添加商品失败");
        } else {
            return new Result(1, "添加商品成功");
        }
    }



    @RequestMapping(value = "/product/update", method = RequestMethod.POST)
    @ResponseBody
    public Object updateProduct(Product product){
        Integer count = adminProductServiceImpl.updateProduct(product);
        if(count == 1) {
            return new Result(1, "修改商品成功");
        } else {
            return new Result(0, "修改商品失败");
        }
    }
}
