package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class ${tableName} implements Serializable {

<#list tableProperties as p>
	protected ${p.className} ${p.javaVarName};
</#list>

// business logic
<#list tableProperties as p>
	<#if p.columnClassName == "java.lang.Integer">
	protected Integer ${p.javaVarName}Min;
	protected Integer ${p.javaVarName}Max;
	</#if>
	<#if p.columnClassName == "java.lang.Long">
	protected Long ${p.javaVarName}Min;
	protected Long ${p.javaVarName}Max;
	</#if>
	<#if p.columnClassName == "java.util.Date">
	protected String ${p.javaVarName}Min;
	protected String ${p.javaVarName}Max;
	</#if>
</#list>

<#list tableProperties as p>
	public ${p.className} get${p.javaName}() {
		return ${p.javaVarName};
	}
	public void set${p.javaName}(${p.className} ${p.javaVarName}) {
		this.${p.javaVarName} = ${p.javaVarName};
	}
</#list>


	
}
