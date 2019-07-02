package com.lzl.sys.service.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.lzl.common.PageBean;
import com.lzl.sys.mapper.SysMenuMapper;
import com.lzl.sys.model.SysMenu;
import com.lzl.sys.model.SysUser;
import com.lzl.sys.service.ISysMenuService;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午3:15:41
 * @Description:系统菜单服务实现类
 */
@Service
public class SysMenuService extends ServiceImpl<SysMenuMapper, SysMenu> implements ISysMenuService{

	@Autowired
	private SysMenuMapper sysMenuMapper;
	/**
	 * 查询当前登录用户所属角色拥有的菜单权限
	 */
	@Override
	public List<SysMenu> getRoleMenu(SysUser sysUser) {
		List<SysMenu> rtlist= new ArrayList<SysMenu>();
		List<SysMenu> list = sysMenuMapper.getRoleMenu(sysUser);
		for(SysMenu m1:list) {
			if(m1.getLeav()==1&&"menu".equals(m1.getType())) {//一级菜单
				for(SysMenu m2:list) {
					if(m2.getPid()==m1.getMenuid()&&"menu".equals(m2.getType())) {//二级菜单
								m1.getMenuList().add(m2);
					}
				}
				rtlist.add(m1);
			}
		}
		return rtlist;
	}
	/**
	 * 查询菜单带分页
	 */
	@Override
	public List<SysMenu> getMenuList( SysMenu sysMenu) {
		List<SysMenu> list = sysMenuMapper.getMenuList(sysMenu);
		return list;
	}
	/**
	 * 查询父菜单
	 */
	@Override
	public List<SysMenu> getParentMenus(SysMenu sysMenu) {
		List<SysMenu> list = sysMenuMapper.getMenuList(sysMenu);
		return list;
	}
	/**
	 * 新增菜单
	 * @param menu
	 * @return
	 */
	public String addSysMenu(SysMenu menu,SysUser user) {
		Integer i=0;
		if(menu!=null) {
		    menu.setCreateDate(new Date());
		    if(user!=null) {
		    	menu.setCreateBy(user.getUserid());
		    }
			if(menu.getPid()!=null&&menu.getPid()!=0&&menu.getLeav()>1) {
				SysMenu m2 = new SysMenu();
				m2.setMenuid(menu.getPid());
				List<SysMenu> list = sysMenuMapper.getMenuList(m2);
				if(list!=null&&list.size()>0) {
					SysMenu sysMenu = list.get(0);
					String parent_ids = sysMenu.getParent_ids();
					parent_ids=parent_ids==null?"":parent_ids;
					menu.setParent_ids(parent_ids+"/"+menu.getPid());
				    i = sysMenuMapper.insert(menu);
				}
			}else {
				 i = sysMenuMapper.insert(menu);
			}
		}
		return i>0?"添加成功":"添加失败";
	}
}
