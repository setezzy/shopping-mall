package com.zzy.shop.service;

import com.zzy.shop.po.User;

public interface UserService {

    void insertUser(User user);

    User selectUser(String uname, String password);

    int updateUser(User user);
}
