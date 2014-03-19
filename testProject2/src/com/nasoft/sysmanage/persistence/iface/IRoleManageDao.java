/**
 *
 **************************************************************
 * @Project     : IRoleManageDao.java
 * @date        : Nov 14, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: RoleManage
 * @Description	: Role data persistence interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.iface;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.nasoft.sysmanage.model.RoleBean;
import com.nasoft.sysmanage.model.PositionBean;;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public interface IRoleManageDao {
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param companyCode
	 * @return List
	 * @Description Get role information
	 */
	public List getRoleInfo(String companyCode);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @return Integer
	 * @Description Get update roles count
	 */
	public Integer getUpdateRoleCount(RoleBean roleBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param map
	 * @return Integer
	 * @Description Get insert roles count
	 */
	public Integer getInsertRoleCount(HashMap<String,Object> map);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param map
	 * @return Integer
	 * @Description Add role information
	 */
	public void insertRoleInfo(RoleBean roleBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return Integer
	 * @Description Get position count
	 */
	public Integer getRoleCount(String roleId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return Integer
	 * @Description Get role count
	 */
	public Integer getPositionCount(String roleId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @Description Delete role count
	 */
	public void deleteRoleInfo(String roleId);
	
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
	public void modifyOneRoleInfo(RoleBean roleBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get role permission
	 */
	public List getRolePrivile();
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get role permission T
	 */
	public List getRolePrivileT();
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return List
	 * @Description Get menu role information
	 */
	public List getMenuRole(String roleId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @Description Remove menu role information
	 */
	public void deleteMenuRole(String roleId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @Description Remove menu role information T
	 */
	public void deleteMenuRoleT(String roleId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param list
	 * @Description Add menu role information
	 */
	public void insertMenuRole(List list) throws SQLException;
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @return List
	 * @Description Get position user information
	 */
	public List getPositionUser(PositionBean positionBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @return Integer
	 * @Description Get function counts
	 */
	public Integer getFuncCount(PositionBean positionBean);

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @Description Add function password
	 */
	public void insertFuncPwd(PositionBean positionBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @Description Remove function password
	 */
	public void deleteFuncPwd(PositionBean positionBean);

}
