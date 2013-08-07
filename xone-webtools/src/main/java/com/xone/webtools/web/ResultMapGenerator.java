package com.xone.webtools.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ResultMapGenerator extends BaseGenerator {
	
	protected String tableName;
	protected List<Map<String, String>> tableProperties = new ArrayList<Map<String, String>>();
	
	public void generateResultMap() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", getTableName());
		root.put("tableProperties", getTableProperties());
		root.put("tableVarName", firstToLower(getTableName()));
		generate(root, "resultMap.ftl", null);
	}
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName(tableName);
	}

	public List<Map<String, String>> getTableProperties() {
		return tableProperties;
	}

	public void setTableProperties(List<Map<String, String>> tableProperties) {
		if (null != tableProperties && !tableProperties.isEmpty()) {
			for (int i = 0; i < tableProperties.size(); i++) {
				Map<String, String> map = tableProperties.get(i);
				map = convertMap(map);
				if (null != map && !map.isEmpty()) {
					tableProperties.set(i, map);
				}
			}
		}
		this.tableProperties = tableProperties;
	}

}
