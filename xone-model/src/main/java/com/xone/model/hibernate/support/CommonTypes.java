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
        
        // init topad checkStatus type
        typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("处理中", "1"));
        typeList.add(new NameValuePairs("已取消", "2"));
        typeList.add(new NameValuePairs("已生效", "3"));
        result.setTopadCheckStatusList(typeList);
        
        // init product checkStatus type
        typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("处理中", "1"));
        typeList.add(new NameValuePairs("已取消", "2"));
        typeList.add(new NameValuePairs("已交易", "3"));
        result.setProductCheckStatusList(typeList);
        
        // init other1 checkStatus type
        typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("待审核", "0"));
        typeList.add(new NameValuePairs("审核通过", "1"));
        typeList.add(new NameValuePairs("审核不通过", "2"));
        result.setOther1CheckStatusList(typeList);;
        
        // init saleType type
        typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("普通", "0"));
        typeList.add(new NameValuePairs("促销", "1"));
        typeList.add(new NameValuePairs("组团", "2"));
        result.setSaleTypeList(typeList);
        
        // init productType type
        typeList = new ArrayList<NameValuePairs>();
        typeList.add(new NameValuePairs("冻品", "1"));
        typeList.add(new NameValuePairs("干货", "2"));
        typeList.add(new NameValuePairs("活鲜", "3"));
        typeList.add(new NameValuePairs("水果", "4"));
        typeList.add(new NameValuePairs("调料", "5"));
        result.setProductTypeList(typeList);
        
        
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
    
    /**
     * 置顶审核状态
     */
    private List<NameValuePairs> topadCheckStatusList;
    
    /**
     * 置顶审核状态
     */
    private List<NameValuePairs> productCheckStatusList;
    
    /**
     * 审核状态
     */
    private List<NameValuePairs> other1CheckStatusList;
    
    /**
     * 销售类型
     */
    private List<NameValuePairs> saleTypeList;
    
    /**
     * 产品类型
     */
    private List<NameValuePairs> productTypeList;
    
    //TODO 认证标识
    
    //TODO  资源类型 ACTION 静态文件
    
    
    
    public static String getYNTypeName(String value){
        return value2name(value, getInstance().getYnList());
    }
    
    public static String getUserLevelTypeName(String value){
        return value2name(value, getInstance().getUserLevelList());
    }
    
    public static String getTopadCheckStatusTypeName(String value){
        return value2name(value, getInstance().getTopadCheckStatusList());
    }
    
    public static String getProductCheckStatusTypeName(String value){
        return value2name(value, getInstance().getProductCheckStatusList());
    }
    
    public static String getOther1CheckStatusTypeName(String value){
        return value2name(value, getInstance().getOther1CheckStatusList());
    }
    
    
    public static String getSaleTypeTypeName(String value){
        return value2name(value, getInstance().getSaleTypeList());
    }
    
    public static String getProductTypeTypeName(String value){
        return value2name(value, getInstance().getProductTypeList());
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

    public List<NameValuePairs> getTopadCheckStatusList() {
        return topadCheckStatusList;
    }

    public void setTopadCheckStatusList(List<NameValuePairs> topadCheckStatusList) {
        this.topadCheckStatusList = topadCheckStatusList;
    }

    public List<NameValuePairs> getSaleTypeList() {
        return saleTypeList;
    }

    public void setSaleTypeList(List<NameValuePairs> saleTypeList) {
        this.saleTypeList = saleTypeList;
    }

    public List<NameValuePairs> getProductCheckStatusList() {
        return productCheckStatusList;
    }

    public void setProductCheckStatusList(List<NameValuePairs> productCheckStatusList) {
        this.productCheckStatusList = productCheckStatusList;
    }

    public List<NameValuePairs> getProductTypeList() {
        return productTypeList;
    }

    public void setProductTypeList(List<NameValuePairs> productTypeList) {
        this.productTypeList = productTypeList;
    }

    public List<NameValuePairs> getOther1CheckStatusList() {
        return other1CheckStatusList;
    }

    public void setOther1CheckStatusList(List<NameValuePairs> other1CheckStatusList) {
        this.other1CheckStatusList = other1CheckStatusList;
    }

    
    
    
}
