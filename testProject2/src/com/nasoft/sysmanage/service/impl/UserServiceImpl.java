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

import java.util.List;

import javax.transaction.TransactionManager;


import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.persistence.iface.IUserLoginDao;
import com.nasoft.sysmanage.service.IUserService;
import com.nasoft.sysmanage.model.CompanyBean;
import com.nasoft.util.MD5;

@SuppressWarnings("unchecked")
public class UserServiceImpl implements IUserService {
	private IUserLoginDao dao;

	public IUserLoginDao getDao() {
		return dao;
	}

	public void setDao(IUserLoginDao dao) {
		this.dao = dao;
	}

	

	/**
	 * 取得所有公司名称
	 * 
	 * @return
	 */

	public List<CompanyBean> getAllCompany() {

		return dao.getAllCompany();
	}

	/**
	 * 验证用户名密码在数据库是否存在
	 * 
	 * @return
	 */
	public boolean getValidate(UserLoginBean userLoginBean) {
		int resultCount = 0;
		
		resultCount = dao.getValidateInfo(userLoginBean).intValue();
		if (resultCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 验证用户名是否有权限登录
	 * 
	 * @return
	 */
	public boolean validateUser(String userName) {
		int resultCount = 0;
		resultCount = dao.validateUser(userName).intValue();
		if (resultCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 用户登陆
	 * 
	 * @param userLoginForm
	 * @return
	 */
	public UserLoginBean userLogin(UserLoginBean userLoginBean) {

		String loginName = userLoginBean.getUsername().trim();
		String loginPwd = MD5.getMD5(userLoginBean.getPassword().trim());
		userLoginBean.setPassword(loginPwd);
		String skipIdName;
		if ("system".equalsIgnoreCase(loginName)) {
			skipIdName = "UserLogin.getSysUserInfo";
		} else {			
			skipIdName = "UserLogin.getUserInfo";
		}
		return dao.userLogin(skipIdName, userLoginBean);
	}



	/**
	 * 根据权限查找菜单
	 * 
	 * @param userLogin
	 * @return
	 */
	public List selMenuTwo(UserLoginBean userLogin) {
		String skipIdName = "";
		if ("0".equals(userLogin.getUserid())) {
			skipIdName = "UserLogin.getMenuInfoOne";
		} else {
			if ("true".equalsIgnoreCase(userLogin.getRightsB())) {
				skipIdName = "UserLogin.getMenuInfoTwo";
			} else {
				skipIdName = "UserLogin.getMenuInfoThree";
			}
		}
		return dao.selMenuTwo(skipIdName, userLogin.getUserid());
	}

	/**
	 * 修改登陆信息
	 * 
	 * @param userLogin
	 */
	public void updateLoginInfo(UserLoginBean userLogin) {
		dao.updateLoginInfo(userLogin);
	}

}
