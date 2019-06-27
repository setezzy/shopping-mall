package com.zzy.shop.service;

import com.zzy.shop.po.Admin;
import com.zzy.shop.po.UserRole;
import com.zzy.shop.util.PageInfo;

import java.util.List;

public interface AdminService {

    void insertAdmin(Admin admin, UserRole userRole);

    Admin selectUser(String uname, String password);

    int updateUser(Admin admin);

    int deleteByUserId(Integer uid);


}
