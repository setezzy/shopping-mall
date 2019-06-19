package com.zzy.shop.dao;

import com.zzy.shop.po.OrderProduct;

public interface OrderProductMapper {
    int deleteByPrimaryKey(Integer opid);

    int insert(OrderProduct record);

    int insertSelective(OrderProduct record);

    OrderProduct selectByPrimaryKey(Integer opid);

    int updateByPrimaryKeySelective(OrderProduct record);

    int updateByPrimaryKey(OrderProduct record);
}