package com.zzy.shop.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import com.zzy.shop.po.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring-mvc.xml"})

public class UserMapperTest {

    @Resource
    private UserMapper UserMapper;

    @Test
    public void insert() throws Exception{
        User user = new User();
        user.setUname("test1");
        user.setPassword("123");
        int result = UserMapper.insert(user);
        System.out.println(result);
        assert (result == 1);
    }

}