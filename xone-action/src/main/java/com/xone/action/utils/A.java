package com.xone.action.utils;

import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.xone.action.base.validators.Validator;

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
    
    private static String appPathCache = null;

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
    	String result = null;
    	if(appPathCache != null){
    		result = appPathCache;
    	}else{
    		result = appPathCache = getAppPath(A.class);
    	}
    	
//        String result = A.getStringSafelyFromApplication("app.path");
//        if (StringUtils.isBlank(result)) {
//            result = getClassPath() + "../../";
//        }
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
        return getJsonConfigWithCache(A.class.getResource(classRootPath).getPath(), A.class.getResourceAsStream(classRootPath));
    }

    public static JSONObject getJsonConfigWithCacheOfWeb(String webRootPath) {
        return getJsonConfigWithCache(getAppPath() + webRootPath);
    }

    public static JSONObject getJsonConfigWithCache(String classRelativePath, Class clazz) {
        return getJsonConfigWithCache(clazz.getResource(classRelativePath).getPath(), clazz.getResourceAsStream(classRelativePath));
    }

    private static JSONObject getJsonConfigWithCache(String absolutePath, InputStream is) {
        JSONObject result = null;
        if (StringUtils.isBlank(absolutePath))
            return result;
        result = (JSONObject) jsonCache.get(absolutePath);
        if (result != null)
            return result;
        try {
            Reader r = new InputStreamReader(is);
            JSONTokener jt = new JSONTokener(r);
            result = new JSONObject(jt);
        } catch (Exception e) {
        }
        if (result != null) {
            jsonCache.put(absolutePath, result);
        }
        return result;
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
    public static Object getJsonValueSafely(JSONObject srcJsonObject, String key, Object defaultValue) {
        Object result = getJsonValueSafely(srcJsonObject, key);
        return result == null ? defaultValue : result;
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

    /**
     * -----------------------------------------------------------------------
     * getAppPath需要一个当前程序使用的Java类的class属性参数，它可以返回打包过的
     * Java可执行文件（jar，war）所处的系统目录名或非打包Java程序所处的目录
     * 
     * @param cls为Class类型
     * @return 返回值为该类所在的Java程序运行的目录
     *         ----------------------------------------------
     *         ---------------------------
     */
    private static String getAppPath(Class cls) {
        // 检查用户传入的参数是否为空
        if (cls == null)
            throw new java.lang.IllegalArgumentException("参数不能为空！");
        ClassLoader loader = cls.getClassLoader();
        // 获得类的全名，包括包名
        String clsName = cls.getName() + ".class";
        // 获得传入参数所在的包
        Package pack = cls.getPackage();
        String path = "";
        // 如果不是匿名包，将包名转化为路径
        if (pack != null) {
            String packName = pack.getName();
            // 此处简单判定是否是Java基础类库，防止用户传入JDK内置的类库
            if (packName.startsWith("java.") || packName.startsWith("javax."))
                throw new java.lang.IllegalArgumentException("不要传送系统类！");
            // 在类的名称中，去掉包名的部分，获得类的文件名
            clsName = clsName.substring(packName.length() + 1);
            // 判定包名是否是简单包名，如果是，则直接将包名转换为路径，
            if (packName.indexOf(".") < 0)
                path = packName + "/";
            else {// 否则按照包名的组成部分，将包名转换为路径
                int start = 0, end = 0;
                end = packName.indexOf(".");
                while (end != -1) {
                    path = path + packName.substring(start, end) + "/";
                    start = end + 1;
                    end = packName.indexOf(".", start);
                }
                path = path + packName.substring(start) + "/";
            }
        }
        // 调用ClassLoader的getResource方法，传入包含路径信息的类文件名
        java.net.URL url = loader.getResource(path + clsName);
        // 从URL对象中获取路径信息
        String realPath = url.getPath();
        // 去掉路径信息中的协议名"file:"
        int pos = realPath.indexOf("file:");
        if (pos > -1)
            realPath = realPath.substring(pos + 5);
        // 去掉路径信息最后包含类文件信息的部分，得到类所在的路径
        pos = realPath.indexOf(path + clsName);
        realPath = realPath.substring(0, pos - 1);
        // 如果类文件被打包到JAR等文件中时，去掉对应的JAR等打包文件名
        if (realPath.endsWith("!"))
            realPath = realPath.substring(0, realPath.lastIndexOf("/"));
        /*------------------------------------------------------------
         ClassLoader的getResource方法使用了utf-8对路径信息进行了编码，当路径
          中存在中文和空格时，他会对这些字符进行转换，这样，得到的往往不是我们想要
          的真实路径，在此，调用了URLDecoder的decode方法进行解码，以便得到原始的
          中文及空格路径
        -------------------------------------------------------------*/
        try {
            realPath = java.net.URLDecoder.decode(realPath, "utf-8");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        // 截取 /WEB-INF/ 前的内容
        String endFlag = "/WEB-INF/";
        int endIndex = realPath.indexOf(endFlag);
        if(endIndex > -1){
            if(realPath != null){
            	realPath = realPath.substring(0, endIndex);
            }
        }else{
        	// 不包含WEB-INF，说明不是WEB-INF服务，取本地配的路径
        	String appPathConfig = A.getStringSafelyFromApplication("app.path");
        	if(appPathConfig != null){
        		realPath = appPathConfig;
        	}
        }

        
        return realPath;
    }// getAppPath定义结束
     // -----------------------------------------------------------------
}
