/**
 * StringUtils.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-19
 *
 */
package com.xone.model.utils;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-3-19 下午11:01:24
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class StringUtils {
	
	public static int parseInt(String v, int dv) {
		try {
			dv = Integer.parseInt(v);
		} catch (Exception e) {
		}
		return dv;
	}
	
	public static String trim(String v) {
		if (null == v) {
			return "";
		}
		return v.trim();
	}

}
