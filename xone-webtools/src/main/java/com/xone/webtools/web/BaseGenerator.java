package com.xone.webtools.web;

import java.io.File;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.xone.webtools.web.generator.FreemarkerTest;

public class BaseGenerator {
	
	public String getProjectParentPath() {
		URL url = FreemarkerTest.class.getResource("/");
		File file = new File(url.getPath());
		return file.getParentFile().getParentFile().getParentFile().getPath();
//		return new File("D:/files/").getPath();
	}
	
	public interface MapConvertor {
		public Map<String, String> doConvertor(String key, String value);
	}
	
	public Map<String, String> convertMap(final Map<String, String> source) {
		return convertMap(source, new MapConvertor() {
			@Override
			public Map<String, String> doConvertor(String key, String value) {
				if ("columnClassName".equals(key)) {
					Map<String, String> m = new HashMap<String, String>();
					m.put("className", convertClassName(value));
					return m;
				}
				if ("columnName".equals(key)) {
					Map<String, String> m = new HashMap<String, String>();
					m.put("javaName", tableName(value));
					m.put("javaVarName", columnToName(value));
					return m;
				}
				return null;
			}
		});
	}
	
	public Map<String, String> convertMap(final Map<String, String> source, MapConvertor mapConvertor) {
		if (null == source || source.isEmpty()) {
			return source;
		}
		Map<String, String> map = new HashMap<String, String>();
		map.putAll(source);
		if (null != mapConvertor) {
			for (Map.Entry<String, String> m : source.entrySet()) {
					Map<String, String> mc = mapConvertor.doConvertor(m.getKey(), m.getValue());
					if (null != mc && !mc.isEmpty()) {
						map.putAll(mc);
					}
			}
		}
		return map;
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
	
	protected void generate(Map<String, Object> root, String template, File file) {
		try {
			TemplateFactory.generatorDocument(template, root, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
