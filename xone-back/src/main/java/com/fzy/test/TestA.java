package com.fzy.test;

import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import junit.framework.TestCase;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONObject;

import com.fzy.action.app.person.PersonAction;
import com.fzy.action.app.person.PersonForm;
import com.fzy.action.app.person.PersonQuery;
import com.fzy.core.entity.NameValuePair;
import com.fzy.core.entity.ValidationContext;
import com.fzy.webtools.A;
import com.fzy.webtools.ValidationUtils;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.xone.model.hibernate.entity.Person;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class TestA extends TestCase {
    private static Log log = LogFactory.getLog( TestA.class );
    public void test7() throws IOException, TemplateException {
        String ftl = "[${fieldText}] length is between  bytes.";
        Map m = new HashMap();
        m.put("fieldText", "username");
        
        Configuration c = new Configuration();
        Template t = new Template(null, new StringReader(ftl), null);
        StringWriter x = new StringWriter();
        t.process(m, x);
        System.out.println(x.toString());
    }
    public void b_test6() {
        JSONObject personRulesConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");
        JSONObject personValidatorsConfig = A.getJsonConfigWithCache("Person-validators.json", PersonAction.class);
        
        PersonForm form = new PersonForm();
        
        ValidationContext context = new ValidationContext();

        try {
            boolean pass = ValidationUtils.validate(form, context, personRulesConfig, personValidatorsConfig);
            System.out.println(pass);
            if(context.hasError()){
                log.info("field errors:");
                for (Iterator iterator = context.getFieldErrors().iterator(); iterator.hasNext();) {
                    NameValuePair fieldError = (NameValuePair) iterator.next();
                    log.info("error field :" + fieldError.getName());
                    log.info("error text :" + fieldError.getValue());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    public void b_test5() {
        JSONObject personRulesConfig = A.getJsonConfigWithCacheOfWeb("/assets/data/action/person/Person-validation-rules.json");

        JSONObject commonValidatorsConfig = A.getJsonConfigWithCacheOfClass("/conf-fzy/validators.json");
        JSONObject personValidatorsConfig = A.getJsonConfigWithCache("Person-validators.json", PersonAction.class);
        JSONObject[] validatorConfigArray = new JSONObject[] { personValidatorsConfig, commonValidatorsConfig };
        
        try {
            List result = ValidationUtils.ruleConfig2list(personRulesConfig, validatorConfigArray);
            System.out.println(result.size());
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }

        
    }
    

    public void b_test4() {
        Session s = A.getSesson();
        Transaction t = s.beginTransaction();
        Person p1 = new Person();
        p1.setUsername("wang5");
        p1.setFlagDeleted("0");
        p1.setUserCreated(new Long(0));
        p1.setDateCreated(new Date());
        p1.setUserUpdated(new Long(0));
        p1.setLastUpdated(new Date());
        s.save(p1);
        t.commit();
        s.close();
    }

    public void b_test3() throws SQLException {
        SqlMapClient sqlMap;
        try {
            // 声明配置文件的名称（映射文件被定义在其中）
            String resource = "conf-fzy/SqlMapConfig.xml";
            // 利用工具类Resources来读取到配置文件
            Reader reader = Resources.getResourceAsReader(resource);
            // 创建SqlMapClient接口的变量实例
            sqlMap = SqlMapClientBuilder.buildSqlMapClient(reader);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Error initializing MyAppSqlConfig class. Cause: " + e);
        }
        
        
        PersonQuery p = new PersonQuery();
        p.setUsername("zhangsan");
        p.setFlagDeleted("0");
        List l = sqlMap.queryForList("selectPerson", p);
        System.out.println(l.size());
    }

    public void bak_test2() {
        // String p = A.class.getResource("").getPath();
        // System.out.println("1:" + p);
        // p = A.class.getResource("/").getPath();
        // System.out.println("2:" + p);
        // p = A.getClassLoader().getResource("").getPath();
        // System.out.println("3:" + p);
        // InputStream is =
        // A.getClassLoader().getResourceAsStream("../../config.properties");
        // System.out.println(is);
        // p =
        // PersonAction.class.getResource("Person-conditions.json").getPath();
        // System.out.println(p);
    }

    public void bak_test1() {
        ResourceBundle aplicationResource = ResourceBundle.getBundle("conf-fzy.application", Locale.getDefault());
        String result = aplicationResource.getString("methodName1");
        System.out.println(result);
    }
}
