package student_manage;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lzl.common.PageBean;
import com.lzl.sys.model.SysMenu;
import com.lzl.sys.model.SysRole;
import com.lzl.sys.model.SysUser;
import com.lzl.sys.service.ISysMenuService;
import com.lzl.sys.service.ISysUserService;

public class TestRole {

	@Test
	public void testRole() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:spring/spring.xml");
		ISysMenuService menuSerice=(ISysMenuService) ctx.getBean("sysMenuService");
		PageBean pageBean = new PageBean();
		pageBean.setStart(1);
		pageBean.setPageSize(10);
		//PageBean list = menuSerice.getMenuList(pageBean, new SysMenu());
	//	System.out.println(list);
		/*SysUser user = new SysUser();
		user.setUserid(1L);
		SysRole role = new SysRole();
		role.setRoleid(3L);
		role.setStatus(0);
		user.getRoleList().add(role);*/
//		List<SysMenu> list = menuSerice.getRoleMenu(user);
//		list.forEach(m->{
//			System.out.println(m.getMenuname());
//		});
		/*ISysUserService userService=(ISysUserService) ctx.getBean("sysUserService");
		SysUser sysUser = userService.doUserLogin("lzl", "lzl");
		System.out.println(sysUser);*/
	}
}
