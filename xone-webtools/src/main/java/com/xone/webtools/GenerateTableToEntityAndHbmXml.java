package com.xone.webtools;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

public class GenerateTableToEntityAndHbmXml {
	
	protected String driver;
	protected String url;
	protected String username;
	protected String password;
	protected String tableName;
	protected String packageName;

	public static void main(String[] args) throws Exception {
		new GenerateTableToEntityAndHbmXml("com.mysql.jdbc.Driver", 
				"jdbc:mysql://mysqllocal.com:4306/sample?useUnicode=true&amp;characterEncoding=utf-8&amp;autoReconnect=true",
				"root", "admin").start("com.xone.model.hibernate.entity", null);
	}
	
	public GenerateTableToEntityAndHbmXml(String driver, String url, String username, String password) {
		this.driver = driver;
		this.url = url;
		this.username = username;
		this.password = password;
	}
	
	/**
	 * 开始产生表properties及xml数据
	 * @param packageName
	 * @param tableName
	 * @throws Exception
	 */
	public void start(String packageName, String tableName) throws Exception {
		this.packageName = packageName;
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, username, password); // MySQL
		List<String> tables = new ArrayList<String>();
		if (null == tableName) {
			tables.addAll(queryTables(conn));
		} else {
			tables.add(tableName);
		}
		for (String tn : tables) {
			List<Map<String, String>> list = tableProperties(conn, tn);
			generate(list, tn);
		}
		conn.close();
	}
	
	public void generate(List<Map<String, String>> list, String tableName) {
		StringBuffer javaProperties = new StringBuffer();
		StringBuffer hibernateXml = new StringBuffer();
		hibernateXml.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
		hibernateXml.append("<!DOCTYPE hibernate-mapping PUBLIC \"-//Hibernate/Hibernate Mapping DTD 3.0//EN\" \n");
		hibernateXml.append("\t\"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd\">\n");
		hibernateXml.append("<hibernate-mapping>\n");
		hibernateXml.append("\t<class name=\"");
		String tableJavaName = tableName(tableName);
		String tableJavaVar = firstToLower(tableJavaName);
		if (!StringUtils.isBlank(this.packageName)) {
			hibernateXml.append(this.packageName);
			hibernateXml.append(".");
			hibernateXml.append(tableJavaName);
		}
		hibernateXml.append("\" table=\"");
		hibernateXml.append(tableName.toUpperCase());
		hibernateXml.append("\">\n");
		javaProperties.append("package com.xone.model.hibernate.entity;\n\n");
		javaProperties.append("import java.io.Serializable;\n\n");
		javaProperties.append("public class ");
		javaProperties.append(tableJavaName);
		javaProperties.append(" implements Serializable {\n");
		for (Map<String, String> map : list) {
			javaProperties.append("protected ");
			javaProperties.append(convertClassName(map.get("columnClassName")));
			javaProperties.append(" ");
			javaProperties.append(columnToName(map.get("columnName")));
			javaProperties.append(";\n");
			if ("1".equals(map.get("autoIncrement"))) {//如果是autoIncrement，认为是主键
				hibernateXml.append(generateId(map.get("columnName"), map.get("columnClassName"), map.get("columnDisplaySize")));
			} else {
				hibernateXml.append(generateProperty(map.get("columnName"), map.get("columnClassName"), map.get("columnDisplaySize")));
			}
		}
		javaProperties.append("}\n");
		hibernateXml.append("\t</class>\n");
		hibernateXml.append("</hibernate-mapping>\n");
		System.out.println("+--------------------------------------------+");
		System.out.println("+---------------Java Properties--------------+");
		System.out.println(tableJavaName + ".java");
		System.out.println("+--------------------------------------------+");
		System.out.println(javaProperties.toString());
		System.out.println("+-------------------------------------------------+");
		System.out.println("+------------------Hibernate xml------------------+");
		System.out.println(tableJavaVar + ".hbm.xml");
		System.out.println("+-------------------------------------------------+");
		System.out.println(hibernateXml.toString());
		System.out.println("+-----------------+");
		System.out.println("+-------------------------------------------------+");
		System.out.println("+-------------------Dao&DaoImpl-------------------+");
		System.out.println("+------java & xml files---------------------------+");
		System.out.println("+-------------------------------------------------+");
		StringBuffer daoBuffer = new StringBuffer();
		daoBuffer.append("package com.xone.model.hibernate.app;\n\n");
		daoBuffer.append("import com.xone.model.hibernate.entity.");
		daoBuffer.append(tableJavaName);
		daoBuffer.append(";\n");
		daoBuffer.append("import com.xone.model.hibernate.generic.HibernateDao;\n\n");
		daoBuffer.append("public interface ");
		daoBuffer.append(tableJavaName);
		daoBuffer.append("Dao extends HibernateDao<");
		daoBuffer.append(tableJavaName);
		daoBuffer.append("> {\n\n\n");
		daoBuffer.append("}\n");
		System.out.println(daoBuffer.toString());
		System.out.println("+-------------------------------------------------+");
		StringBuffer daoImplBuffer = new StringBuffer();
		daoImplBuffer.append("package com.xone.model.hibernate.app;\n\n");
		daoImplBuffer.append("import com.xone.model.hibernate.entity.");
		daoImplBuffer.append(tableJavaName);
		daoImplBuffer.append(";\n");
		daoImplBuffer.append("import com.xone.model.hibernate.generic.AbstractHibernateDao;\n\n");
		daoImplBuffer.append("public class ");
		daoImplBuffer.append(tableJavaName);
		daoImplBuffer.append("DaoImpl extends AbstractHibernateDao<");
		daoImplBuffer.append(tableJavaName);
		daoImplBuffer.append("> implements ");
		daoImplBuffer.append(tableJavaName);
		daoImplBuffer.append("Dao {\n\n\n");
		daoImplBuffer.append("}\n");
		System.out.println(daoImplBuffer.toString());
		System.out.println("+-------------------------------------------------+");
		StringBuffer daoXmlBuffer = new StringBuffer();
		daoXmlBuffer.append("<bean id=\"");
		daoXmlBuffer.append(tableJavaVar);
		daoXmlBuffer.append("Dao\" class=\"com.xone.model.hibernate.app.");
		daoXmlBuffer.append(tableJavaName);
		daoXmlBuffer.append("DaoImpl\" parent=\"abstractHibernateDao\" />");
		System.out.println(daoXmlBuffer.toString());
		System.out.println("+-------------------------------------------------+");
		System.out.println();
		System.out.println("+-------------------------------------------------+");
		System.out.println("+---------------Service&ServiceImpl---------------+");
		System.out.println("+------java & xml files---------------------------+");
		System.out.println("+-------------------------------------------------+");
		StringBuffer serviceBuffer = new StringBuffer();
		serviceBuffer.append("package com.xone.service.app;\n\n");
		serviceBuffer.append("import java.util.List;\n");
		serviceBuffer.append("import java.util.Map;\n");
		serviceBuffer.append("import com.xone.model.hibernate.entity.");
		serviceBuffer.append(tableJavaName);
		serviceBuffer.append(";\n");
		serviceBuffer.append("public interface ");
		serviceBuffer.append(tableJavaName);
		serviceBuffer.append("Service {\n\n");
		serviceBuffer.append("public ");
		serviceBuffer.append(tableJavaName);
		serviceBuffer.append(" save(");
		serviceBuffer.append(tableJavaName);
		serviceBuffer.append(" entity);");
		serviceBuffer.append("\n");
		serviceBuffer.append("public ");
		serviceBuffer.append(tableJavaName);
		serviceBuffer.append(" findById(Long id);");
		serviceBuffer.append("\n");
		serviceBuffer.append("public List<");
		serviceBuffer.append(tableJavaName);
		serviceBuffer.append("> findAllByMap(Map<String, String> params);");
		serviceBuffer.append("\n");
		serviceBuffer.append("}\n");
		serviceBuffer.append("\n");
		System.out.println(serviceBuffer.toString());
		System.out.println("+-------------------------------------------------+");
		StringBuffer serviceImplBuffer = new StringBuffer();
		serviceImplBuffer.append("package com.xone.service.app;\n\n");
		serviceImplBuffer.append("import java.util.List;\n");
		serviceImplBuffer.append("import java.util.Map;\n");
		serviceImplBuffer.append("import org.springframework.beans.factory.annotation.Autowired;\n\n");
		serviceImplBuffer.append("import com.xone.model.hibernate.app.");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("Dao;\n");
		serviceImplBuffer.append("import com.xone.model.hibernate.entity.");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append(";\n");
		serviceImplBuffer.append("public class ");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("ServiceImpl implements ");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("Service {\n\n\n");

		serviceImplBuffer.append("@Autowired\n");
		serviceImplBuffer.append("protected ");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("Dao ");
		serviceImplBuffer.append(tableJavaVar);
		serviceImplBuffer.append("Dao;\n\n");
		
		serviceImplBuffer.append("@Override\n");
		serviceImplBuffer.append("public ");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append(" save(");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append(" entity) {\n");
		serviceImplBuffer.append("return get");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("Dao().save(entity);\n");
		serviceImplBuffer.append("}\n");
		
		serviceImplBuffer.append("@Override\n");
		serviceImplBuffer.append("public ");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append(" findById(Long id) {\n");
		serviceImplBuffer.append("return get");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("Dao().findById(id);\n");
		serviceImplBuffer.append("}\n");
		
		serviceImplBuffer.append("@Override\n");
		serviceImplBuffer.append("public List<");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("> findAllByMap(Map<String, String> params) {\n");
		serviceImplBuffer.append("DetachedCriteria detachedCriteria = DetachedCriteria.forClass(");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append(".class);\n");
		serviceImplBuffer.append("return get");
		serviceImplBuffer.append(tableJavaName);
		serviceImplBuffer.append("Dao().findListByDetachedCriteria(detachedCriteria, 0, 10);\n");
		serviceImplBuffer.append("}\n");
		serviceImplBuffer.append("}\n");
		System.out.println(serviceImplBuffer.toString());
		System.out.println("+-------------------------------------------------+");
		StringBuffer serviceXmlBuffer = new StringBuffer();
		serviceXmlBuffer.append("<bean id=\"");
		serviceXmlBuffer.append(tableJavaVar);
		serviceXmlBuffer.append("Service\" class=\"com.xone.service.app.");
		serviceXmlBuffer.append(tableJavaName);
		serviceXmlBuffer.append("ServiceImpl\" />");
		System.out.println(serviceXmlBuffer.toString());
		System.out.println("+-------------------------------------------------+");
		System.out.println();
		System.out.println("+-------------------------------------------------+");
		System.out.println("+-----------------------Action--------------------+");
		System.out.println("+------java & xml files---------------------------+");
		System.out.println("+-------------------------------------------------+");
		System.out.println();
		System.out.println("+-------------------------------------------------+");
		System.out.println("+-----------------struts-xxx.xml------------------+");
		System.out.println("+------namespace, actions-------------------------+");
		System.out.println("+-------------------------------------------------+");
		System.out.println();
		System.out.println("+-------------------------------------------------+");
		System.out.println("+-----------------xxxxxx-xxx.jsp------------------+");
		System.out.println("+----list, create, update, delete, details--------+");
		System.out.println("+-------------------------------------------------+");
		System.out.println();
	}
	
	public String generateId(String columnName, String type, String length) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("\t<id name=\"");
		buffer.append(columnToName(columnName));
		buffer.append("\" ");
		buffer.append("type=\"");
		buffer.append(type);
		buffer.append("\">");
		buffer.append("\n\t\t<column name=\"");
		buffer.append(columnName);
		buffer.append("\" length=\"");
		buffer.append(length);
		buffer.append("\" not-null=\"true\"/>");
		buffer.append("\n\t\t<generator class=\"increment\" />");
		buffer.append("\n\t</id>\n");
		return buffer.toString();
	}
	
	public String generateProperty(String columnName, String type, String length) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("\t<property name=\"");
		buffer.append(columnToName(columnName));
		buffer.append("\" ");
		buffer.append("type=\"");
		buffer.append(type);
		buffer.append("\">");
		buffer.append("\n\t\t<column name=\"");
		buffer.append(columnName);
		buffer.append("\" length=\"");
		buffer.append(length);
		buffer.append("\"/>");
		buffer.append("\n\t</property>\n");
		return buffer.toString();
	}
	
	/**
	 * 查询表属性
	 * @param conn
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> tableProperties(Connection conn, String tableName) throws Exception {
		PreparedStatement preparedStatement = conn
				.prepareStatement("select * from " + tableName + " where 1=2");
		ResultSetMetaData resultSetMetaData = preparedStatement.executeQuery()
				.getMetaData();
		List<Map<String, String>> result = new ArrayList<Map<String, String>>();
		for (int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
			Map<String, String> map = new HashMap<String, String>();
			String columnName = resultSetMetaData.getColumnName(i + 1);
			String columnTypeName = resultSetMetaData.getColumnTypeName(i + 1);
			int columnDisplaySize = resultSetMetaData.getColumnDisplaySize(i + 1);
			String columnClassName = resultSetMetaData.getColumnClassName(i + 1);
			if ("java.sql.Timestamp".equals(columnClassName)) {
				columnClassName = "java.util.Date";
			}
//			System.out.println("+----------------+");
//			System.out.print("Column:" + columnName);
//			System.out.print(", \tType:" + columnTypeName);
//			System.out.print("(" + columnDisplaySize + ")");
//			System.out.print(", (" + columnClassName + ")");
//			System.out.println();
			map.put("tableName", tableName);
			map.put("columnClassName", columnClassName);
			map.put("columnTypeName", columnTypeName);
			map.put("columnName", columnName);
			map.put("columnDisplaySize", String.valueOf(columnDisplaySize));
			if (resultSetMetaData.isAutoIncrement(i + 1)) {
				map.put("autoIncrement", "1");
			} else {
				map.put("autoIncrement", "0");
			}
			result.add(map);
		}
		preparedStatement.close();
		return result;
	}
	
	/**
	 * 数据库类与java类的映射
	 * @param className
	 * @return
	 */
	public String convertClassName(String className) {
		String [] cn = className.split("\\.");
		String type = cn[cn.length - 1];
		if ("Timestamp".equals(type)) {
			return "Date";
		}
		return type;
	}
	
	/**
	 * 行名称映射
	 * @param column
	 * @return
	 */
	public String columnToName(String column) {
		if (StringUtils.isBlank(column)) {
			return "";
		}
		column = column.toLowerCase();
		if (column.indexOf("_") > -1) {
			char [] cs = column.toCharArray();
			for (int i = 1; i < cs.length; i ++) {
				if ('_' == cs[i - 1] && cs.length != i) {
					cs[i] = String.valueOf(cs[i]).toUpperCase().charAt(0);
				}
			}
			column = String.valueOf(cs).replaceAll("_", "");
		}
		return column;
	}
	
	public String firstToLower(String name) {
		if (StringUtils.isBlank(name)) {
			return "";
		}
		if (name.length() == 1) {
			return name.toLowerCase();
		}
		return name.substring(0, 1).toLowerCase() + name.substring(1);
	}
	
	/**
	 * 表名映射
	 * @param tableName
	 * @return
	 */
	public String tableName(String tableName) {
		if (StringUtils.isBlank(tableName)) {
			return "";
		}
		tableName = tableName.toLowerCase();
		tableName = tableName.replaceFirst("t_", "");
		tableName = columnToName(tableName);
		String firstLetter = String.valueOf(tableName.charAt(0));
		tableName = tableName.replaceFirst(firstLetter, firstLetter.toUpperCase());
		return tableName;
	}
	
	/**
	 * 查询当前数据库所有表名
	 * @param conn
	 * @throws Exception
	 */
	public List<String> queryTables(Connection conn) throws Exception {
		List<String> tables = new ArrayList<String>();
		DatabaseMetaData metaData = conn.getMetaData();
		ResultSet resultSet = metaData.getTables(null, null, null, null);
		int i = 1;
		while (resultSet.next()) {
			if (i == 1) {
				System.out.println("|库名：" + resultSet.getString(1));
				System.out.println("+----------------+");
			}
			String tableName = resultSet.getString("TABLE_NAME");
			System.out.println("|表" + (i++) + ":" + tableName);
			tables.add(tableName);
		}
		System.out.println("+----------------+");
		resultSet.close();
		return tables;
	}

}
