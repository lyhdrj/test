<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.${subpackage}.service.impl;
import java.util.Collection;
import java.util.List;
import java.util.ArrayList;
import java.io.Serializable;
import java.util.Arrays;
import javax.annotation.Resource;
import  ${basepackage}.${subpackage}.bean.${className}Bean;
import ${basepackage}.${subpackage}.struts.vo.${className}VO;
import ${basepackage}.core.exception.BusinessException;
import  ${basepackage}.${subpackage}.service.I${className}Service;
import  ${basepackage}.${subpackage}.dao.I${className}DAO;
import ${basepackage}.sysmanage.model.PageBean;
import ${basepackage}.util.ConvertBuilder;
public class ${className}ServiceImpl implements I${className}Service{
	
	private I${className}DAO ${classNameLower}Dao;
	
	public I${className}DAO get${className}Dao() {
		return ${classNameLower}Dao;
	}

	public void set${className}DAO(I${className}DAO ${classNameLower}Dao) {
		this.${classNameLower}Dao = ${classNameLower}Dao;
	}

    
	
	
	public List<${className}VO> query${className}(${className}VO ${classNameLower}VO,PageBean pageBean) {
		return to${className}VOList(${classNameLower}Dao.query${className}(to${className}Bean(${classNameLower}VO),pageBean.getFirstResult(),pageBean.getMaxResult()));
	}
	
	public void add${className}(${className}VO ${classNameLower}VO){
		${classNameLower}Dao.add${className}(to${className}Bean(${classNameLower}VO));
	}


	public Integer query${className}Count(${className}VO ${classNameLower}VO) {
		return ${classNameLower}Dao.query${className}Count(to${className}Bean(${classNameLower}VO));
	}


	public boolean delete${className}(String []ids) {
		List<String> idList = Arrays.asList(ids);
		int count = ${classNameLower}Dao.delete${className}(idList);	
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}


	public ${className}VO queryOne(${className}VO ${classNameLower}VO) {
		List<${className}VO> li = to${className}VOList(${classNameLower}Dao.queryOne(to${className}Bean(${classNameLower}VO)));
		if(li == null||li.isEmpty()){
			return null;
		}
		return li.get(0);
	}


	public boolean update${className}(${className}VO ${classNameLower}VO) {
		int count = ${classNameLower}Dao.update${className}(to${className}Bean(${classNameLower}VO));
		if(count > 0){
			return true;
		}
		return false;
	}
	public List<${className}VO> queryAll(${className}VO ${classNameLower}VO){
		return to${className}VOList(${classNameLower}Dao.queryAll(to${className}Bean(${classNameLower}VO)));
	}
	
	/**
	 *beanList to voList
	 * @generated
	 */
	private List<${className}VO> to${className}VOList(List<${className}Bean> beanList)
			throws BusinessException {
		List<${className}VO> voList = new ArrayList<${className}VO>(beanList.size());
		for (int i = 0; i < beanList.size(); i++) {
			voList.add(to${className}VO(beanList.get(i)));
		}
		return voList;
	}
	/**
	 *voList to beanList
	 * @generated
	 */
	private List<${className}Bean> to${className}BeanList(List<${className}VO> voList)
			throws BusinessException {
		List<${className}Bean> beanList = new ArrayList<${className}Bean>(voList.size());
		for (int i = 0; i < voList.size(); i++) {
			beanList.add(to${className}Bean(voList.get(i)));
		}
		return beanList;
	}

	/**
	 * VO to Bean
	 * @generated
	 */
	private ${className}Bean to${className}Bean(${className}VO ${classNameLower}VO)
			throws BusinessException {
		${className}Bean ${classNameLower}Bean = new ${className}Bean();
		try {
			if (${classNameLower}VO != null) {
			<#list table.columns as column>
	        	${classNameLower}Bean.set${column.columnName}(${classNameLower}VO.get${column.columnName}());
			</#list>
			}
		} catch (Exception e) {
			throw new BusinessException(
					"${className}VO转换为${className}Bean时出现异常,请检查输入数据!", e);
		}
		return ${classNameLower}Bean;
	}

	/**
	 * Bean to VO
	 * @generated
	 */
	private ${className}VO to${className}VO(${className}Bean ${classNameLower}Bean) {
		${className}VO ${classNameLower}VO = new ${className}VO();
		if (${classNameLower}Bean != null) {
		<#list table.columns as column>
        	${classNameLower}VO.set${column.columnName}(${classNameLower}Bean.get${column.columnName}());
		</#list>
		}
		return ${classNameLower}VO;
	}
	
	
}
