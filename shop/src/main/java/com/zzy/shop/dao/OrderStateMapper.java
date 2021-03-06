package com.zzy.shop.dao;

import com.zzy.shop.po.OrderState;

public interface OrderStateMapper {
    int deleteByPrimaryKey(Integer osid);

    int deleteByOrderId(Integer oid);

    int insert(OrderState record);

    int insertSelective(OrderState record);

    OrderState selectByPrimaryKey(Integer osid);

    int updateByPrimaryKeySelective(OrderState record);

    int updateByPrimaryKey(OrderState record);

    int updateByOrderId(OrderState record);
}