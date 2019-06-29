package com.zzy.shop.dao;

import com.zzy.shop.po.Order;
import com.zzy.shop.vo.OrderVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer oid);



    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer oid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    Order selectByOrderNumber(Order order);

    List<OrderVO> selectByUserId(Integer uid);

    List<OrderVO> selectByOrderState(@Param("ostate") Integer ostate, @Param("uid") Integer uid);

    OrderVO selectOrderVOByOrderNumber(Long onumber);
}