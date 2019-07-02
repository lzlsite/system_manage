package com.lzl.sys.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lzl.sys.model.SysMenu;
import com.lzl.sys.model.SysUser;
import com.lzl.sys.service.ISysMenuService;
import com.lzl.sys.service.ISysUserService;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午4:51:11
 * @Description:系统登录控制器
 */
@Controller
@RequestMapping("/")
public class LoginController {
	@Autowired
	private ISysUserService sysUserService;
	@Autowired
	private ISysMenuService sysMenuService;
	/**
	 * 跳转系统用户登录
	 * @return
	 */
	@GetMapping("login")
	public String toLogin() {
		return "login";
	}
	/**
	 * 用户登录
	 * @param loginName
	 * @param password
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping("doLogin")
	public ModelAndView doLogin(String loginName,String password,ModelAndView mv,HttpSession session) {
		SysUser user = sysUserService.doUserLogin(loginName, password);
		if(user==null) {
			mv.setViewName("login");
			mv.addObject("result", "用户名或密码错误");
			return mv;
		}
		List<SysMenu> menus = sysMenuService.getRoleMenu(user);
		mv.setViewName("index");
		mv.addObject("menus", menus);
		session.setAttribute("user", user);
		return mv;
	}
	
	
	/*@RequestMapping("/login")
	public String login(User user,HttpServletRequest request,HttpSession sesson){
	     // 创建令牌 登录后存放进shiro token  
	     UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPass());  
	     //得到Subject及创建用户名/密码身份验证Token（即用户身份/凭证)
	     Subject subject = SecurityUtils.getSubject();  
	      //登录，即身份验证 
	     subject.login(token);
	     //放入session
	     sesson.setAttribute("user", subject.getPrincipal());
		return "index.jsp";
	}*/
}
