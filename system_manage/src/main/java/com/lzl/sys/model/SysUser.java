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
 * @Date: 2019年6月24日下午2:51:08
 * @Description:系统用户实体类
 */
@TableName("sys_user")
public class SysUser implements Serializable{

	private static final long serialVersionUID = 1L;
	/**
	 * 用户Id
	 */
	@TableId(value = "userid", type = IdType.AUTO)
	private Long userid;
	/**
	 * 地址
	 */
    private String address;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 生日
     */
    private Date birthday;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 登录名
     */
    private String loginname;
    /**
     * 登录密码
     */
    private String password;
    /**
     * 性别
     */
    private String sex;
    /**
     * 电话
     */
    private String tell;
    /**
     * 昵称
     */
    private String username;
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
     * 角色集合
     */
    @TableField(exist = false)
    private List<SysRole> roleList;
    
    
    public SysUser() {
		super();
	}

	public SysUser(Long userid, String address, Integer age, Date birthday, String email, String loginname,
			String password, String sex, String tell, String username, Long createBy, Date createDate, Long updateBy,
			Date updateDate, Integer status) {
		super();
		this.userid = userid;
		this.address = address;
		this.age = age;
		this.birthday = birthday;
		this.email = email;
		this.loginname = loginname;
		this.password = password;
		this.sex = sex;
		this.tell = tell;
		this.username = username;
		this.createBy = createBy;
		this.createDate = createDate;
		this.updateBy = updateBy;
		this.updateDate = updateDate;
		this.status = status;
	}

	public List<SysRole> getRoleList() {
    	if(roleList==null) {
    		roleList=new ArrayList<SysRole>();
    	}
		return roleList;
	}

	public void setRoleList(List<SysRole> roleList) {
		this.roleList = roleList;
	}

	public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTell() {
        return tell;
    }

    public void setTell(String tell) {
        this.tell = tell == null ? null : tell.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
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