/**
 *
 **************************************************************
 * @Project     : IUserResetPwdService.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Reset Password
 * @Description	: User Reset Password Service Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service;

import com.nasoft.sysmanage.model.UserResetPwdBean;

public interface IUserResetPwdService {

	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userResetPwdVO
	 * @return boolean
	 * @Description reset password
	 */
	public boolean resetPwd(UserResetPwdBean userResetPwdBean);
}
