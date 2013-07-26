package com.xone.webtools.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class JspGenerator extends BaseGenerator {
	
	protected String tableName;
	protected String dbTableName;
	protected List<Map<String, String>> tableProperties = new ArrayList<Map<String, String>>();
	protected List<String> pages = new ArrayList<String>();
	
	public JspGenerator() {
		pages.add("jsp-create.ftl");
		pages.add("jsp-edit.ftl");
		pages.add("jsp-item.ftl");
		pages.add("jsp-list.ftl");
	}
	
	public void generatePages() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		root.put("packageName", tableName.toLowerCase());
		root.put("tableVarName", firstToLower(tableName));
		root.put("tableProperties", getTableProperties());
		String path = getProjectParentPath();
		String jspName = dbTableName.toLowerCase().replaceAll("_", "-").replaceFirst("t-", "");
		for (String page : pages) {
			File file = null;
			String jsp = page.replaceFirst("jsp", jspName).replaceFirst("\\.ftl", ".jsp");
			if (null != path) {
				file = new File(path + File.separator + "/xone-web/src/main/webapp/WEB-INF/jsp" + File.separator + jsp);
			}
			generate(root, page, file);
		}
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		dbTableName = tableName;
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
