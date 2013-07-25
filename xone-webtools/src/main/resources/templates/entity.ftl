package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class ${tableName} implements Serializable {

<#list tableProperties as p>
	protected ${p.className} ${p.javaVarName};
</#list>

// business logic
<#list tableProperties as p>
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

// business logic
<#list tableProperties as p>
	public ${p.className} get${p.javaName}Min() {
		return ${p.javaVarName}Min;
	}
	public void set${p.javaName}Min(${p.className} ${p.javaVarName}Min) {
		this.${p.javaVarName}Min = ${p.javaVarName}Min;
	}
	public ${p.className} get${p.javaName}Max() {
		return ${p.javaVarName}Max;
	}
	public void set${p.javaName}Max(${p.className} ${p.javaVarName}Max) {
		this.${p.javaVarName}Max = ${p.javaVarName}Max;
	}
</#list>
	
}
