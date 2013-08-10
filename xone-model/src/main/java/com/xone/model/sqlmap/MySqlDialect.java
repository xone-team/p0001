package com.xone.model.sqlmap;

import org.apache.commons.lang3.StringUtils;

public class MySqlDialect extends MyDBDialect {

	@Override
	public String getOffsetLimit(String sql, int skipResult, int maxResult) {
		if (StringUtils.isBlank(sql)) {
			return sql;
		}
		sql = sql.trim();
		StringBuffer buffer = new StringBuffer();
		buffer.append(sql);
		buffer.append(" limit ");
		buffer.append(skipResult);
		buffer.append(", ");
		buffer.append(maxResult);
		buffer.append(" ");
		return buffer.toString();
	}

}
