package com.zzy.shop.dao;

import com.zzy.shop.po.UserRole;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer urid);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer urid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
}