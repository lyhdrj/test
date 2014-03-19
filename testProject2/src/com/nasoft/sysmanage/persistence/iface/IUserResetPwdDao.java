/**
 *
 **************************************************************
 * @Project     : IUserResetPwdDao.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Reset Password
 * @Description	: User Reset Password DAO Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.iface;

import com.nasoft.sysmanage.model.UserResetPwdBean;

public interface IUserResetPwdDao {
	
	/**
	 * @author Chi Kehan 2012-11-13
	 * @param userResetPwdBean
	 * @return int
	 * @Description reset password
	 */
	public int resetPwd(UserResetPwdBean userResetPwdBean);

}
