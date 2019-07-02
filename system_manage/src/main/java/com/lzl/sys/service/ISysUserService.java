package com.lzl.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.lzl.sys.model.SysUser;

/**
 *  用户业务逻辑接口
 */
public interface ISysUserService extends IService<SysUser> {
	
	public SysUser doUserLogin(String loginName,String password);
}
