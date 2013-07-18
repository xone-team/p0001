package com.fzy.action.app.person;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.fzy.core.entity.RowMapper;
import com.fzy.webtools.RsUtils;

public class PersonListMapper implements RowMapper {

	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		PersonListVo vo = new PersonListVo();
		vo.setId(RsUtils.getLong("id", rs));
		vo.setUsername(rs.getString("username"));
		vo.setPassword(rs.getString("password"));
		vo.setNickName(rs.getString("nick_name"));
		vo.setProvinceCode(rs.getString("provinceCode"));
		vo.setUpdatedUser(RsUtils.getLong("updated_user", rs));
		vo.setUpdatedDate(rs.getDate("updated_date"));
		return vo;
	}

}
