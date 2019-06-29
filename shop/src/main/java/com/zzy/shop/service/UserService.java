package com.zzy.shop.service;

import com.zzy.shop.po.User;
import com.zzy.shop.vo.UserVO;

import java.util.List;

public interface UserService {

    int insertUser(User user);

    User selectUser(String uname, String password);

    int updateUser(User user);

    // 显示个人信息
    List<UserVO> getUsers(Integer page, Integer limit);
}
