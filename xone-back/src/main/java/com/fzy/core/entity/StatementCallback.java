package com.fzy.core.entity;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface StatementCallback {
	public Object doInStatement(ResultSet rs, PreparedStatement ps, RowMapper rowMapper) throws Exception;
}
