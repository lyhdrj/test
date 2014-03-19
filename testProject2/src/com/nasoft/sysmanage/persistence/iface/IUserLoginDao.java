/**
 *
 **************************************************************
 * @Project     : IUserLoginDao.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Login
 * @Description	: User Login DAO Interface
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

import com.nasoft.sysmanage.model.UserLoginBean;

public interface IUserLoginDao {
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @return List
	 * @Description get all company.
	 */
	public List getAllCompany();
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLoginBean
	 * @return Integer
	 * @Description validate username and password
	 */
	public Integer getValidateInfo(UserLoginBean userLoginBean);
	/**
	 * @author Chi Kehan 2013-01-07
	 * @param username
	 * @return Integer
	 * @Description validate user grant
	 */
	public Integer validateUser(String userName);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param skipIdName
	 * @param userLoginBean
	 * @return UserLoginBean
	 * @Description user login
	 */
	public UserLoginBean userLogin(String skipIdName,UserLoginBean userLoginBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param skipIdName
	 * @param userId
	 * @return List
	 * @Description get menu list.
	 */
	public List selMenuTwo(String skipIdName,String userId);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLogin 
	 * @Description update login info into database.
	 */
	public void updateLoginInfo(UserLoginBean userLogin);

}
