package com.xone.service.app.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyServerUtils {
	
	public static final Long parseLong(String v, Long defaultValue) {
		try {
			return Long.parseLong(v);
		} catch (Exception e) {
		}
		return defaultValue;
	}
	
	public static final Long parseLong(String v) {
		return parseLong(v, 0l);
	}
	
	public static final Integer parseInteger(String v, Integer defaultValue) {
		try {
			return Integer.parseInt(v);
		} catch (Exception e) {}
		return defaultValue;
	}
	
	public static final Integer parseInteger(String v) {
		return parseInteger(v, 0);
	}
	

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
	
	public static final Date parseDate(String date, String pattern) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat();
		simpleDateFormat.applyPattern(pattern);
		try {
            return simpleDateFormat.parse(date);
        } catch (Exception e) {
            e.printStackTrace();
        }
		return null;
	}

}
