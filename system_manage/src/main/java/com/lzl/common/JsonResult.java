package com.lzl.common;

import java.io.Serializable;

/**
 * 
 * @Title com.lzl.common.JsonResult.java
 * @author lizhilun
 * @Date 2019年7月1日 下午10:58:39
 * @Descrption 用于封装返回的结果
 * @Version V-1.0
 */
public class JsonResult implements Serializable{

	private static final long serialVersionUID = 1L;
	private boolean status;//返回状态
	private String message;//返回信息
	private String returnCode;//响应码
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getReturnCode() {
		return returnCode;
	}
	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}

	
	
	
}
