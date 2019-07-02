package com.lzl.sys.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.lzl.sys.model.SysMenu;
import com.lzl.sys.model.SysUser;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午3:14:29
 * @Description:系统菜单服务接口
 */
public interface ISysMenuService extends IService<SysMenu> {

	List<SysMenu> getRoleMenu(SysUser sysUser);
	List<SysMenu> getMenuList(SysMenu sysMenu);
    List<SysMenu> getParentMenus(SysMenu sysMenu);
    String addSysMenu(SysMenu menu,SysUser user);
}
