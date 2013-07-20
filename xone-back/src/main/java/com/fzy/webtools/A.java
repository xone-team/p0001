package com.fzy.webtools;

import java.io.File;
import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.fzy.core.validators.Validator;

public class A {
    private static Log log = LogFactory.getLog(A.class);

    public static final String RESOURCE_DATABASE_MYSQL = "database-mysql";
    public static final String RESOURCE_CONFIG = "config";
    public static final String RESOURCE_APPLICATION = "conf-fzy.application";
    public static final String RESOURCE_ACTION_MAPPING = "conf-fzy.action-mapping";
    public static final String HIBERNATE_CONFIG_PATH = "/conf-fzy/hibernate.cfg.xml";

    public static final String DATASOURCE_JNDI = "jndi.name";
    public static final String DATASOURCE_JDBC_DRIVER = "jdbc.driver";
    public static final String DATASOURCE_JDBC_URL = "jdbc.url";
    public static final String DATASOURCE_JDBC_USERNAME = "jdbc.username";
    public static final String DATASOURCE_JDBC_PASSWORD = "jdbc.password";
    public static final String HIBERNATE_PREFIX = "hibernate.";

    private static ClassLoader myClassLoader;

    static {
        myClassLoader = A.class.getClassLoader();
        // 当使用JavaSE是,如果bootClassLoader加载,那么就会为null
        if (myClassLoader == null)
            try {
                myClassLoader = ClassLoader.getSystemClassLoader();
            } catch (Throwable e) {
            }
    }

    private static Map resourceCache = new HashMap();
    private static Map jsonCache = new HashMap();
    private static Map validatorCache = new HashMap();

    static class DataSourceHolder {
        static DataSource defaultDataSource = initDefaultDataSource();
    }

    static class ConfigHolder {
        static Configuration config = initConfig();
    }

    static class SessionFactoryHolder {
        static SessionFactory sessionFactory;
        static {
            Configuration c = getConfig();
            if (c != null) {
                sessionFactory = c.buildSessionFactory();
            }
        }
    }

    /**
     * 获取ClassLoader的方法
     */
    public static ClassLoader getClassLoader() {
        return myClassLoader;
    }

    public static DataSource getDataSource() {
        return DataSourceHolder.defaultDataSource;
    }

    public static Configuration getConfig() {
        return ConfigHolder.config;
    }

    public static SessionFactory getSessionFactory() {
        return SessionFactoryHolder.sessionFactory;
    }

    public static Session getSesson() {
        Session result = null;
        SessionFactory sf = getSessionFactory();
        DataSource ds = getDataSource();
        if (sf != null && ds != null) {
            try {
                Connection c = ds.getConnection();
                if (c != null) {
                    result = sf.openSession(c);
                }
            } catch (SQLException e) {
                log.error(e);
            }
        }
        return result;
    }

    public static ResourceBundle getResourceWithCache(String resourceName) {
        ResourceBundle result = (ResourceBundle) resourceCache.get(resourceName);
        if (result == null) {
            result = ResourceBundle.getBundle(resourceName);
            if (result != null) {
                resourceCache.put(resourceName, result);
            }
        }
        return result;
    }

    public static String getStringSafelyFromResource(String key, ResourceBundle resourceBundle) {
        String result = null;
        if (StringUtils.isBlank(key) || resourceBundle == null)
            return result;
        try {
            result = resourceBundle.getString(key);
        } catch (Exception e) {
        }
        return result;
    }

    public static String getStringSafelyFromApplication(String key) {
        ResourceBundle r = getResourceWithCache(RESOURCE_APPLICATION);
        return getStringSafelyFromResource(key, r);
    }

    public static String getActionSafelyFromMapping(String path) {
        ResourceBundle r = getResourceWithCache(RESOURCE_ACTION_MAPPING);
        return getStringSafelyFromResource(path, r);
    }

    public static String getClassPath() {
        return getClassLoader().getResource("").getPath();
    }

    public static String getAppPath() {
        String result = A.getStringSafelyFromApplication("app.path");
        if (StringUtils.isBlank(result)) {
            // TODO require tests
            result = getClassPath() + "../../";
        }
        return result;
    }

    public static void makeDirs(String path) {
        File dir = new File(path);
        if (dir.exists() && dir.isDirectory()) {
        } else {
            dir.mkdirs();
        }
    }

    public static JSONObject getJsonConfigWithCacheOfClass(String classRootPath) {
        return getJsonConfigWithCache(A.class.getResource(classRootPath).getPath());
    }

    public static JSONObject getJsonConfigWithCacheOfWeb(String webRootPath) {
        return getJsonConfigWithCache(getAppPath() + webRootPath);
    }

    public static JSONObject getJsonConfigWithCache(String classRelativePath, Class clazz) {
        return getJsonConfigWithCache(clazz.getResource(classRelativePath).getPath());
    }

    private static JSONObject getJsonConfigWithCache(String absolutePath) {
        JSONObject result = null;
        if (StringUtils.isBlank(absolutePath))
            return result;
        result = (JSONObject) jsonCache.get(absolutePath);
        if (result != null)
            return result;
        try {
            Reader r = new FileReader(absolutePath);
            JSONTokener jt = new JSONTokener(r);
            result = new JSONObject(jt);
        } catch (Exception e) {
        }
        if (result != null) {
            jsonCache.put(absolutePath, result);
        }
        return result;
    }

    public static Validator getValidatorWithCache(String className) throws Exception {
        Validator result = (Validator) validatorCache.get(className);
        if (result == null) {
            result = getValidator(className);
        }
        if (result != null) {
            validatorCache.put(className, result);
        }
        return result;
    }

    public static Validator getValidator(String className) throws Exception {
        Validator result = null;
        Class c = getClassLoader().loadClass(className);
        c.isInstance(Validator.class);
        result = (Validator) c.newInstance();
        return result;
    }

    public static Object getJsonValueSafely(JSONObject srcJsonObject, String key) {
        Object result = null;
        if (srcJsonObject == null || key == null)
            return result;
        try {
            result = srcJsonObject.get(key);
        } catch (JSONException e) {
        }
        return result;
    }

    public static Object getJsonValue(JSONObject srcJsonObject, String key, String exceptionText) throws Exception {
        Object result = null;
        try {
            result = srcJsonObject.get(key);
        } catch (JSONException e) {
            throw new Exception(exceptionText, e);
        }
        if (result == null) {
            throw new Exception(exceptionText);
        }
        return result;
    }
    public static Object getJsonValue(JSONObject srcJsonObject, String key) throws Exception {
        Object result = null;
        try {
            result = srcJsonObject.get(key);
        } catch (JSONException e) {
            throw new Exception("json context :" + srcJsonObject, e);
        }
        return result;
    }

    public static Object getJsonValueSafely(JSONArray srcJsonArray, int index) {
        Object result = null;
        if (srcJsonArray == null || index < 0)
            return result;
        try {
            result = srcJsonArray.get(index);
        } catch (JSONException e) {
        }
        return result;
    }

    private static DataSource initDefaultDataSource() {
        DataSource result = null;
        ResourceBundle r = getResourceWithCache(RESOURCE_DATABASE_MYSQL);
        String defaultJndi = getStringSafelyFromResource(DATASOURCE_JNDI, r);
        if (defaultJndi != null) {
            try {
                InitialContext ic = new InitialContext();
                result = (DataSource) ic.lookup(defaultJndi);
            } catch (NamingException e) {
                log.error(e);
            }
        } else {
            BasicDataSource d = new BasicDataSource();
            d.setDriverClassName(getStringSafelyFromResource(DATASOURCE_JDBC_DRIVER, r));
            d.setUsername(getStringSafelyFromResource(DATASOURCE_JDBC_USERNAME, r));
            d.setPassword(getStringSafelyFromResource(DATASOURCE_JDBC_PASSWORD, r));
            d.setUrl(getStringSafelyFromResource(DATASOURCE_JDBC_URL, r));
            result = d;
        }
        return result;
    }

    private static Configuration initConfig() {
        Configuration result = null;
        result = new Configuration().configure(HIBERNATE_CONFIG_PATH);
        ResourceBundle r = getResourceWithCache(RESOURCE_DATABASE_MYSQL);
        Enumeration e = r.getKeys();
        String key = null;
        while (e.hasMoreElements()) {
            key = (String) e.nextElement();
            if (key.startsWith(HIBERNATE_PREFIX)) {
                String value = getStringSafelyFromResource(key, r);
                result.setProperty(key, value);
            }
        }
        return result;
    }

}
