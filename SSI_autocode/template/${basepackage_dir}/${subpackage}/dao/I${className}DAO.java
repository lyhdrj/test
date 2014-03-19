<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.${subpackage}.dao;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import  ${basepackage}.${subpackage}.bean.${className}Bean;

public interface I${className}DAO {
	
	public List<${className}Bean> query${className}(${className}Bean ${classNameLower}Bean,int firstResult,int maxResult);
	
	public void add${className}(${className}Bean ${classNameLower}Bean);
	
	public Integer query${className}Count(${className}Bean ${classNameLower}Bean);
	
	public int delete${className}(List<String> beanList);
	
	public List<${className}Bean> queryOne(${className}Bean ${classNameLower}Bean);
	
	public Integer update${className}(${className}Bean ${classNameLower}Bean);
	
	public List<${className}Bean> queryAll(${className}Bean ${classNameLower}Bean);
	
}
