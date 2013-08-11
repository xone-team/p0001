package com.xone.model.hibernate.entity;

import java.io.Serializable;
import java.util.Date;

public class ${tableName} extends MyModel implements Serializable {

<#list tableProperties as p>
	protected ${p.className} ${p.javaVarName};
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
