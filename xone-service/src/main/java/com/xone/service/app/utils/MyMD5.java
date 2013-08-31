package com.xone.service.app.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MyMD5 {

	protected final static String HEX_BASE = "0123456789ABCDEF";
	
	public static String getMD5(String val) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(val.getBytes());
			byte[] m = md5.digest();// 加密
			return toHex(m);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return val;
	}

	public static String toHex(byte[] buf) {
		if (buf == null) {
			return "";
		}
		StringBuffer result = new StringBuffer(2 * buf.length);
		for (int i = 0; i < buf.length; i++) {
			appendForHex(result, buf[i]);
		}
		return result.toString();
	}

	protected static void appendForHex(StringBuffer buffer, byte bByte) {
		buffer.append(HEX_BASE.charAt((bByte >> 4) & 0x0f)).append(HEX_BASE.charAt(bByte & 0x0f));
	}
	
}
