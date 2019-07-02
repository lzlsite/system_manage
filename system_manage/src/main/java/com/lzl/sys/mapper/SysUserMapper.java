package com.lzl.sys.mapper;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lzl.sys.model.SysUser;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午2:36:35
 * @Description:系统用户数据访问接口
 */
public interface SysUserMapper extends BaseMapper<SysUser> {

	/**
	 * 用户登录
	 * @param loginName
	 * @param password
	 * @return
	 */
	 SysUser doUserLogin(@Param("loginName")String loginName,@Param("password")String password);
	
}