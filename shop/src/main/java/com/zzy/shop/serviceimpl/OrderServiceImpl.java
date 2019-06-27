package com.zzy.shop.serviceimpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzy.shop.po.*;
import com.zzy.shop.service.OrderService;
import com.zzy.shop.dao.OrderMapper;
import com.zzy.shop.dao.OrderProductMapper;
import com.zzy.shop.dao.OrderStateMapper;
import com.zzy.shop.dao.OrderShipmentMapper;
import com.zzy.shop.vo.OrderVO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderProductMapper orderProductMapper;
    @Autowired
    private OrderShipmentMapper orderShipmentMapper;
    @Autowired
    private OrderStateMapper orderStateMapper;

    @Override
    public Integer saveOrder(Order order){
        orderMapper.insertSelective(order);
        return order.getOid();
    }

    @Override
    public void saveOrderProduct(OrderProduct orderProduct){
        orderProductMapper.insertSelective(orderProduct);
    }

    @Override
    public void saveOrderShipment(OrderShipment orderShipment){
        orderShipmentMapper.insertSelective(orderShipment);
    }

    @Override
    public void saveOrderState(OrderState orderState){
        orderStateMapper.insertSelective(orderState);
    }

    @Override
    public Order getByOrderNumber(Long onumber, Integer uid){
        Order order0 = new Order();
        order0.setOnumber(onumber);
        order0.setUid(uid);
        Order order = orderMapper.selectByOrderNumber(order0);
        return order;
    }

    @Override
    public List<OrderProduct> getProductsByOrderId(Integer oid){
        List<OrderProduct> orderProducts = orderProductMapper.selectByOrderId(oid);
        return orderProducts;
    }

    @Override
    public OrderShipment getShipmentByOrderId(Integer oid){
        OrderShipment orderShipment = orderShipmentMapper.selectByOrderId(oid);
        return orderShipment;
    }


    private Page<OrderVO> l ;

    public Page<OrderVO> getL() {
        return l;
    }

    public void setL(Page<OrderVO> l) {
        this.l = l;
    }

    @Override
    public List<OrderVO> getPageOrderByUserId(Integer uid, Integer page, Integer limit){
        PageHelper.startPage(page, limit);
        List<OrderVO> list = orderMapper.selectByUserId(uid);
        this. l = (Page<OrderVO>)list;
        return list;
    }

    @Override
    public List<OrderVO> getByOrderState(Integer ostate, Integer uid, Integer page, Integer limit){
        PageHelper.startPage(page, limit);
        List<OrderVO> list = orderMapper.selectByOrderState(ostate, uid);
        this.l = (Page<OrderVO>)list;
        return list;
    }

    @Override
    public OrderVO getOrderByOrderNumber(Long onumber){
        OrderVO orderVO = orderMapper.selectOrderVOByOrderNumber(onumber);
        return orderVO;
    }
}
