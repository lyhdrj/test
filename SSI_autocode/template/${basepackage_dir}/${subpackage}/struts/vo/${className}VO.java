<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.${subpackage}.struts.vo;

public class ${className}VO{
	
	
	//columns START
	<#list table.columns as column>
	private String ${column.columnNameLower};
	</#list>
	//columns END

<@generateJavaColumns/>

<#macro generateJavaColumns>
	<#list table.columns as column>
	public void set${column.columnName}(String value) {
		this.${column.columnNameLower} = value;
	}
	
	public String get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	</#list>
</#macro>

}
