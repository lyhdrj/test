/**
 *
 **************************************************************
 * @Project     : UserManageDaoImpl.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Management
 * @Description	: User Management Dao Implement
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.sqlmapdao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.sysmanage.model.PositionBean;
import com.nasoft.sysmanage.model.UserBean;
import com.nasoft.sysmanage.persistence.iface.IUserManageDao;

@SuppressWarnings("unchecked")
public class UserManageDaoImpl extends SqlMapClientTemplate implements IUserManageDao{

	public List getUserPosition() {
		return queryForList("UserManage.getUserPosition");
	}

	public List getUserPositionInfo(String managementCode) {
		return queryForList("UserManage.getUserPositionInfo",managementCode);
	}

	public String getUserDepartment(String managementCode) {
		return (String)queryForObject("UserManage.getUserDepartment",managementCode);
	}

	public PositionBean getPositionName(String positionId) {
		return (PositionBean)queryForObject("UserManage.getPositionName",positionId);
	}

	public List getAllUserInfo(String positionId,int firstResult,int maxResult) {
		return queryForList("UserManage.getUserInfo",positionId,firstResult,maxResult);
	}

	public String getDepartmentByCode(String orgCode) {
		return (String)queryForObject("UserManage.getDepartmentByCode",orgCode);
	}

	public List getOrgTree(String orgCode) {
		return queryForList("UserManage.getOrgTree",orgCode);
	}

	public Integer getUserId() {
		return (Integer)queryForObject("UserManage.getUserId");
	}

	public void addUserInfo(UserBean userBean) {
		insert("UserManage.insertUserInfo",userBean);
	}

	public void addPositionUser(UserBean userBean) {
		insert("UserManage.insertPositionUser",userBean);
	}

	public List getMenuId(UserBean userBean) {
		return queryForList("UserManage.getMenuId",userBean);
	}

	public Integer getFuncPwdCount(UserBean userBean) {
		return (Integer)queryForObject("UserManage.getFuncPwdCount",userBean);
	}

	public void insertFuncPwd(UserBean userBean) {
		insert("UserManage.insertFuncPwd",userBean);
	}

	public UserBean getUserInfo(String userId) {
		return (UserBean)queryForObject("UserManage.getOneUserInfo",userId);
	}

	public Integer checkLoginName(String userName) {
		return (Integer)queryForObject("UserManage.checkLoginName",userName);
	}

	public void updateUserInfo(UserBean userBean) {
		update("UserManage.updateUserInfo",userBean);
	}

	public void updatePositionInfo(UserBean userBean) {
		update("UserManage.updatePositionInfo",userBean);
	}

	public void resetPassword(UserBean userBean) {
		update("UserManage.resetPassword",userBean);
	}

	public int deleteUserInfo(String userID) {
		// TODO Auto-generated method stub
		return delete("UserManage.deleteUserInfo", userID);
	}

	public int deleteUserPositionInfo(String userID) {
		// TODO Auto-generated method stub
		return delete("UserManage.deleteUserPositionInfo", userID);
	}

	public Integer getAllUserCount(String positionID) {
		// TODO Auto-generated method stub
		return (Integer) queryForObject("UserManage.getAllUserCount", positionID);
	}

}
