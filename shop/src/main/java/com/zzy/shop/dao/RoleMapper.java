package com.zzy.shop.dao;

import com.zzy.shop.po.Role;
import com.zzy.shop.util.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer rid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer rid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> listByPage(@Param("pageInfo")PageInfo pageInfo, @Param("search") String search, RowBounds rowBounds);
}