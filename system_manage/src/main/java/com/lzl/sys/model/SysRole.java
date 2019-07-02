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
 * @Date: 2019年6月24日下午2:40:33
 * @Description:系统角色实体类
 */
@TableName("sys_role")
public class SysRole implements Serializable{

	private static final long serialVersionUID = 1L;
	/**
	 * 角色Id
	 */
	@TableId(value = "roleid", type = IdType.AUTO)
	private Long roleid;
	/**
	 * 角色名称
	 */
	private String rolename;
	/**
	 * 备注
	 */
	private String remark;
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
	 * 用户集合
	 */
	@TableField(exist = false)
    private List<SysUser> userList;
    /**
     * 菜单集合
     */
	@TableField(exist = false)
    private List<SysMenu> menuList;
    
	public List<SysUser> getUserList() {
		if(userList==null) {
			userList=new ArrayList<SysUser>();
		}
		return userList;
	}

	public void setUserList(List<SysUser> userList) {
		this.userList = userList;
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

	public Long getRoleid() {
		return roleid;
	}

	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename == null ? null : rolename.trim();
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
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

	public SysRole(Long roleid, String rolename, String remark, Long createBy, Date createDate, Long updateBy,
			Date updateDate, Integer status, List<SysUser> userList, List<SysMenu> menuList) {
		super();
		this.roleid = roleid;
		this.rolename = rolename;
		this.remark = remark;
		this.createBy = createBy;
		this.createDate = createDate;
		this.updateBy = updateBy;
		this.updateDate = updateDate;
		this.status = status;
		this.userList = userList;
		this.menuList = menuList;
	}

	public SysRole() {
		super();
	}
	
}