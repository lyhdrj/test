<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.${subpackage}.service;
import ${basepackage}.${subpackage}.struts.vo.${className}VO;
import ${basepackage}.core.exception.BusinessException;
import ${basepackage}.sysmanage.model.PageBean;
import java.util.Collection;
import java.io.Serializable;
import java.util.List;
public interface I${className}Service{
	
	public List<${className}VO> query${className}(${className}VO ${classNameLower}VO,PageBean pageBean)
	throws BusinessException;

	public void add${className}(${className}VO ${classNameLower}VO)
		throws BusinessException;
	
	public Integer query${className}Count(${className}VO ${classNameLower}VO) throws BusinessException;
	
	public boolean delete${className}(String []ids)
		throws BusinessException;
	
	public ${className}VO queryOne(${className}VO ${classNameLower}VO)
		throws BusinessException;
	
	public boolean update${className}(${className}VO ${classNameLower}VO)
		throws BusinessException;
		
		
	public List<${className}VO> queryAll(${className}VO ${classNameLower}VO)
		throws BusinessException;
}
