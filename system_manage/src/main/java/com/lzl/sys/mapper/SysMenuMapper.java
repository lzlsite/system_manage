package com.lzl.sys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.lzl.sys.model.SysMenu;
import com.lzl.sys.model.SysUser;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午2:35:13
 * @Description:系统菜单数据访问接口
 */
public interface SysMenuMapper extends BaseMapper<SysMenu>{
    /**
     * 查询当前登录所属角色拥有的权限
     * @param sysUser
     * @return
     */
	List<SysMenu> getRoleMenu(SysUser sysUser);
	/**
	 * 查询菜单
	 * @param pageBean
	 * @param sysMenu
	 * @return
	 */
	List<SysMenu> getMenuList(@Param("searchBean")SysMenu sysMenu);
	/**
	 * 查询父菜单
	 * @param sysMenu
	 * @return
	 */
	List<SysMenu> getParentMenus(SysMenu sysMenu);
}