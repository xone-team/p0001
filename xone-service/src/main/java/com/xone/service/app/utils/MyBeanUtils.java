package com.xone.service.app.utils;

import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;
import org.springframework.util.Assert;

public class MyBeanUtils {
	
	public static void copyProperties(Object source, Object target, Class<?> editable) throws BeansException {
		copyProperties(source, target, editable, null, null);
	}
	
	public static void copyProperties(Object source, Object target, String[] ignoreProperties) throws BeansException {
		copyProperties(source, target, null, ignoreProperties, null);
	}
	
	public static void copyProperties(Object source, Object target, CopyRules copyRoles) throws BeansException {
		copyProperties(source, target, null, null, copyRoles);
	}
	
	public static void copyProperties(Object source, Object target, Class<?> editable, String[] ignoreProperties, CopyRules copyRoles)
			throws BeansException {

		Assert.notNull(source, "Source must not be null");
		Assert.notNull(target, "Target must not be null");

		Class<?> actualEditable = target.getClass();
		if (editable != null) {
			if (!editable.isInstance(target)) {
				throw new IllegalArgumentException("Target class [" + target.getClass().getName() +
						"] not assignable to Editable class [" + editable.getName() + "]");
			}
			actualEditable = editable;
		}
		PropertyDescriptor[] targetPds = BeanUtils.getPropertyDescriptors(actualEditable);
		List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;

		for (PropertyDescriptor targetPd : targetPds) {
			if (targetPd.getWriteMethod() != null &&
					(ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))) {
				PropertyDescriptor sourcePd = BeanUtils.getPropertyDescriptor(source.getClass(), targetPd.getName());
				if (sourcePd != null && sourcePd.getReadMethod() != null) {
					try {
						Method readMethod = sourcePd.getReadMethod();
						if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
							readMethod.setAccessible(true);
						}
						Object value = readMethod.invoke(source);
						if (null != copyRoles && !copyRoles.myCopyRules(value)) {//如果值为null就不赋值
							continue;
						}
						Method writeMethod = targetPd.getWriteMethod();
						if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
							writeMethod.setAccessible(true);
						}
						writeMethod.invoke(target, value);
					}
					catch (Throwable ex) {
						throw new FatalBeanException("Could not copy properties from source to target", ex);
					}
				}
			}
		}
	}
	
	public static void copyPropertiesToMap(Object source, Map<String, String> target, CopyRules copyRoles, AssignRules assignRules, String[] ignoreProperties)
			throws BeansException {
		
		Assert.notNull(source, "Source must not be null");
		Assert.notNull(target, "Target must not be null");
		
		PropertyDescriptor[] targetPds = BeanUtils.getPropertyDescriptors(source.getClass());
		List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;
		
		for (PropertyDescriptor targetPd : targetPds) {
			if (targetPd.getReadMethod() != null &&
					(ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))) {
				Method readMethod = targetPd.getReadMethod();
				if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
					readMethod.setAccessible(true);
				}
				Object value = null;
				try {
					value = readMethod.invoke(source);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				if (null != copyRoles && !copyRoles.myCopyRules(value)) {//如果值为null就不赋值
					continue;
				}
				String temp = null;
				if (null != assignRules) {
					temp = assignRules.myAssignRules(value);
				} else {
					temp = value.toString();
				}
				target.put(targetPd.getName(), temp);
			}
		}
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
		
		PropertyDescriptor[] targetPds = BeanUtils.getPropertyDescriptors(target.getClass());
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
	
	public interface CopyRules {
		
		public boolean myCopyRules(Object value);
		
	}

	public interface AssignRules {
		
		public String myAssignRules(Object value);
	}
	
}
