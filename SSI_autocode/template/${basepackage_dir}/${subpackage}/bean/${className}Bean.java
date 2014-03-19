<#assign className = table.className>   
<#assign classNameLower = table.classNameFirstLower> 
package ${basepackage}.${subpackage}.bean;
import java.text.ParseException;

public class ${className}Bean{
	
	//date formats
	<#list table.columns as column>
	<#if column.isDateTimeColumn>
	public static final String FORMAT_${column.constantName} = "DATE_TIME_FORMAT";
	</#if>
	</#list>
	
	//columns START
	<#list table.columns as column>
	private ${column.javaType} ${column.columnNameFirstLower};
	</#list>
	//columns END

<@generateJavaColumns/>

<#macro generateJavaColumns>
	<#list table.columns as column>
		<#if column.isDateTimeColumn>
	public String get${column.columnName}String() {
		return ConvertBuilder.dateToString(get${column.columnName}());
	}
	public void set${column.columnName}String(String value)  throws ParseException {
		set${column.columnName}(ConvertBuilder.stringToDate(value));
	}
	
		</#if>	
	public void set${column.columnName}(${column.javaType} value) {
		this.${column.columnNameFirstLower} = value;
	}
	
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameFirstLower};
	}
	</#list>
</#macro>

}
