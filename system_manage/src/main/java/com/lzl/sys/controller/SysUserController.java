package com.lzl.sys.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.lzl.sys.model.SysUser;
import com.lzl.sys.service.ISysUserService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 *  用户前端控制器
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
    private Logger logger = Logger.getLogger(SysUserController.class);

    @Autowired
    private ISysUserService userService;

    /**
     * 返回到JSP
     * @return
     */
    @RequestMapping("index")
	public ModelAndView index(){
        ModelAndView mv = new ModelAndView("index");
        logger.info("进来了");
        List<SysUser> userList = userService.selectList(new EntityWrapper<SysUser>());
        for (SysUser user:userList) {
            System.out.println(user.toString());
        }
        mv.addObject("userList",userList);
        return mv;
    }
}
