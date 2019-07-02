package com.lzl.sys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lzl.sys.service.ISysRoleService;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午3:17:12
 * @Description:系统角色前端控制器
 */
@Controller
@RequestMapping("/sysRole")
public class SysRoleController {

	@Autowired
	private ISysRoleService sysRoleService;
}
