package com.zzy.shop.controller;

import com.zzy.shop.po.Admin;
import com.zzy.shop.po.UserRole;
import com.zzy.shop.serviceimpl.AdminServiceImpl;
import com.zzy.shop.serviceimpl.UserRoleServiceImpl;
import com.zzy.shop.serviceimpl.UserServiceImpl;
import com.zzy.shop.util.PageInfo;
import com.zzy.shop.util.Result;
import com.zzy.shop.vo.UserVO;
import com.zzy.shop.po.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/admin")
public class AdminUserController {

    @Autowired
    UserRoleServiceImpl userRoleServiceImpl;
    @Autowired
    UserServiceImpl userServiceImpl;
    @Autowired
    AdminServiceImpl adminServiceImpl;

    @RequestMapping("/user")
    @ResponseBody
    public Object userCheck(HttpServletRequest request, HttpSession session){

        Admin admin = (Admin) session.getAttribute("admin");
        Integer uid = admin.getUid();
        Integer rid = userRoleServiceImpl.getRole(uid);
        if(rid != 1){
            return new Result(0,"您没有该权限");
        }else{
            return new Result(1, "");
        }

    }

    @RequestMapping("/user/list")
    public String userUI(HttpServletRequest request, HttpSession session,
                         @RequestParam(value = "rid", required = false, defaultValue = "0") Integer rid,
                         @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                         @RequestParam(value = "limit", required = false, defaultValue = "10") Integer limit){

        List<UserVO> userVOList;

        PageInfo pageInfo = new PageInfo(page.intValue(), limit.intValue(), "", "");

        if(rid == 0){
            userVOList = userServiceImpl.getUsers(page, limit);
            pageInfo.setTotal((int)userServiceImpl.getL().getTotal());
        }
        else{
            userVOList = adminServiceImpl.getUsers(rid, page, limit);
            pageInfo.setTotal((int)adminServiceImpl.getL().getTotal());
        }

        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("userVOList", userVOList);
        request.setAttribute("rid", rid);

        return "/admin/user/list";
    }

    @RequestMapping("/user/insert")
    public String createUser(){
        return "/admin/user/new_user";
    }

    @RequestMapping(value = "/user/update", method = RequestMethod.POST)
    @ResponseBody
    public Object createNewUser(User user){
        int count = userServiceImpl.insertUser(user);

        if(count == 1) {
            return new Result(1, "添加用户成功");
        } else {
            return new Result(0, "添加用户失败");
        }
    }

    @RequestMapping(value = "/user/delete/{uid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Object deleteUser(@PathVariable("uid") Integer uid){
        Integer count = userServiceImpl.deleteUser(uid);
        if(count == 1) {
            return new Result(1, "删除用户成功");
        } else {
            return new Result(0, "删除用户失败");
        }
    }

    @RequestMapping(value = "/user/modify")
    public String modify(@RequestParam(value = "uid", required = false) Integer uid,
                         HttpServletRequest request){
        request.setAttribute("uid", uid);
        return "/admin/user/modify";
    }

    @RequestMapping(value = "/user/modifyUser", method = RequestMethod.POST)
    @ResponseBody
    public Object modifyAdmin(UserRole userRole){
        int count = userRoleServiceImpl.updateUserRole(userRole);
        if(count == 1) {
            return new Result(1, "修改成功");
        } else {
            return new Result(0, "修改失败");
        }
    }

}
