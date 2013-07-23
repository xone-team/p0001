package com.xone.webtools.web.generator;

import java.io.File;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import com.xone.webtools.web.TemplateFactory;

public class FreemarkerTest {
	
	public static void main(String [] args) throws Exception {
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("OK", "This is my template.");
		URL url = FreemarkerTest.class.getResource("/");
		TemplateFactory.generatorDocument("test.ftl", root, new File("D://test.txt"));
	}

}
