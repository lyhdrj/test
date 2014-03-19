/**
 *
 **************************************************************
 * @Project     : UserResetPwdServiceImpl.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Reset Password
 * @Description	: User Reset Password Serivce Implement
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service.impl;

import com.nasoft.sysmanage.model.UserResetPwdBean;
import com.nasoft.sysmanage.persistence.iface.IUserResetPwdDao;
import com.nasoft.sysmanage.service.IUserResetPwdService;

public class UserResetPwdServiceImpl implements IUserResetPwdService{

	private IUserResetPwdDao userResetPwdDao;

	public void setUserResetPwdDao(IUserResetPwdDao userResetPwdDao) {
		this.userResetPwdDao = userResetPwdDao;
	}

	public boolean resetPwd(UserResetPwdBean userResetPwdBean) {
		int count = userResetPwdDao.resetPwd(userResetPwdBean);
		boolean flag = false;
		if(count>0){
			flag = true;
		}
		return flag;
	}
}
