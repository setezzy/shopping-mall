package com.zzy.shop.dao;

import com.zzy.shop.po.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}