/**
 *
 **************************************************************
 * @Project     : UserResetPwdAction.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Reset Password
 * @Description	: User Reset Password Action
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.struts.action;

import com.nasoft.base.BaseAction;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.UserResetPwdBean;
import com.nasoft.sysmanage.service.IUserResetPwdService;
import com.nasoft.util.MD5;

public class UserResetPwdAction extends BaseAction{

	private IUserResetPwdService userResetPwdService;
	private UserResetPwdBean userResetPwdBean;
	/**
	 * @return the userResetPwdService
	 */
	public IUserResetPwdService getUserResetPwdService() {
		return userResetPwdService;
	}
	/**
	 * @param userResetPwdService the userResetPwdService to set
	 */
	public void setUserResetPwdService(IUserResetPwdService userResetPwdService) {
		this.userResetPwdService = userResetPwdService;
	}
	/**
	 * @return the userResetPwdBean
	 */
	public UserResetPwdBean getUserResetPwdBean() {
		return userResetPwdBean;
	}
	/**
	 * @param userResetPwdBean the userResetPwdBean to set
	 */
	public void setUserResetPwdBean(UserResetPwdBean userResetPwdBean) {
		this.userResetPwdBean = userResetPwdBean;
	}
	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description reset password.
	 */
	public String resetPwd() {
		try{
			UserLoginBean userInfoBean=(UserLoginBean)request.getSession().getAttribute("userlogin");
			String userID=userInfoBean.getUserid();
			userResetPwdBean.setUserId(userID);
			userResetPwdBean.setNewPwd(MD5.getMD5(userResetPwdBean.getNewPwd()));
			userResetPwdBean.setOldPwd(MD5.getMD5(userResetPwdBean.getOldPwd()));
			boolean flag = userResetPwdService.resetPwd(userResetPwdBean);
			request.setAttribute("resetFlag",flag);
			userResetPwdBean = new UserResetPwdBean();
		}catch(Exception e) {
			log.error("在执行UserResetPwdAction类中的resetPwd方法时出错：" + e.getMessage());
			request.setAttribute("resetFlag", "false");
		}
		return "resetSuccess";
	}

}
