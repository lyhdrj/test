/**
 *
 **************************************************************
 * @Project     : IUserService.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Login
 * @Description	: User Login Service Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service;
/**
 * @author bilimin
 * @version 1.0.1, 2008-07-17
 */
import java.util.List;

import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.CompanyBean;


@SuppressWarnings("unchecked")
public interface IUserService {
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @return List<CompanyBean>
	 * @Description get all company.
	 */
	public List<CompanyBean> getAllCompany();
	
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLoginBean
	 * @return boolean
	 * @Description validate username and password.
	 */
	public boolean getValidate(UserLoginBean userLoginBean);
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLoginBean
	 * @return UserLoginBean
	 * @Description user login
	 */
	public UserLoginBean userLogin(UserLoginBean userLoginBean);
	
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLogin
	 * @return List
	 * @Description get menu list.
	 */
	public List selMenuTwo(UserLoginBean userLogin);
	
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userLogin 
	 * @Description update login info into database.
	 */
	public void updateLoginInfo(UserLoginBean userLogin);
	
	/**
	 * @author Liu Hanpeng Jan 7, 2013
	 * @param username
	 * @return 
	 * @Description check user login grant
	 */
	public boolean validateUser(String userName);
}
