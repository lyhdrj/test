/**
 *
 **************************************************************
 * @Project     : IUserManageDao.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Management
 * @Description	: User Management Dao Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.iface;

import java.util.List;

import com.nasoft.sysmanage.model.UserBean;
import com.nasoft.sysmanage.model.PositionBean;

@SuppressWarnings("unchecked")
public interface IUserManageDao {
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @return List
	 * @Description get one user position.
	 */
	public List getUserPosition();
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param managementCode
	 * @return List
	 * @Description get all user position by departmentcode.
	 */
	public List getUserPositionInfo(String managementCode);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param managementCode
	 * @return String
	 * @Description get user department by departmentcode
	 */
	public String getUserDepartment(String managementCode);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param positionId
	 * @return PositionBean
	 * @Description get position infomation by positionid.
	 */
	public PositionBean getPositionName(String positionId);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param positionId
	 * @return List
	 * @Description get all userinfo by positionid.
	 */
	public List getAllUserInfo(String positionId,int firstResult,int maxResult);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param companyCode
	 * @return String
	 * @Description get all department by orgCode
	 */
	public String getDepartmentByCode(String orgCode);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param orgCode
	 * @return List
	 * @Description get all organisation information
	 */
	public List getOrgTree(String orgCode);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @return Integer
	 * @Description get max user id.
	 */
	public Integer getUserId();
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @return void
	 * @Description insert user info into user table.
	 */
	public void addUserInfo(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @return void
	 * @Description insert info into position_user table.
	 */
	public void addPositionUser(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean
	 * @return List
	 * @Description get menu info by userid.
	 */
	public List getMenuId(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean
	 * @return Integer
	 * @Description TODO
	 */
	public Integer getFuncPwdCount(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @Description TODO
	 */
	public void insertFuncPwd(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userId
	 * @return UserBean
	 * @Description get one user info by userid.
	 */
	public UserBean getUserInfo(String userId);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userName
	 * @return Integer
	 * @Description check login username.
	 */
	public Integer checkLoginName(String userName);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @Description update user info into database.
	 */
	public void updateUserInfo(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @Description update user position info into database.
	 */
	public void updatePositionInfo(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @Description reset password
	 */
	public void resetPassword(UserBean userBean);
	/**
	 * @author Chi Kehan 2012-11-14
	 * @param userID 
	 * @return int
	 * @Description delete user info
	 */
	public int deleteUserInfo(String userID);
	/**
	 * @author Chi Kehan 2012-11-14
	 * @param userID 
	 * @return int
	 * @Description delete user position info
	 */
	public int deleteUserPositionInfo(String userID);
	
	/**
	 * @author Chi Kehan 2012-11-16
	 * @param positionID
	 * @return int
	 * @Description get all users' count.
	 */
	public Integer getAllUserCount(String positionID);
	
}
