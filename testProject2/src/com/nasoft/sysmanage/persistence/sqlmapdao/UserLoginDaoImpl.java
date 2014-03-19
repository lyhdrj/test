/**
 *
 **************************************************************
 * @Project     : UserLoginDaoImpl.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Login
 * @Description	: User Login DAO Implement
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

import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.persistence.iface.IUserLoginDao;

public class UserLoginDaoImpl extends SqlMapClientTemplate implements
		IUserLoginDao {

	public List getAllCompany() {
		return queryForList("UserLogin.getAllCompanys", null);
	}

	public Integer getValidateInfo(UserLoginBean userLoginBean) {
		if (userLoginBean.getUsername().equalsIgnoreCase("system")) {
			return (Integer) queryForObject("UserLogin.getAdminValidate",
					userLoginBean);
		} else {
			return (Integer) queryForObject("UserLogin.getUserValidate",
					userLoginBean);
		}
	}
	public Integer validateUser(String userName) {
		
		return (Integer) queryForObject("UserLogin.validateUser",userName);
	}

	public UserLoginBean userLogin(String skipIdName, UserLoginBean userLogin) {
		return (UserLoginBean) queryForObject(skipIdName, userLogin);
	}

	public List selMenuTwo(String skipIdName, String userId) {
		return queryForList(skipIdName, new Integer(userId));
	}

	public void updateLoginInfo(UserLoginBean userLogin) {
		update("UserLogin.updateLoginInfo", userLogin);
	}

}
