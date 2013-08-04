/**
 * BeanUtils.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-5-25
 *
 */
package com.xone.model.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.util.Assert;

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
	
	protected static String toMyRole(String name) {
		if (StringUtils.isBlank(name)) {
			return StringUtils.EMPTY;
		}
		String n = name.replaceFirst("set", "");
		int sz = n.length();
		if (sz == 0) {
			return n;
		}
		StringBuffer buffer = new StringBuffer();
		buffer.append(n.charAt(0));
        for (int i = 1; i < sz; i++) {
        	char c = n.charAt(i);
            if (Character.isUpperCase(c) == true) {
            	buffer.append("_");
            }
        	buffer.append(c);
        }
		return buffer.toString().toUpperCase();
	}
	
	public static void copyPropertiesFromMap(Map<String, String> source, Object target, MapCopyRoles copyRoles, MyAssignRules assignRules, String[] ignoreProperties)
			throws BeansException {
		
		Assert.notNull(source, "Source must not be null");
		Assert.notNull(target, "Target must not be null");
		
		PropertyDescriptor[] targetPds = org.springframework.beans.BeanUtils.getPropertyDescriptors(target.getClass());
		List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;
		
		for (PropertyDescriptor targetPd : targetPds) {
			if (targetPd.getWriteMethod() != null &&
					(ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))) {
				Method writeMethod = targetPd.getWriteMethod();
				Class<?>[] parameterTypes = writeMethod.getParameterTypes();
				if (parameterTypes.length >= 2 || parameterTypes.length <= 0) {
					continue;
				}
				if (null != copyRoles && !copyRoles.myCopyRules(parameterTypes[0], targetPd.getName())) {//如果值为null就不赋值
					continue;
				}
				String v = source.get(toMyRole(targetPd.getName()));
				if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
					writeMethod.setAccessible(true);
				}
				Object value = null;
				if (null != assignRules) {
					value = assignRules.myAssignRules(parameterTypes[0], v);
				}
				try {
					writeMethod.invoke(target, value);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public interface MapCopyRoles {
		public boolean myCopyRules(Class<?> parameterClass, String method);
	}
	
	public interface MyAssignRules {
		public Object myAssignRules(Class<?> parameterClass, String value);
	}
}
