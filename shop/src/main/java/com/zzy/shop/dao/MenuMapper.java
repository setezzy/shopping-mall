package com.zzy.shop.dao;

import com.zzy.shop.po.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    List<Menu> listByType(Integer mtype);

    Integer updateStateByIds(@Param("mids") List<Integer> mids, @Param("state") Integer state);

    Integer deleteRoleMenus(List<Integer> mids);
}