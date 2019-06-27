package com.zzy.shop.dao;

import com.github.pagehelper.Page;
import com.zzy.shop.po.Admin;
import com.zzy.shop.util.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin selectByName(String uname);

}