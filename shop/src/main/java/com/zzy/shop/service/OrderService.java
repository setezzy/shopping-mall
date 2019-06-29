package com.zzy.shop.service;

import com.zzy.shop.po.*;
import com.zzy.shop.vo.OrderVO;

import java.util.List;

public interface OrderService {

    // 保存订单
    Integer saveOrder(Order order);

    // 保存订单商品
    void saveOrderProduct(OrderProduct orderProduct);

    // 保存订单配送
    void saveOrderShipment(OrderShipment orderShipment);

    // 保存订单状态
    void saveOrderState(OrderState orderState);

    // 由订单编号获取订单
    Order getByOrderNumber(Long onumber, Integer uid);

    // 由订单编号获取商品
    List<OrderProduct> getProductsByOrderId(Integer oid);

    // 由商品id更新库存
    int updateProductStock(Integer pid);

    // 由订单编号获取地址
    OrderShipment getShipmentByOrderId(Integer oid);

    // 显示个人订单
    List<OrderVO> getPageOrderByUserId(Integer uid, Integer page, Integer limit);

    List<OrderVO> getByOrderState(Integer ostate, Integer uid, Integer page, Integer limit);

    // 根据订单号查询订单
    OrderVO getOrderByOrderNumber(Long onumber);

}
