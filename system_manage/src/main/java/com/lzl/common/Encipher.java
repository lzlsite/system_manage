package com.lzl.common;

import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Encoder;
/**
 * 
 * @author: lzl
 * @Date: 2018年10月30日下午9:42:00
 * @Description:密码加密工具类 先进行散列加密然后再使用Base64转义
 */
public class Encipher {

	public static String encryptPassword(String password){
		String pass = null;
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes("UTF-8"));
			byte[] b=md.digest();
		 Encoder encoder = Base64.getEncoder();
		  pass = encoder.encodeToString(b);
		} catch (Exception e) {			
			e.printStackTrace();
		}		
		return pass;
	}
	public static void main(String[] args) {
		String s = encryptPassword("lzl");
		System.out.println(s);
	}
}
