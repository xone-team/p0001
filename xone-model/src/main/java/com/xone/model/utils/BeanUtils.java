/**
 * BeanUtils.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-5-25
 *
 */
package com.xone.model.utils;

import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * @TODO 请Hunny添加代码注释 
 *
 * @author Hunny
 * @created 2011-5-25 下午01:13:14
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class BeanUtils {

	/**
	 * 使用反射将bean简单转化为map
	 * @param <T>
	 * @param t
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static <T> Map<String, Object> simpleBeanToMap(T t) {
		if (null == t) {
			return Collections.emptyMap();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		Class clazz = t.getClass();
		Method[] methods = clazz.getDeclaredMethods();
		for (Method method : methods) {
			String name = method.getName();
			if (name.startsWith("get") || name.startsWith("is")) {
				Type[] pTypes =  method.getGenericParameterTypes();
				if (pTypes.length == 0) {
					name = name.startsWith("get") ? name.replaceFirst("get", "") : name.replaceFirst("is", "");
					name = name.substring(0, 1).toLowerCase() + name.substring(1);
					Object value = null;
					try {
						value = method.invoke(t, new Object[]{});
						map.put(name, value);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		return map;
	}
	
}
