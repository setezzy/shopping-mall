package com.zzy.shop.dao;

import com.zzy.shop.po.OrderProduct;

import java.util.List;

public interface OrderProductMapper {
    int deleteByPrimaryKey(Integer opid);

    int deleteByOrderId(Integer oid);

    int insert(OrderProduct record);

    int insertSelective(OrderProduct record);

    OrderProduct selectByPrimaryKey(Integer opid);

    int updateByPrimaryKeySelective(OrderProduct record);

    int updateByPrimaryKey(OrderProduct record);

    List<OrderProduct> selectByOrderId(Integer oid);
}