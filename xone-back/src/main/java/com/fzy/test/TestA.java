package com.fzy.test;

import java.io.InputStream;
import java.util.Locale;
import java.util.ResourceBundle;

import junit.framework.TestCase;

import com.fzy.action.app.person.PersonAction;
import com.fzy.webtools.A;


public class TestA extends TestCase {
    public void test1(){
        String p = A.class.getResource("").getPath();
        System.out.println("1:" + p);
        p = A.class.getResource("/").getPath();
        System.out.println("2:" + p);
        p = A.getClassLoader().getResource("").getPath();
        System.out.println("3:" + p);
        InputStream is = A.getClassLoader().getResourceAsStream("../../config.properties");
        System.out.println(is);
        p = PersonAction.class.getResource("Person-conditions.json").getPath();
        System.out.println(p);
    }
    public void bak_test1(){
        ResourceBundle aplicationResource = ResourceBundle.getBundle("conf-fzy.application", Locale.getDefault());
        String result = aplicationResource.getString("methodName1");
        System.out.println(result);
    }
}
