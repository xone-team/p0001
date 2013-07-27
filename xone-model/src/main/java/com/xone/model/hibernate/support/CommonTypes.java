package com.xone.model.hibernate.support;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CommonTypes implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = -544257805676445438L;
    
    static class CommonTypesHolder{
        static CommonTypes instance = init();
    }
    
    public static CommonTypes getInstance(){
        return CommonTypesHolder.instance;
    }
    
    /**
     * @return
     */
    private static CommonTypes init(){
        CommonTypes result = new CommonTypes();
        
        // init yn type
        ArrayList<NameValuePairs> typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("是", "1"));
        typeList.add(new NameValuePairs("否", "0"));
        result.setYnList(typeList);
        
        // init userLevel type
        typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("A级客户", "A"));
        typeList.add(new NameValuePairs("B级客户", "B"));
        typeList.add(new NameValuePairs("C级客户", "C"));
        result.setUserLevelList(typeList);
        
        
        return result;
    }
    
    /**
     * 是否类型
     */    
    private List<NameValuePairs> ynList;
    
    /**
     * 用户级别类型
     */
    private List<NameValuePairs> userLevelList;
    
    public static String getYNTypeName(String value){
        return value2name(value, getInstance().getYnList());
    }
    
    public static String getUserLevelTypeName(String value){
        return value2name(value, getInstance().getUserLevelList());
    }
    
    private static String value2name(String value, List<NameValuePairs> list){
        String result = "";
        if(value == null)
            return result;
        for (Iterator<NameValuePairs> iterator = list.iterator(); iterator.hasNext();) {
            NameValuePairs pair = iterator.next();
            if(value.equals(pair.getValue())){
                result = pair.getName();
                break;
            }
        }
        return result;
    }

    public List<NameValuePairs> getYnList() {
        return ynList;
    }

    public void setYnList(List<NameValuePairs> ynList) {
        this.ynList = ynList;
    }

    public List<NameValuePairs> getUserLevelList() {
        return userLevelList;
    }

    public void setUserLevelList(List<NameValuePairs> userLevelList) {
        this.userLevelList = userLevelList;
    }
    
}
