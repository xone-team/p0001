package com.xone.webtools.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceGenerator extends BaseGenerator {
	
	protected String tableName;
    protected String dbTableName;
    protected List<Map<String, String>> tableProperties = new ArrayList<Map<String, String>>();
	
	public ServiceGenerator() {
	}
	
	public void generateService() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
        root.put("packageName", tableName.toLowerCase());
        root.put("tableVarName", firstToLower(tableName));
        root.put("tableProperties", getTableProperties());
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/output/service/" + File.separator + getServiceName());
		}
		generate(root, "service.ftl", file);
	}
	
	public void generateServiceImpl() {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("tableName", tableName);
        root.put("packageName", tableName.toLowerCase());
        root.put("tableVarName", firstToLower(tableName));
        root.put("tableProperties", getTableProperties());
		String path = getProjectParentPath();
		File file = null;
		if (null != path) {
			file = new File(path + File.separator + "/output/service/" + File.separator + getServiceImplName());
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

    public String getDbTableName() {
        return dbTableName;
    }

    public void setDbTableName(String dbTableName) {
        this.dbTableName = dbTableName;
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
