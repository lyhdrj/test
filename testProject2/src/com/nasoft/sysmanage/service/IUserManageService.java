/**
 *
 **************************************************************
 * @Project     : IUserManageService.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Management
 * @Description	: User Management Service Interface
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

import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.UserBean;
import com.nasoft.sysmanage.model.PositionBean;

@SuppressWarnings("unchecked")
public interface IUserManageService {
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLoginBean
	 * @return List
	 * @Description get user's position
	 */
	public List getUserPosition(UserLoginBean userLoginBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param managementCode
	 * @return String
	 * @Description get user's department
	 */
	public String getUserDepartment(String managementCode);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param positionId
	 * @return PositionBean
	 * @Description get position information.
	 */
	public PositionBean getPositionName(String positionId);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param pIdTmp
	 * @param flagDB
	 * @return List
	 * @Description get all users' information
	 */
	public List getAllUserInfo(String pIdTmp,String flagDB,PageBean pageBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param companyCode
	 * @return List
	 * @Description get organisations' information.
	 */
	public List getOrgTree(String companyCode);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean
	 * @param userLoginBean
	 * @param flagDB 
	 * @return void
	 * @Description add one user into database.
	 */
	public void addUserInfo(UserBean userBean, UserLoginBean userLoginBean,
			String flagDB);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userID
	 * @param flagDB
	 * @return List
	 * @Description get one user info by userid.
	 */
	public List getUserInfo(String userID, String flagDB);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param code
	 * @return String
	 * @Description get department's information by departmentcode.
	 */
	public String getDepartmentByCode(String code);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userName
	 * @return String
	 * @Description check login username.
	 */
	public String checkLoginName(String userName);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean
	 * @param userID
	 * @param flagDB 
	 * @return void
	 * @Description update user infomation into database.
	 */
	public void updateUserInfo(UserBean userBean, String userID, String flagDB);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean 
	 * @return void
	 * @Description reset password
	 */
	public void resetPassword(UserBean userBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userBean
	 * @param userLoginBean
	 * @return boolean
	 * @Description update user position.
	 */
	public boolean updateUserPosition(UserBean userBean,UserLoginBean userLoginBean);
	/**
	 * @author Chi Kehan 2012-11-14
	 * @param userID
	 * @return boolean
	 * @Description delete user infomation
	 */
	public boolean deleteUserInfo(String userID);
	
	/**
	 * @author Chi Kehan 2012-11-16
	 * @param positionID
	 * @return int
	 * @Description 
	 */
	public int getAllUserCount(String positionID);
	
}
