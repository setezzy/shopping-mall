package com.zzy.shop.dao;

import com.zzy.shop.po.RoleMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(Integer rmid);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(Integer rmid);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);

    // 插入角色权限
    int insertRoleMenus(List<RoleMenu> roleMenus);

}