package com.zzy.shop.service;

import com.zzy.shop.po.Product;
import com.zzy.shop.po.ProductCategory;

import java.util.List;

public interface AdminProductService {

    // 分页查询商品信息
    List<Product> pageProductInfo(Integer cid, Integer page, Integer limit);

    // 查询商品详情
    Product getProductDetail(Integer pnumber);

    // 删除商品
    int deleteProduct(Integer pid);

    // 增加商品
    int insertProduct(Product product);

    // 更新商品
    int updateProduct(Product product);

    int insertCategory(ProductCategory productCategory);

    int selectMaxNumber(Integer pid);

}
