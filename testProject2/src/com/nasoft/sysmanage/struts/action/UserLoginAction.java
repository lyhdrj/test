/**
 *
 **************************************************************
 * @Project     : UserLoginAction.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Login
 * @Description	: User Login Action
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.struts.action;

/*
 * @version 1.0.1, 2008-07-17
 */
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.nasoft.base.BaseAction;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.service.IUserService;
import com.nasoft.util.MD5;

public class UserLoginAction extends BaseAction{

	private IUserService service;
	private UserLoginBean userLoginBean;

	/**
	 * @return the service
	 */
	public IUserService getService() {
		return service;
	}

	/**
	 * @param service the service to set
	 */
	public void setService(IUserService service) {
		this.service = service;
	}

	/**
	 * @return the userLoginBean
	 */
	public UserLoginBean getUserLoginBean() {
		return userLoginBean;
	}

	/**
	 * @param userLoginBean the userLoginBean to set
	 */
	public void setUserLoginBean(UserLoginBean userLoginBean) {
		this.userLoginBean = userLoginBean;
	}

	public UserLoginAction(IUserService service) {
		this.service = service;
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description no use
	 */
	public String selectFirst() {

		List results = null;
		try {
			results = service.getAllCompany();
			request.setAttribute("CompanyList", results);
			return "login";
		} catch (Exception e) {
			log.error("在执行UserLoginAction类中的selectFirst方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage", "在执行UserLoginAction类中的selectFirst方法时出错："+e.getMessage());
			return "error";
		}
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description validate username and password
	 */
	public String selectValidate() {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			userLoginBean.setPassword(MD5.getMD5(userLoginBean.getPassword()));
			boolean sign = service.getValidate(userLoginBean);
			// 1代表有数据，验证通过，0代表无数据，验证没有通过
			if (sign) {
				boolean loginFlag = service.validateUser(userLoginBean.getUsername());
				if(loginFlag||"system".equals(userLoginBean.getUsername())){
					out.print(1);
				}else{
					out.print(2);
				}
			} else {
				out.print(0);
			}
		} catch (Exception e) {
			log.error("在执行UserLoginAction类中的selectValidate方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage", "在执行UserLoginAction类中的selectValidate方法时出错："+e.getMessage());
			return "error";
		} finally {
			if (out != null) {
				out.close();
			}
		}
		return null;
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description user login.
	 */
	public String userLogin() {
		try {
			UserLoginBean result = service.userLogin(userLoginBean);
			if (result != null) {
				HttpSession session = request.getSession();

				// 登陆时间
				Date logintime = new Date();
				// 获得客户端的ip地址
				String userIP = request.getRemoteAddr();

				result.setCompany(result.getCompany_code());
				result.setLogintime(logintime);
				result.setLoginip(userIP);

				
				// 根据权限生成菜单项
				List menuList = service.selMenuTwo(result);
				session.setAttribute("menuList", menuList);
				session.setAttribute("userlogin", result);
				service.updateLoginInfo(result);
				return "success";
			}
		} catch (Exception e) {
			log.error("在执行UserLoginAction类中的userLogin方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage", "在执行UserLoginAction类中的userLogin方法时出错："+e.getMessage());
			return "error";
		}
		return "failed";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description user logout.
	 */
	public String logout() {
		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("userlogin") != null) {
				session.removeAttribute("userlogin");
			}
		} catch (Exception e) {
			log.error("在执行UserLoginAction类中的logout方法时出错：" + e.getMessage());
		}
		return "logoutsuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description homepage
	 */
	public String homePage() {
		return "success";
	}

}