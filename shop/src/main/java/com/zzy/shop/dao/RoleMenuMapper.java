package com.zzy.shop.dao;

import com.zzy.shop.po.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(Integer rmid);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(Integer rmid);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);
}