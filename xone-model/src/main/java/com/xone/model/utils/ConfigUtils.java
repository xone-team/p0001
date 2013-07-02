/**
 * ConfigUtils.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-4-3
 *
 */
package com.xone.model.utils;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-4-3 上午11:09:55
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class ConfigUtils {
	public static final String STATIC_ROOT = "/xone-statics";//静态根目录
	
	public static String getStaticRoot() {
		return STATIC_ROOT;
	}
	
	public static String getStaticRoot(String prefix) {
		return prefix + getStaticRoot();
	}
}
