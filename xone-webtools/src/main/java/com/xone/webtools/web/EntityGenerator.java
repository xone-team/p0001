package com.xone.webtools.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EntityGenerator extends BaseGenerator {
	
	protected String tableName;
	protected String dbTableName;
	protected List<Map<String, String>> tableProperties = new ArrayList<Map<String, String>>();
	
	public EntityGenerator() {
	}
	
	public void generateEntity() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", getTableName());
		root.put("tableProperties", getTableProperties());
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/output/entity/" + File.separator + getEntityName());
		}
		generate(root, "entity.ftl", file);
	}
	
	public void generateHibernateXml() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", getTableName());
		root.put("dbTableName", this.dbTableName.toUpperCase());
		root.put("tableProperties", getTableProperties());
		root.put("tableVarName", firstToLower(getTableName()));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-model/src/main/java/com/xone/model/hibernate/entity/" + File.separator + getHibernateXmlName());
		}
		generate(root, "hibernate.ftl", file);
	}
	
	public String getEntityName() {
		return tableName + ".java";
	}
	
	public String getHibernateXmlName() {
		return firstToLower(tableName) + ".hbm.xml";
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.dbTableName = tableName;
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
