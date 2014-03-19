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
			log.error("��ִ��UserLoginAction���е�selectFirst����ʱ����"
					+ e.getMessage());
			request.setAttribute("errorMessage", "��ִ��UserLoginAction���е�selectFirst����ʱ����"+e.getMessage());
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
			// 1���������ݣ���֤ͨ����0���������ݣ���֤û��ͨ��
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
			log.error("��ִ��UserLoginAction���е�selectValidate����ʱ����"
					+ e.getMessage());
			request.setAttribute("errorMessage", "��ִ��UserLoginAction���е�selectValidate����ʱ����"+e.getMessage());
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

				// ��½ʱ��
				Date logintime = new Date();
				// ��ÿͻ��˵�ip��ַ
				String userIP = request.getRemoteAddr();

				result.setCompany(result.getCompany_code());
				result.setLogintime(logintime);
				result.setLoginip(userIP);

				
				// ����Ȩ�����ɲ˵���
				List menuList = service.selMenuTwo(result);
				session.setAttribute("menuList", menuList);
				session.setAttribute("userlogin", result);
				service.updateLoginInfo(result);
				return "success";
			}
		} catch (Exception e) {
			log.error("��ִ��UserLoginAction���е�userLogin����ʱ����"
					+ e.getMessage());
			request.setAttribute("errorMessage", "��ִ��UserLoginAction���е�userLogin����ʱ����"+e.getMessage());
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
			log.error("��ִ��UserLoginAction���е�logout����ʱ����" + e.getMessage());
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