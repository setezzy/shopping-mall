package com.zzy.shop.dao;

import com.zzy.shop.po.Address;

import java.util.List;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer addrid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer addrid);

    List<Address> selectByUserId(Integer uid);

    Address selectByAddressId(Integer addrid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);
}