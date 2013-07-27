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
    
    private static CommonTypes init(){
        CommonTypes result = new CommonTypes();
        
        ArrayList<NameValuePairs> typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("是", "1"));
        typeList.add(new NameValuePairs("否", "0"));
        result.setYnList(typeList);
        
        return result;
    }
    
    /**
     * 是否类型
     */    
    private List<NameValuePairs> ynList;
    
    public static String getYNTypeValue(String key){
        String result = "";
        for (Iterator<NameValuePairs> iterator = getInstance().getYnList().iterator(); iterator.hasNext();) {
            NameValuePairs pair = iterator.next();
            if(key.equals(pair.getName())){
                result = pair.value;
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
    
    
}
