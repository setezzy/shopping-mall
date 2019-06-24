package com.zzy.shop.service;

import com.zzy.shop.po.Address;

import java.util.List;

public interface AddressService {

    List<Address> listAddress(Integer uid);

    Address getAddress(Integer uid);

    int insertAddress(Address address);

    int updateAddress(Address address);

    int deleteAddress(Integer addrid);
}
