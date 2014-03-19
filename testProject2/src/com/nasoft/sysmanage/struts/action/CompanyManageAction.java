/**
 *
 **************************************************************
 * @Project     : CompanyManageAction.java
 * @date        : Nov 14,2012
 * @author      : Li Fengli
 * @company     : Nasoft
 * @model		: CompanyManage
 * @Description	: Company Manage Business Logic Layer
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.struts.action;

import java.util.List;

import com.nasoft.base.BaseAction;
import com.nasoft.sysmanage.service.ICompanyManageService;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.CompanyBean;

/**
 * @author Li Fengli
 */
@SuppressWarnings("unchecked")
public class CompanyManageAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	private ICompanyManageService companyManageService;
	private CompanyBean companyBean;

	/**
	 * @return the companyManageService
	 */
	public ICompanyManageService getCompanyManageService() {
		return companyManageService;
	}

	/**
	 * @param companyManageService the companyManageService to set
	 */
	public void setCompanyManageService(ICompanyManageService companyManageService) {
		this.companyManageService = companyManageService;
	}

	/**
	 * @return the companyBean
	 */
	public CompanyBean getCompanyBean() {
		return companyBean;
	}

	/**
	 * @param companyBean the companyBean to set
	 */
	public void setCompanyBean(CompanyBean companyBean) {
		this.companyBean = companyBean;
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @return 
	 * @Description query all company info
	 */
	public String queryCompany() {
		try {
			UserLoginBean userLogin = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			List companyList = companyManageService.getCompanyCode(userLogin);
			request.setAttribute("companyList", companyList);
			request.setAttribute("funShow", "none");
			// 将用户权限放入request中
			request.setAttribute("userDepartment", companyManageService
					.getUserDepartment(userLogin.getManagementCode()));
		} catch (Exception e) {
			log.error("在执行CompanyManageAction类中的queryCompany方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage",
					"在执行CompanyManageAction类中的queryCompany方法时出错:"
							+ e.getMessage());
			return ERROR;
		}
		return "querysuccess";
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @return 
	 * @Description query company info
	 */
	public String queryCompanyInfo() {
		pageBean = getPageBean();
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession().getAttribute("userlogin");
			String parentComCode = "0";
			String parentComName = companyManageService.getCompanyName(parentComCode);
			List companyList = companyManageService.getCompanyCode(userInfoBean);
			List subCompanyList = companyManageService.getCompanyInfo(parentComCode,pageBean);
			setPage(parentComCode);
			companyBean.setParentComCode(parentComCode);
			companyBean.setParentComName(parentComName);
            companyBean.setParentComCode("");
            companyBean.setCompanyName("");
            companyBean.setCompanyCode("");
            companyBean.setPhone("");
            companyBean.setFax("");
            companyBean.setZipcode("");
            companyBean.setAddress("");
			request.setAttribute("userDepartment", userInfoBean.getManagementCode());
			request.setAttribute("subCompanyList", subCompanyList);
			request.setAttribute("companyList", companyList);
			request.setAttribute("pageBean",pageBean);
		} catch (Exception e) {
			log.error("在执行CompanyManageAction类中的queryCompanyInfo方法时出错："+ e.getMessage());
			request.setAttribute("errorMessage","在执行CompanyManageAction类中的queryCompanyInfo方法时出错:"+ e.getMessage());
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @return 
	 * @Description add company info
	 */
	public String addCompanyInfo() {

		UserLoginBean userInfoBean = (UserLoginBean) request.getSession().getAttribute("userlogin");
		String userId = userInfoBean.getUserid();
		String parentComCode = "0";
		boolean flag = false;
		try {
			// 检查公司代码、名称、排序号不重复
			String checkInfo = companyManageService.checkInfo(companyBean,"insert");

			if (checkInfo.equalsIgnoreCase("")) {
				companyBean.setUserId(userId);
				companyManageService.addCompanyInfo(companyBean, userId);
				flag = true;
				request.setAttribute("flag", flag);
			} else {
				request.setAttribute("hintMsg", checkInfo);
			}
            pageBean.setTotalCount(0);
            setPage(parentComCode);
            
            companyBean.setParentComCode("");
            companyBean.setCompanyName("");
            companyBean.setCompanyCode("");
            companyBean.setPhone("");
            companyBean.setAddress("");

            
			List subCompanyList = companyManageService
					.getCompanyInfo(parentComCode,pageBean);
			List companyList = companyManageService
					.getCompanyCode(userInfoBean);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());// 将用户权限放入request中
			request.setAttribute("subCompanyList", subCompanyList);
			request.setAttribute("companyList", companyList);
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			request.setAttribute("flag", flag);
			log.error("在执行CompanyManageAction类中的addCompanyInfo方法时出错："+ e.getMessage());
			request.setAttribute("errorMessage","在执行CompanyManageAction类中的addCompanyInfo方法时出错:"+ e.getMessage());
			return ERROR;
		}
		return "querysuccess";
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @return 
	 * @Description modify company info
	 */
	public String modifyCompanyInfo() {
		try {
			String companyCode = companyBean.getCompanyCode();
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			CompanyBean companyBean = null;
			if (companyCode == null) {
				return "error";
			} else {
				companyBean = companyManageService.getOneInfo(companyCode);
				if (companyBean != null) {
					this.companyBean = companyBean;
				} else {
					return "error";
				}
				List companyList = companyManageService
						.getCompanyCode(userInfoBean);
				// 将用户权限放入request中
				request.setAttribute("userDepartment", userInfoBean
						.getManagementCode());
				request.setAttribute("companyList", companyList);
			}
		} catch (Exception e) {
			log.error("在执行CompanyManageAction类中的modifyCompanyInfo方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage",
					"在执行CompanyManageAction类中的modifyCompanyInfo方法时出错:"
							+ e.getMessage());
			return ERROR;
		}

		return "modifyOneSuccess";
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @return 
	 * @Description update company info
	 */
	public String updateCompanyInfo() {
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		String userId = userInfoBean.getUserid();
		String parentComCode;
		boolean flag = false;
		try {
			String checkInfo = companyManageService.checkInfo(companyBean,
					"update");
			if (checkInfo.equalsIgnoreCase("")) {
				flag = true;
				companyBean.setUserId(userId);
				companyManageService.updateOneCompanyFunc(companyBean);
				request.setAttribute("flag", flag);
			} else {
				request.setAttribute("hintMsg", checkInfo);
			}
			parentComCode = companyBean.getParentComCode();
			String parentComName = companyManageService
					.getCompanyName(parentComCode);
			companyBean = new CompanyBean();
			companyBean.setParentComCode(parentComCode);
			companyBean.setParentComName(parentComName);

			List subCompanyList = companyManageService
					.getCompanyInfo(parentComCode,pageBean);
			List companyList = companyManageService
					.getCompanyCode(userInfoBean);
			request.setAttribute("subCompanyList", subCompanyList);
			// 将用户权限放入request中
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());
			request.setAttribute("companyList", companyList);

		} catch (Exception e) {
			request.setAttribute("flag", false);
			log.error("在执行CompanyManageAction类中的updateCompanyInfo方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage",
					"在执行CompanyManageAction类中的updateCompanyInfo方法时出错:"
							+ e.getMessage());
			return ERROR;
		}
		return "queryOneSuccess";
	}
	
	/**
	 * @author Li Fengli 2012-11-14
	 * @return 
	 * @Description delete company info
	 */
	public String deleteCompanyInfo(){

		pageBean = getPageBean();
		try {
	    String parentComCode = companyBean.getParentComCode();
		String companyCode = companyBean.getCompanyCode();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
		.getAttribute("userlogin");
		String userId = userInfoBean.getUserid();
		if (companyCode == null) {
		return "error";
		} else {
		companyBean.setUserId(userId);
		companyManageService.deleteOneCompanyFunc(companyBean);
//		companyManageService.deletePositionUser(companyBean);
//		companyManageService.deletePositionRole(companyBean);
//		companyManageService.deleteUser(companyBean);
//		companyManageService.deletePosition(companyBean);
//		companyManageService.deleteOrg(companyBean);
//		companyManageService.deleteOneCompanyFunc(companyBean);
		pageBean.setTotalCount(0);
		setPage(parentComCode);
		List companyList = companyManageService.getCompanyCode(userInfoBean);
		request.setAttribute("companyList", companyList);
		request.setAttribute("userDepartment", userInfoBean.getManagementCode());
		request.setAttribute("pageBean", pageBean);
		}
		} catch (Exception e) {
		log.error("在执行CompanyManageAction类中的deleteCompanyInfo方法时出错："
		+ e.getMessage());
		request.setAttribute("errorMessage",
				"在执行CompanyManageAction类中的deleteCompanyInfo方法时出错:"
						+ e.getMessage());
		return ERROR;
		}

		return "deletesuccess";
		}
	
	/**
	 * @author Li Fengli 2012-11-22
	 * @return 
	 * @Description set page
	 */
	public void setPage(String parentComCode){
		int count = pageBean.getTotalCount();
		if(count == 0){
			//获取总数
			count = companyManageService.getSubComCount(parentComCode);
			pageBean.setTotalCount(count);
		}
	}
}
