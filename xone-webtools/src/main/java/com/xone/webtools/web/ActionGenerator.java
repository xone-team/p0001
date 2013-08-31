package com.xone.webtools.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class ActionGenerator extends BaseGenerator {
	
	protected String tableName;
	protected String dbTableName;
	
	public ActionGenerator() {
	}
	
	public void generateAction() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		root.put("packageName", tableName.toLowerCase());
		root.put("tableVarName", firstToLower(tableName));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-action/src/main/java/com/xone/action/web/" + tableName.toLowerCase() + File.separator + getActionName());
		}
		generate(root, "action.ftl", file);
	}
	
	public void generateActionXml() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		root.put("packageName", tableName.toLowerCase());
		root.put("tableVarName", firstToLower(tableName));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-action/src/main/resources/actions/" + File.separator + getActionXmlName());
		}
		generate(root, "actionXml.ftl", file);
	}
	
	public void generateStrutsXml() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		root.put("packageName", tableName.toLowerCase());
		root.put("tableVarName", firstToLower(tableName));
		root.put("jspName", dbTableName.toLowerCase().replaceAll("_", "-").replaceFirst("t-", ""));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-web/src/main/resources/struts/" + File.separator + getStrutsXmlName());
		}
		generate(root, "actionStrutsXml.ftl", file);
	}
	
	public String getActionName() {
		return tableName + "WebAction.java";
	}
	
	public String getActionXmlName() {
		return "applicationContext-" + firstToLower(tableName) + "-web-action.xml";
	}
	
	public String getStrutsXmlName() {
		return "struts-" + firstToLower(tableName) + "-web.xml";
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		dbTableName = tableName;
		this.tableName = tableName(tableName);
	}
}
