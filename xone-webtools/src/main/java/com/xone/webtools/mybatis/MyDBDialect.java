package com.xone.webtools.mybatis;

public abstract class MyDBDialect {
	
	public enum DialectType {
		MYSQL, ORACLE, DB2
	}
	
	public abstract String getLimitResult(String sql, int skipResult, int maxResult);

}
