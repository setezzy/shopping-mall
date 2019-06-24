package com.zzy.shop.service;

import com.zzy.shop.po.User;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.annotation.Resource;
import com.alibaba.fastjson.JSON;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/spring-mvc.xml"})

public class UserServiceTest {

    private static Logger log = LoggerFactory.getLogger(UserServiceTest.class);

    @Resource
    private UserService userService = null;

    @Test
    public void test1() {
        User user = userService.selectUser("sophia","1qaz");
        String password = user.getPassword();

        Assert.assertEquals("1qaz", password);
        log.info(JSON.toJSONString(user));

    }
}