/**
 *
 **************************************************************
 * @Project     : UserResetPwdDaoImpl.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Reset Password
 * @Description	: User Reset Password DAO Implement
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.sqlmapdao;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.sysmanage.model.UserResetPwdBean;
import com.nasoft.sysmanage.persistence.iface.IUserResetPwdDao;

public class UserResetPwdDaoImpl extends SqlMapClientTemplate implements IUserResetPwdDao{

	public int resetPwd(UserResetPwdBean userResetPwdBean) {
		return update("UserResetPwd.resetPwd",userResetPwdBean);
	}

}
