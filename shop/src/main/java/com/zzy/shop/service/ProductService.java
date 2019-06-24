package com.zzy.shop.service;

import com.zzy.shop.po.Product;
import com.zzy.shop.po.Category;

import java.util.List;


public interface ProductService {

    // 分页查询商品信息
    List<Product> pageProductInfo(Integer cid, Integer sort, Integer page, Integer limit);

    // 查询商品详情
    Product getProductDetail(Integer pid);

}
