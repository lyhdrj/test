/**
 *
 **************************************************************
 * @Project     : IRoleManageService.java
 * @date        : Nov 12, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: RoleManage
 * @Description	: Role Manager Business Logic Layer Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service;

import java.util.List;

import com.nasoft.sysmanage.model.RoleBean;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public interface IRoleManageService {

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param companyCode
	 * @return List
	 * @Description Get role information
	 */
	public List getRoleInfo(String companyCode);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param companyCode
	 * @return String
	 * @Description Check role information
	 */
	public String checkRoleInfo(RoleBean roleBean,String type,String com);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @Description Add role information
	 */
	public void addRoleInfo(RoleBean roleBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleID
	 * @return boolean
	 * @Description Delete role information
	 */
	public boolean deleteRole(String roleID);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return RoleBean
	 * @Description Get a role information
	 */
	public RoleBean getOneRoleInfo(String roleId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @Description Modify a role information
	 */
	public void updateOneRoleInfo(RoleBean roleBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleID
	 * @param rights
	 * @return RoleBean
	 * @Description Get role permission
	 */
	public List getRolePrivilege(String roleID,String rights);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleMenuList
	 * @param roleID
	 * @param rights
	 * @param companyCode
	 * @return boolean
	 * @Description Update role permission
	 */
	public boolean updateRolePrivilege(final List roleMenuList,final String roleID,final String rights,final String companyCode) throws Exception;
}
