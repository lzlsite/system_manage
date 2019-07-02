package com.lzl.sys.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.plugins.Page;
import com.lzl.common.PageBean;
import com.lzl.common.SystemContants;
import com.lzl.sys.model.SysMenu;
import com.lzl.sys.model.SysUser;
import com.lzl.sys.service.ISysMenuService;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午3:19:11
 * @Description:系统菜单前端控制器
 */
@Controller
@RequestMapping("/sysMenu")
public class SysMenuController {

	@Autowired
	private ISysMenuService sysMenuService;
	
	/**
	 * 跳转菜单页面
	 */
	@GetMapping("toMenuList")
	public String toMenus() {
		return "sys/menu/menu_list";
	}
	/**
	 * 查询菜单带分页
	 */
	@ResponseBody
	@RequestMapping("doMenuList")
	public PageBean doMenuList(PageBean pageBean,SysMenu menu) {
		 Page<SysMenu> page = new Page<>(pageBean.getStart(),pageBean.getPageSize());
		 page.setRecords(sysMenuService.getMenuList(menu));
		 pageBean.setTotal(page.getRecords().size());//设置记录条数
		 pageBean.setRows(page.getRecords());
		return pageBean;
	}
	/**
	 * 查询所有菜单
	 */
	@ResponseBody
	@RequestMapping("getAllMenus")
	public List<SysMenu> getAllMenus() {
		List<SysMenu> list = sysMenuService.getMenuList(null);
		return list;
	}
	/**
	 * 查询父级菜单
	 * @param menu
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getParentMenu")
	public List<SysMenu> getParentMenu(SysMenu menu){
		List<SysMenu> list = sysMenuService.getParentMenus(menu);
		return list;
	}
	
	/**
	 * 跳转新增
	 * @return
	 */
	@GetMapping("toMenuAdd")
	public String toMenuAdd() {
		return "sys/menu/menu_add";
	}
	/**
	 * 执行新增
	 * @return
	 */
	@PostMapping("doMenuAdd")
	@ResponseBody
	public String doMenuAdd(SysMenu menu,HttpSession session) {
		SysUser user=(SysUser) session.getAttribute(SystemContants.LOGIN_USER);
		String result = sysMenuService.addSysMenu(menu, user);
		return result;
	}
}
