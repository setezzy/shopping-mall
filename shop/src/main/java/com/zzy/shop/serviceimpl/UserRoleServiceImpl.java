package com.zzy.shop.serviceimpl;

import com.zzy.shop.dao.UserRoleMapper;
import com.zzy.shop.po.UserRole;
import com.zzy.shop.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    UserRoleMapper userRoleMapper;

    @Override
    public int getRole(Integer uid){
        Integer rid = userRoleMapper.selectRoleByUserId(uid);
        return rid;
    }

    public int updateUserRole(UserRole userRole){
        Integer count = userRoleMapper.updateRole(userRole);
        return count;
    }
}
