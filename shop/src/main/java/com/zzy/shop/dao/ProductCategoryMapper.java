package com.zzy.shop.dao;

import com.zzy.shop.po.ProductCategory;

public interface ProductCategoryMapper {
    int deleteByPrimaryKey(Integer pcid);

    int insert(ProductCategory record);

    int insertSelective(ProductCategory record);

    ProductCategory selectByPrimaryKey(Integer pcid);

    int updateByPrimaryKeySelective(ProductCategory record);

    int updateByPrimaryKey(ProductCategory record);

    int deleteByProductId(Integer pid);
}