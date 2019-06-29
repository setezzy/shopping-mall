package com.zzy.shop.dao;

import com.zzy.shop.po.Role;
import com.zzy.shop.po.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserRoleMapper {
    int deleteByPrimaryKey(Integer urid);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer urid);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);

    // 插入用户角色记录
    int insertUserRoles(@Param("userRoles") List<UserRole> userRoles);

    // 根据管理员id查找角色列表
    List<Role> listByUserId(@Param("uid") Integer uid, @Param("state") Integer state);

    // 由管理员id查找角色
    int selectRoleByUserId(Integer uid);

    int updateRole(UserRole userRole);

}