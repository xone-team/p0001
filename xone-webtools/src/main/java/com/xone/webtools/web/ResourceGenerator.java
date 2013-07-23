package com.xone.webtools.web;

import java.util.List;

public class ResourceGenerator {

	public static void main(String[] args) throws Exception {
		DatabaseTableInfo databaseTableInfo = new DatabaseTableInfo("com.mysql.jdbc.Driver", 
				"jdbc:mysql://mysqllocal.com:4306/sample?useUnicode=true&amp;characterEncoding=utf-8&amp;autoReconnect=true",
				"root", "admin");
		List<String> tables = databaseTableInfo.getTables();
		DaoGenerator daoGenerator = new DaoGenerator();
		EntityGenerator entityGenerator = new EntityGenerator();
		ServiceGenerator serviceGenerator = new ServiceGenerator();
		ActionGenerator actionGenerator = new ActionGenerator();
		JspGenerator jspGenerator = new JspGenerator();
		for (String table : tables) {
//			daoGenerator.setTableName(table);
//			daoGenerator.generateDao();
//			daoGenerator.generateDaoImpl();
//			daoGenerator.generateDaoXml();
//			entityGenerator.setTableName(table);
//			entityGenerator.setTableProperties(databaseTableInfo.getTableProperties(table));
//			entityGenerator.generateEntity();
//			entityGenerator.generateHibernateXml();
//			serviceGenerator.setTableName(table);
//			serviceGenerator.generateService();
//			serviceGenerator.generateServiceImpl();
//			serviceGenerator.generateServiceXml();
			actionGenerator.setTableName(table);
//			actionGenerator.generateAction();
//			actionGenerator.generateActionXml();
			actionGenerator.generateStrutsXml();
//			jspGenerator.setTableName(table);
//			jspGenerator.setTableProperties(databaseTableInfo.getTableProperties(table));
//			jspGenerator.generatePages();
		}
		databaseTableInfo.close();
	}

}
