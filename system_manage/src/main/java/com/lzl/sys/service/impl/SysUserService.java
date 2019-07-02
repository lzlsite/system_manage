package com.lzl.sys.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lzl.common.Encipher;
import com.lzl.sys.mapper.SysUserMapper;
import com.lzl.sys.model.SysUser;
import com.lzl.sys.service.ISysUserService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午3:13:27
 * @Description:系统用户服务实现类
 */
@Service
public class SysUserService extends ServiceImpl<SysUserMapper, SysUser> implements ISysUserService {

	@Autowired
	private SysUserMapper sysUserMapper;
	/**
	 * 用户登录
	 */
	@Override
	public SysUser doUserLogin(String loginName, String password) {
		if(StringUtils.isNotBlank(password)) {
			password=Encipher.encryptPassword(password);//密码加密
		}
		SysUser user = sysUserMapper.doUserLogin(loginName, password);
		return user;
	}
	
}
