package com.zzy.shop.serviceimpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zzy.shop.dao.UserMapper;
import com.zzy.shop.po.Admin;
import com.zzy.shop.po.UserRole;
import com.zzy.shop.dao.AdminMapper;
import com.zzy.shop.dao.UserRoleMapper;
import com.zzy.shop.service.AdminService;
import com.zzy.shop.util.PageInfo;
import com.zzy.shop.vo.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AdminServiceImpl implements AdminService{

    private Page<UserVO> l ;

    public Page<UserVO> getL() {
        return l;
    }

    public void setL(Page<UserVO> l) {
        this.l = l;
    }


    @Autowired
    AdminMapper adminMapper;
    @Autowired
    UserRoleMapper userRoleMapper;

    @Override
    public void insertAdmin(Admin admin, UserRole userRole){
        adminMapper.insertSelective(admin);
        userRoleMapper.insertSelective(userRole);
    }

    @Override
    public Admin selectUser(String uname, String password){
        Admin admin = adminMapper.selectByName(uname);
        return admin;
    }
    

    @Override
    public int updateUser(Admin admin){
        int count = adminMapper.updateByPrimaryKeySelective(admin);
        return count;
    }

    @Override
    public int deleteByUserId(Integer uid){
        UserRole userRole = new UserRole();
        userRole.setUid(uid);
        userRoleMapper.deleteByPrimaryKey(userRole.getUrid());

        return adminMapper.deleteByPrimaryKey(uid);
    }

    public List<UserVO> getUsers(Integer rid, Integer page, Integer limit){
        PageHelper.startPage(page, limit);
        List<UserVO> list = adminMapper.selectAll(rid);
        this.l = (Page<UserVO>)list;
        return list;
    }
}
