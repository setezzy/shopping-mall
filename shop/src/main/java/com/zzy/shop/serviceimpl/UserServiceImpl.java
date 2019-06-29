package com.zzy.shop.serviceimpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzy.shop.dao.*;
import com.zzy.shop.po.OrderProduct;
import com.zzy.shop.po.User;
import com.zzy.shop.po.Order;
import com.zzy.shop.service.UserService;
import com.zzy.shop.vo.OrderVO;
import com.zzy.shop.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService{

    private Page<UserVO> l ;

    public Page<UserVO> getL() {
        return l;
    }

    public void setL(Page<UserVO> l) {
        this.l = l;
    }

    @Autowired
    private UserMapper UserMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderProductMapper orderProductMapper;
    @Autowired
    private OrderShipmentMapper orderShipmentMapper;
    @Autowired
    private OrderStateMapper orderStateMapper;

    @Override
    public int insertUser(User user){
        int count = UserMapper.insertSelective(user);
        return count;
    }

    @Override
    public User selectUser(String uname, String password){
        User user = UserMapper.selectByName(uname);
        return user;
    }

    @Override
    public int updateUser(User user){
        int count = UserMapper.updateByPrimaryKeySelective(user);
        return count;
    }

    @Override
    public List<UserVO> getUsers(Integer page, Integer limit){
        PageHelper.startPage(page, limit);
        List<UserVO> list = UserMapper.selectAll();
        this.l = (Page<UserVO>)list;
        return list;
    }

    public int deleteUser(Integer uid){
        int count1 = UserMapper.deleteByPrimaryKey(uid);
        List<OrderVO> orderVOList = orderMapper.selectByUserId(uid);
        for(OrderVO orderVO: orderVOList){
            Integer oid = orderVO.getOid();
            orderMapper.deleteByPrimaryKey(oid);
            orderProductMapper.deleteByOrderId(oid);
            orderShipmentMapper.deleteByOrderId(oid);
            orderStateMapper.deleteByOrderId(oid);
        }
        return count1;
    }

}
