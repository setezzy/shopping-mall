package com.zzy.shop.dao;

import com.zzy.shop.po.CategoryParent;

public interface CategoryParentMapper {
    int deleteByPrimaryKey(Integer cpid);

    int insert(CategoryParent record);

    int insertSelective(CategoryParent record);

    CategoryParent selectByPrimaryKey(Integer cpid);

    int updateByPrimaryKeySelective(CategoryParent record);

    int updateByPrimaryKey(CategoryParent record);
}