package com.xone.webtools.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URL;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.xone.webtools.web.generator.FreemarkerTest;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class TemplateFactory {
	
	protected static Configuration cfg = null;
	
	public synchronized static Configuration getInstance() {
		if (null == cfg) {
			cfg = new Configuration();
			try {
				URL templates = FreemarkerTest.class.getClass().getResource("/templates");
				cfg.setDirectoryForTemplateLoading(new File(templates.getFile()));
				cfg.setObjectWrapper(new DefaultObjectWrapper());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return cfg;
	}
	
	public static Template getTemplate(String name) {
		try {
			return getInstance().getTemplate(name);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static void generatorDocument(String templateName, Map<String, Object> root, File file, String code) throws Exception {
		Template temp = getTemplate(templateName);
		Writer out = null;
		if (null == file) {
			out = new OutputStreamWriter(System.out);
		} else {
			if (file.exists()) {
				String [] path = file.getPath().split("\\.");
				String suffix = path[path.length - 1];
	            file = new File(file.getPath() + "." + format(new Date(), "yyyy-MM-dd_HHmmss") + "." + suffix);
	        }
			new File(file.getPath().replaceFirst(file.getName() + "$", "")).mkdirs();
            file.createNewFile();
	        FileOutputStream outer = new FileOutputStream(file);
	        out = new OutputStreamWriter(outer, code);
		}
		temp.process(root, out);
		out.flush();
	}
	
	protected static String format(Date date, String format) {
		String result = null;
		try {
			result = new SimpleDateFormat(format).format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void generatorDocument(String templateName, Map<String, Object> root, File file) throws Exception {
		generatorDocument(templateName, root, file, "UTF-8");
	}

}
