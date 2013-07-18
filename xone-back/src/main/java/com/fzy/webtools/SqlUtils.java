package com.fzy.webtools;

public class SqlUtils {
	public static String DB_TYPE = "ORACLE";
	public static final String DB_H2 = "H2";
	public static final String DB_ORACLE = "ORACLE";
	public static final String DB_SQLSERVER = "SQLSERVER";
	public static final String DB_MYSQL = "MYSQL";
	
	public static final String PATTERN_TIME_ORACLE = "hh24miss";
	public static final String PATTERN_TIME = "hhmmss";
	
	public static String getDbTypeByDriver(String driverClassName){
		if(StringUtils.isBlank(driverClassName)) return null;
		if(driverClassName.indexOf("h2") > -1) return DB_H2;
		if(driverClassName.indexOf("oracle") > -1) return DB_ORACLE;
		return null;
	}

	public static String toNumber(String src) {
		if (DB_H2.equalsIgnoreCase(DB_TYPE))
			return "CONVERT(" + src + ",INT)";
		else
			return "TO_NUMBER(" + src + ")";
	}

	public static String formatDate(String src,String format) {
		if (DB_H2.equalsIgnoreCase(DB_TYPE))
			return "FORMATDATETIME(" + src + ",'"+format+"')";
		else
			return "TO_CHAR(" + src + ",'"+format+"')";
	}

	public static String nvl(String src,String defaultValue) {
		if (DB_H2.equalsIgnoreCase(DB_TYPE))
			return "NULLIF(" + src + ","+defaultValue+")";
		else
			return "NVL(" + src + ","+defaultValue+")";
	}

	public static String nextval(String name) {
		if (DB_H2.equalsIgnoreCase(DB_TYPE))
			return "NEXTVAL('" + name + "')";
		else
			return name + ".nextval";
	}

	public static String currentDate() {
		if (DB_H2.equalsIgnoreCase(DB_TYPE))
			return "CURRENT_DATE()";
		else
			return "sysdate";
	}
	
	public static String timePattern(){
		if (DB_ORACLE.equalsIgnoreCase(DB_TYPE))
			return PATTERN_TIME_ORACLE;
		else
			return PATTERN_TIME;
	}
}
