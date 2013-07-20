package com.xone.action.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ReflectUtils {
    private static final Log log = LogFactory.getLog(ReflectUtils.class);
    
    public static void copyProperties(Object target, Object source)
            throws IllegalArgumentException, IllegalAccessException {
        copyProperties(target, source, false);
    }

    public static void copyProperties(Object target, Object source,
            boolean copyNullValue) throws IllegalArgumentException,
            IllegalAccessException {
        if (target == null || source == null)
            return;

        List targetFields = getFields(target.getClass());
        List sourceFields = getFields(source.getClass());

        Object sourceValue = null;
        Field sourceField = null;
        String sourceName = null;
        String sourceType = null;
        Field targetField = null;
        String targetName = null;
        String targetType = null;

        for (Iterator iterator = sourceFields.iterator(); iterator.hasNext();) {
            sourceField = (Field) iterator.next();
            sourceName = sourceField.getName();
            sourceType = sourceField.getType().getName();
            for (Iterator iterator2 = targetFields.iterator(); iterator2
                    .hasNext();) {
                targetField = (Field) iterator2.next();
                targetName = targetField.getName();
                targetType = targetField.getType().getName();
                if (sourceName.equals(targetName)
                        && sourceType.equals(targetType)) {
                    try {
                        sourceField.setAccessible(true);
                        sourceValue = sourceField.get(source);
                    } catch (IllegalAccessException e) {
                    }
                    if(!copyNullValue && sourceValue == null) continue;
                    try {
                        targetField.setAccessible(true);
                        targetField.set(target, sourceValue);
                    } catch (Exception e) {
                    }
                }
            }
        }
    }

    public static void copyPropertiesSafely(Object target, Object source) {
        try {
            copyProperties(target, source);
        } catch (Exception e) {
            log.debug("target:["+target+"]");
            log.debug("source:["+source+"]");
            log.debug(e.getMessage(), e);
        }
    }
    
    public static Object getFieldValue(final Object obj, final String fieldName) {
        Field field = getField(obj.getClass(), fieldName);
        if (field != null) {
            field.setAccessible(true);
            try {
                return field.get(obj);
            } catch (Exception e) {
                log.debug("obj:["+obj+"]");
                log.debug("fieldName:["+fieldName+"]");
                log.debug(e.getMessage(), e);
            }
        }
        return null;
    }

    public static void setFieldValue(final Object obj, final String fieldName, final Object value) {
        Field field = getField(obj.getClass(), fieldName);
        if (field != null) {
            field.setAccessible(true);
            try {
                field.set(obj, value);
            } catch (Exception e) {
                log.debug("obj:["+obj+"]");
                log.debug("fieldName:["+fieldName+"]");
                log.debug(e.getMessage(), e);
            }
        }
    }

    public static List getFields(Class objClass) {
        List result = new ArrayList();
        for (Class superClass = objClass; superClass != Object.class; superClass = superClass
                .getSuperclass()) {
            Field[] fields = superClass.getDeclaredFields();
            addFieldsToList(fields, result);
        }
        return result;
    }

    private static void addFieldsToList(Field[] fields, List list) {
        if (fields == null || list == null)
            return;
        for (int i = 0; i < fields.length; i++) {
            Field f = fields[i];
            String fieldName = f.getName();
            boolean isInList = false;
            for (Iterator iterator = list.iterator(); iterator.hasNext();) {
                Field field = (Field) iterator.next();
                if (fieldName.equals(field.getName())) {
                    isInList = true;
                    break;
                }
            }
            if (!isInList)
                list.add(f);
        }
    }

    private static Field getField(Class objClass, final String fieldName) {
        for (Class superClass = objClass; superClass != Object.class; superClass = superClass
                .getSuperclass()) {
            try {
                Field field = superClass.getDeclaredField(fieldName);
                return field;
            } catch (NoSuchFieldException e) {
                log.debug("objClass:["+objClass+"]");
                log.debug("fieldName:["+fieldName+"]");
                log.debug(e.getMessage(), e);
            }
        }
        return null;
    }
    
    public static Object invokeMethod(Object obj, String methodName, Class[] parameterTypes, Object[] parameters){
        Object result = null;
        try {
            Method m = obj.getClass().getMethod(methodName, parameterTypes);
            result = m.invoke(obj, parameters);
        } catch (Exception e) {
            log.debug("objClass:["+obj+"]");
            log.debug("methodName:["+methodName+"]");
            log.debug("parameterTypes:["+parameterTypes+"]");
            log.debug("parameters:["+parameters+"]");
            log.debug(e.getMessage(), e);
        }
        return result;
    }
    
    public static Object invokeMethodOne(Object obj, String methodName, Class parameterType, Object parameter){
        Object result = null;
        try {
            Method m = obj.getClass().getMethod(methodName, new Class[] {parameterType});
            result = m.invoke(obj, new Object[] {parameter});
        } catch (Exception e) {
            log.debug("objClass:["+obj+"]");
            log.debug("methodName:["+methodName+"]");
            log.debug("parameterTypes:["+parameterType+"]");
            log.debug("parameters:["+parameter+"]");
            log.debug(e.getMessage(), e);
        }
        return result;
    }
    
    public static Object invokeMethodGet(Object obj, String methodName){
        Object result = null;
        try {
            Method m = obj.getClass().getMethod(methodName);
            result = m.invoke(obj);
        } catch (Exception e) {
            log.debug("objClass:["+obj+"]");
            log.debug("methodName:["+methodName+"]");
            log.debug(e.getMessage(), e);
        }
        return result;
    }
}
