/**
 * EncryptRef.java
 *
 * Copyright 2008-2013 Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2013-7-2
 *
 */
package com.xone.service.app.utils;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-19 下午11:04:20
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class EncryptRef {

	/**
	 * sha1加密方法
	 * @param crypt
	 * @return
	 */
	public static String SHA1(String crypt) {
		if (null == crypt) {
			return null;
		}
		try {
			MessageDigest sha1 = MessageDigest.getInstance("SHA1");
			sha1.update(crypt.getBytes());
			crypt = new BigInteger(1, sha1.digest()).toString(32);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return crypt;
	}
	
}
