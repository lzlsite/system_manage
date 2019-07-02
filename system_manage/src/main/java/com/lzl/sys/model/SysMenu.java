package com.lzl.sys.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
/**
 * 
 * @author: lzl
 * @Date: 2019年6月24日下午2:37:50
 * @Description:系统菜单实体类
 */
@TableName("sys_menu")
public class SysMenu implements Serializable{
	private static final long serialVersionUID = 1L;
	/**
	 * 菜单主键
	 */
	@TableId(value = "menuid", type = IdType.AUTO)
	private Long menuid;
	/**
	 * 菜单图标
	 */
	private String icon;
	/**
	 * 菜单名称
	 */
	private String menuname;
	/**
	 * 父菜单Id
	 */
	private Long pid;
	/**
	 * 跳转地址
	 */
	private String url;
	/**
	 * 父Id集合
	 */
	private String parent_ids;
	/**
	 * 菜单类 menu-菜单 button-按钮
	 */
	private String type;
	/**
	 * 菜单权限
	 */
	private String permission;
	/**
	 * 创建人
	 */
	@TableField("createBy")
	private Long createBy;
	/**
	 * 创建时间
	 */
	@TableField("createDate")
	private Date createDate;
	/**
	 * 修改人
	 */
	@TableField("updateBy")
	private Long updateBy;
	/**
	 * 修改时间
	 */
	@TableField("updateDate")
	private Date updateDate;
	/**
	 * 可用状态
	 */
	private Integer status;
	/**
	 * 菜单层级
	 */
	private Integer leav;
	/**
	 * 角色集合
	 */
	@TableField(exist=false)
	private List<SysRole> roleList;
	/**
	 * 自关联菜单集合
	 */
	@TableField(exist=false)
	private List<SysMenu> menuList;
	public SysMenu() {
		super();
	}

	public SysMenu(Long menuid, String icon, String menuname, Long pid, String url, String parent_ids, String type,
			String permission, Long createBy, Date createDate, Long updateBy, Date updateDate, Integer status,
			Integer leav, List<SysRole> roleList, List<SysMenu> menuList) {
		super();
		this.menuid = menuid;
		this.icon = icon;
		this.menuname = menuname;
		this.pid = pid;
		this.url = url;
		this.parent_ids = parent_ids;
		this.type = type;
		this.permission = permission;
		this.createBy = createBy;
		this.createDate = createDate;
		this.updateBy = updateBy;
		this.updateDate = updateDate;
		this.status = status;
		this.leav = leav;
		this.roleList = roleList;
		this.menuList = menuList;
	}

	public Integer getLeav() {
		return leav;
	}

	public void setLeav(Integer leav) {
		this.leav = leav;
	}

	public List<SysMenu> getMenuList() {
		if(menuList==null) {
			menuList=new ArrayList<SysMenu>();
		}
		return menuList;
	}

	public void setMenuList(List<SysMenu> menuList) {
		this.menuList = menuList;
	}

	public List<SysRole> getRoleList() {
		if(roleList==null) {
			roleList= new ArrayList<SysRole>();
		}
		return roleList;
	}

	public void setRoleList(List<SysRole> roleList) {
		this.roleList = roleList;
	}

	public Long getMenuid() {
		return menuid;
	}

	public void setMenuid(Long menuid) {
		this.menuid = menuid;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon == null ? null : icon.trim();
	}

	public String getMenuname() {
		return menuname;
	}

	public void setMenuname(String menuname) {
		this.menuname = menuname == null ? null : menuname.trim();
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public String getParent_ids() {
		return parent_ids;
	}

	public void setParent_ids(String parent_ids) {
		this.parent_ids = parent_ids == null ? null : parent_ids.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission == null ? null : permission.trim();
	}

	public Long getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Long getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(Long updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	
}