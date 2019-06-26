package com.zzy.shop.dao;

import com.zzy.shop.po.OrderShipment;

public interface OrderShipmentMapper {
    int deleteByPrimaryKey(Integer oshid);

    int insert(OrderShipment record);

    int insertSelective(OrderShipment record);

    OrderShipment selectByPrimaryKey(Integer oshid);

    int updateByPrimaryKeySelective(OrderShipment record);

    int updateByPrimaryKey(OrderShipment record);

    OrderShipment selectByOrderId(Integer oid);
}