package com.zzy.shop.dao;

import com.zzy.shop.po.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer pid);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer pid);

    Product selectByProductNumber(Integer pnumber);

    Product selectByProductName(String pname);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    int selectMaxByProductId(Integer pid);

    List<Product> selectAll();

    List<Product> listByPage(@Param("cids" + "") List<String> cids);
}