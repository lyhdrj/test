<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   
package ${basepackage}.${subpackage}.dao.impl;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import  ${basepackage}.${subpackage}.dao.I${className}DAO;
import  ${basepackage}.${subpackage}.bean.${className}Bean;
import javax.annotation.Resource;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

public class ${className}DAOImpl extends SqlMapClientTemplate  implements
		I${className}DAO {
	    
	    

		public List<${className}Bean> query${className}(${className}Bean ${classNameLower}Bean,int firstResult,int maxResult) {
			return queryForList("${className}.get${className}", ${classNameLower}Bean,firstResult,maxResult);
		}
		
		public void add${className}(${className}Bean ${classNameLower}Bean) {
		insert("${className}.add${className}",${classNameLower}Bean);
	}
	
	public Integer query${className}Count(${className}Bean ${classNameLower}Bean) {
		return (Integer)queryForObject("${className}.get${className}Count", ${classNameLower}Bean);
	}
	
	public int delete${className}(List<String> beanList) {
		return delete("${className}.delete${className}",beanList);
	}
	
	public List<${className}Bean> queryOne(${className}Bean ${classNameLower}Bean) {
		return queryForList("${className}.get${className}",${classNameLower}Bean);
	}
	
	
	public Integer update${className}(${className}Bean ${classNameLower}Bean) {
		return update("${className}.update${className}", ${classNameLower}Bean);
	}
	
	public List<${className}Bean> queryAll(${className}Bean ${classNameLower}Bean){
		return queryForList("${className}.get${className}",${classNameLower}Bean);
	}
		
}
