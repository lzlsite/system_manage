package com.lzl.sys.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午5:18:18
 * @Description:shiro的Realm类
 */
public class ShiroRealm extends AuthorizingRealm{
	/**
	 * 登录认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		/*//得到令牌
		 UsernamePasswordToken token = (UsernamePasswordToken) at;  
	      // 通过表单接收的用户名  
	     String username = token.getUsername();  
	     AuthenticationInfo info = null;//授权信息
	     if (username != null && !"".equals(username)) {  
	            User user = userService.getUserByLoginName(username);
	            if (user != null) {  
	            	//盐值：取用户信息中唯一的字段来生成盐值，避免由于两个用户原始密码相同，加密后的密码也相同
	            	ByteSource credentialsSalt = ByteSource.Util.bytes(username);//这里的参数要给个唯一的;
	            	info = new SimpleAuthenticationInfo(user.getLoginName(), user.getPass(), credentialsSalt, getName());
	            
	            }else{
	            	throw new UnknownAccountException("用户不存在！");
	            }
	        }  
		return info;*/
		return null;
	}
	/**
	 * 登录授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		/* //根据自己系统规则的需要编写获取授权信息 
        String username = (String) pc.fromRealm(getName()).iterator().next();  
        if (username != null) { 
        	 SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(); 
        	List<SysMenu> menus = userService.queryMenus(username);
        	for (SysMenu sysMenu : menus) {
        		//将权限的key值放入授权信息中比如:dept:delete
        		info.addStringPermission(sysMenu.getPermission());
			}
        	return info;  
        }  */
		return null;
	}

	

}
