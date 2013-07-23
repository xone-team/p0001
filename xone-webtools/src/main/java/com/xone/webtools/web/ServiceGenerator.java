package com.xone.webtools.web;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class ServiceGenerator extends BaseGenerator {
	
	protected String tableName;
	
	public ServiceGenerator() {
	}
	
	public void generateService() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-service/src/main/java/com/xone/service/app/" + File.separator + getServiceName());
		}
		generate(root, "service.ftl", file);
	}
	
	public void generateServiceImpl() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		root.put("tableVarName", firstToLower(tableName));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-service/src/main/java/com/xone/service/app/" + File.separator + getServiceImplName());
		}
		generate(root, "serviceImpl.ftl", file);
	}
	
	public void generateServiceXml() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
		root.put("tableVarName", firstToLower(tableName));
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/xone-service/src/main/resources/services/" + File.separator + getServiceXmlName());
		}
		generate(root, "serviceXml.ftl", file);
	}
	
	public String getServiceName() {
		return tableName + "Service.java";
	}
	
	public String getServiceImplName() {
		return tableName + "ServiceImpl.java";
	}
	
	public String getServiceXmlName() {
		return "applicationContext-" + firstToLower(tableName) + "-service.xml";
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName(tableName);
	}
}
