package com.fzy.webtools;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RsUtils {
	public static Integer getInteger(String name, ResultSet rs) throws SQLException {
		Integer result = null;
		BigDecimal v = rs.getBigDecimal(name);
		if (v != null)
			result = new Integer(v.intValue());
		return result;
	}
	public static Long getLong(String name, ResultSet rs) throws SQLException {
		Long result = null;
		BigDecimal v = rs.getBigDecimal(name);
		if (v != null)
			result = new Long(v.longValue());
		return result;
	}

	public static Double getDouble(String name, ResultSet rs)
			throws SQLException {
		Double result = null;
		BigDecimal v = rs.getBigDecimal(name);
		if (v != null)
			result = new Double(v.doubleValue());
		return result;
	}
}
