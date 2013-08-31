package com.xone.model.sqlmap;

public abstract class MyDBDialect {
	
	public enum DialectType {
		MYSQL, ORACLE, DB2
	}
	
	public abstract String getOffsetLimit(String sql, int skipResult, int maxResult);

}
