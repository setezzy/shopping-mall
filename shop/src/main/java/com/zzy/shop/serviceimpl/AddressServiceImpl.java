package com.zzy.shop.serviceimpl;

import java.util.List;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import com.zzy.shop.po.Address;
import com.zzy.shop.dao.AddressMapper;
import com.zzy.shop.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressMapper addressMapper;
    private Page<Address> addressPage;

    public Page<Address> getAddressPage(){
        return addressPage;
    }

    public void setAddressPage(Page<Address> addressPage){
        this.addressPage = addressPage;
    }

    @Override
    public List<Address> listAddress(Integer uid){
        List<Address> addressList = addressMapper.selectByUserId(uid);
        return addressList;
    }

    @Override
    public Address getAddress(Integer addrid){
        Address address = addressMapper.selectByAddressId(addrid);
        return address;
    }

    @Override
    public int insertAddress(Address address){
        int count = addressMapper.insertSelective(address);
        return count;
    }

    @Override
    public int updateAddress(Address address){
        int count = addressMapper.updateByPrimaryKeySelective(address);
        return count;
    }

    @Override
    public int deleteAddress(Integer addrid){
        int count = addressMapper.deleteByPrimaryKey(addrid);
        return count;
    }

    //分页查询收货地址
    public List<Address> pageAddressInfo(Integer page, Integer limit, Integer uid) {
        PageHelper.startPage(page, limit);
        List<Address> addressList = addressMapper.selectByUserId(uid);
        this. addressPage = (Page<Address>)addressList;
        return addressList;
    }

}
