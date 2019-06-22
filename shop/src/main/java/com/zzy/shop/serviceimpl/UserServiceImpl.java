package com.zzy.shop.serviceimpl;

import com.zzy.shop.dao.UserMapper;
import com.zzy.shop.po.User;
import com.zzy.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper UserMapper;

    @Override
    public void insertUser(User user){
        UserMapper.insertSelective(user);
    }

    @Override
    public User selectUser(String uname, String password){
        User user = UserMapper.selectByName(uname);
        return user;
    }

    @Override
    public void updateUser(User user){
        UserMapper.updateByPrimaryKeySelective(user);
    }

}
