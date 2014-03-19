/**
 *
 **************************************************************
 * @Project     : RoleManageDaoImpl.java
 * @date        : Nov 12, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: RoleManage
 * @Description	: Role data persistence
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.sqlmapdao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.sysmanage.model.RoleBean;
import com.nasoft.sysmanage.model.RoleMenuBean;
import com.nasoft.sysmanage.model.PositionBean;
import com.nasoft.sysmanage.persistence.iface.IRoleManageDao;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public class RoleManageDaoImpl extends SqlMapClientTemplate implements IRoleManageDao{

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param companyCode
	 * @return List
	 * @Description Get role information
	 */
	public List getRoleInfo(String companyCode) {
		return queryForList("RoleManage.getRoleInfo",companyCode);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param map
	 * @return Integer
	 * @Description Get insert roles count
	 */
	public Integer getInsertRoleCount(HashMap<String,Object> map) {
		return (Integer)queryForObject("RoleManage.getInsertRoleCount",map);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @return Integer
	 * @Description Get update roles count
	 */
	public Integer getUpdateRoleCount(RoleBean roleBean) {
		return (Integer)queryForObject("RoleManage.getUpdateRoleCount",roleBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param map
	 * @return Integer
	 * @Description Add role information
	 */
	public void insertRoleInfo(RoleBean roleBean) {
		insert("RoleManage.insertRoleInfo",roleBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return Integer
	 * @Description Get position count
	 */
	public Integer getPositionCount(String roleId) {
		return (Integer)queryForObject("RoleManage.getPositionCount",roleId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return Integer
	 * @Description Get role count
	 */
	public Integer getRoleCount(String roleId) {
		return (Integer)queryForObject("RoleManage.getRoleCount",roleId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @Description Delete role count
	 */
	public void deleteRoleInfo(String roleId) {
		delete("RoleManage.deleteRoleInfo",roleId);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return RoleBean
	 * @Description Get a role information
	 */
	public RoleBean getOneRoleInfo(String roleId) {
		return (RoleBean)queryForObject("RoleManage.getOneRoleInfo",roleId);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @Description Modify a role information
	 */
	public void modifyOneRoleInfo(RoleBean roleBean) {
		update("RoleManage.modifyOneRoleInfo",roleBean);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get role permission
	 */
	public List getRolePrivile() {
		return queryForList("RoleManage.getRolePrivile");
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get role permission T
	 */
	public List getRolePrivileT() {
		return queryForList("RoleManage.getRolePrivileT");
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return List
	 * @Description Get menu role information
	 */
	public List getMenuRole(String roleId) {
		return queryForList("RoleManage.getMenuRole",roleId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @Description Remove menu role information
	 */
	public void deleteMenuRole(String roleId) {
		delete("RoleManage.deleteMenuRole",roleId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @Description Remove menu role information T
	 */
	public void deleteMenuRoleT(String roleId) {
		delete("RoleManage.deleteMenuRoleT",roleId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param list
	 * @Description Add menu role information
	 */
	public void insertMenuRole(List list) throws SQLException {
		RoleMenuBean roleMenuBean = null;
		this.getSqlMapClient().startBatch();
		for(int i=0;i<list.size();i++) {
			roleMenuBean = (RoleMenuBean)list.get(i);
			insert("RoleManage.insertMenuRole",roleMenuBean);
		}
		this.getSqlMapClient().executeBatch();
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @return List
	 * @Description Get position user information
	 */
	public List getPositionUser(PositionBean positionBean) {
		return queryForList("RoleManage.getPositionUser",positionBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @return Integer
	 * @Description Get function counts
	 */
	public Integer getFuncCount(PositionBean positionBean) {
		return (Integer)queryForObject("RoleManage.getFuncCount",positionBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @Description Add function password
	 */
	public void insertFuncPwd(PositionBean positionBean) {
		insert("RoleManage.insertFuncPwd",positionBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param positionBean
	 * @Description Remove function password
	 */
	public void deleteFuncPwd(PositionBean positionBean) {
		delete("RoleManage.deleteFuncPwd",positionBean);
	}

}
