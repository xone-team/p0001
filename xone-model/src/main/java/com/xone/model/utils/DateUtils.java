/**
 * DateUtils.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-3-19
 *
 */
package com.xone.model.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Hunny
 * @created 2011-3-19 下午11:05:17
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class DateUtils {

	public static final String format(Date date, String format) {
		String result = null;
		try {
			result = new SimpleDateFormat(format).format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static final String format(Date date) {
		return format(date, "yyyy-MM-dd HH:mm:ss");
	}
}
