package com.xone.webtools.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class DaoGenerator extends BaseGenerator {
	
	protected String tableName;
	
	public DaoGenerator() {
	}
	
	public void generateDao() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-model/src/main/java/com/xone/model/hibernate/app/" + File.separator + getDaoName());
		}
		generate(root, "dao.ftl", file);
	}
	
	public void generateDaoImpl() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-model/src/main/java/com/xone/model/hibernate/app/" + File.separator + getDaoImplName());
		}
		generate(root, "daoImpl.ftl", file);
	}
	
	public void generateDaoXml() {
		Map<String, Object> root = new HashMap<String, Object>();
		String name = tableName;
		root.put("tableName", name);
		root.put("tableVarName", firstToLower(name));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-model/src/main/resources/daos/" + File.separator + getDaoXmlName());
		}
		generate(root, "daoXml.ftl", file);
	}
	
	public String getDaoName() {
		return tableName + "Dao.java";
	}
	
	public String getDaoImplName() {
		return tableName + "DaoImpl.java";
	}
	
	public String getDaoXmlName() {
		return "applicationContext-" + firstToLower(tableName) + "-dao.xml";
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName(tableName);
	}

}
