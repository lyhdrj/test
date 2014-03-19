/**
 *
 **************************************************************
 * @Project     : testProject
 * @date        : 2012-11-14 15:06:26
 * @author      : Cao Yang 
 * @company     : Nasoft
 * @model		: 
 * @Description	: OrgManageAction
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
import com.nasoft.sysmanage.model.OrgBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.service.IOrgManageService;
import com.nasoft.sysmanage.model.UserLoginBean;

/**
 * @author Cao Yang
 */
@SuppressWarnings("unchecked")
public class OrgManageAction extends BaseAction {

	private static final long serialVersionUID = 6203653609889037132L;

	private IOrgManageService orgManageService;

	private OrgBean orgBean;

	private PageBean pageBean;

	/**
	 * @return the pageBean
	 */
	public PageBean getPageBean() {
		return pageBean;
	}

	/**
	 * @param pageBean
	 *            the pageBean to set
	 */
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	/**
	 * @return the orgManageService
	 */
	public IOrgManageService getOrgManageService() {
		return orgManageService;
	}

	/**
	 * @param orgManageService
	 *            the orgManageService to set
	 */
	public void setOrgManageService(IOrgManageService orgManageService) {
		this.orgManageService = orgManageService;
	}

	/**
	 * @return the orgBean
	 */
	public OrgBean getOrgBean() {
		return orgBean;
	}

	/**
	 * @param orgBean
	 *            the orgBean to set
	 */
	public void setOrgBean(OrgBean orgBean) {
		this.orgBean = orgBean;
	}

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @return String
	 * @Description TODO queryAllOrg
	 */
	public String queryOrg() {
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			List orgList = orgManageService.getOrgCode(userInfoBean);
			request.setAttribute("orgList", orgList);
			request.setAttribute("funShow", "none");
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = "在执行OrgManageAction类中的queryOrg方法时出错："
					+ e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage", errorMessage);
			return ERROR;
		}
		return "querysuccess";
	}

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @return String
	 * @Description TODO query org info
	 */
	public String queryOneInfo() {
		try {

			List subOrgList = null;
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			String parentOrgCode = orgBean.getOrgCode();

			setPage(parentOrgCode);

			OrgBean orgName = orgManageService.getOrgName(parentOrgCode);
			subOrgList = orgManageService
					.getOrgSubInfo(parentOrgCode, pageBean);
			List orgList = orgManageService.getOrgCode(userInfoBean);
			orgBean.setParentOrgCode(parentOrgCode);
			orgBean.setParentOrgName(orgName.getOrgName());
			orgBean.setComCode(orgName.getComCode());
			request.setAttribute("parentOrgName", orgName.getOrgName());
			request.setAttribute("subOrgList", subOrgList);
			request.setAttribute("orgList", orgList);
			orgBean.setOrgCode("");
			orgBean.setOrgName("");
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = "在执行OrgManageAction类中的queryOneInfo方法时出错："
					+ e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage", errorMessage);
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @return String
	 * @Description TODO insert org
	 */
	public String insertOrg() {
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			String userId = userInfoBean.getUserid();
			String parentOrgCode = orgBean.getParentOrgCode();
			boolean flag = false;
			String checkInfo = orgManageService.checkInfo(orgBean, "insert");
			if (checkInfo.equalsIgnoreCase("")) {
				orgBean.setUserId(userId);
				orgManageService.addOrgInfo(orgBean);
				flag = true;
				request.setAttribute("flag", flag);
			} else {
				request.setAttribute("hintMsg", checkInfo);
			}

			pageBean.setTotalCount(0);
			setPage(parentOrgCode);

			orgBean.setOrgCode("");
			orgBean.setOrgName("");
			orgBean.setRemark("");
			OrgBean orgName = orgManageService.getOrgName(parentOrgCode);
			List subOrgList = orgManageService.getOrgSubInfo(parentOrgCode,
					pageBean);
			List orgList = orgManageService.getOrgCode(userInfoBean);
			request.setAttribute("parentOrgName", orgName.getOrgName());
			request.setAttribute("subOrgList", subOrgList);
			request.setAttribute("orgList", orgList);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());

		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = "在执行OrgManageAction类中的insertOrg方法时出错："
					+ e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage", errorMessage);
			return ERROR;
		}
		return "addsuccess";
	}

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @return String
	 * @Description TODO modify org info
	 */
	public String modifyOneInfo() {
		try {
			String orgCode = orgBean.getOrgCode();
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			if (orgCode == null) {
				return "error";
			} else {
				List oneOrgList = orgManageService.getOneInfo(orgCode);
				OrgBean orgBean;
				if (oneOrgList.size() > 0) {
					orgBean = (OrgBean) oneOrgList.get(0);
					this.orgBean = orgBean;
				} else {
					return "error";
				}
				List orgList = orgManageService.getOrgCode(userInfoBean);
				request.setAttribute("orgList", orgList);
				request.setAttribute("userDepartment", userInfoBean
						.getManagementCode());
			}
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = "在执行OrgManageAction类中的modifyOneInfo方法时出错："
					+ e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage", errorMessage);
			return ERROR;
		}
		return "modifyOneSuccess";
	}

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @return String
	 * @Description TODO update org info
	 */
	public String updateOneInfo() {
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			String userID = userInfoBean.getUserid();
			String parentOrgCode;
			boolean flag = false;
			String checkInfo = orgManageService.checkInfo(orgBean, "update");
			if (checkInfo.equalsIgnoreCase("")) {
				orgBean.setUserId(userID);
				orgManageService.updateOneInfo(orgBean);
				flag = true;
				request.setAttribute("flag", flag);
			} else {
				request.setAttribute("hintMsg", checkInfo);
			}
			parentOrgCode = orgBean.getParentOrgCode();

			pageBean.setTotalCount(0);
			setPage(parentOrgCode);

			OrgBean orgBean2 = new OrgBean();
			OrgBean orgName = orgManageService.getOrgName(parentOrgCode);
			orgBean2.setParentOrgCode(parentOrgCode);
			orgBean2.setParentOrgName(orgName.getOrgName());
			orgBean2.setComCode(orgName.getComCode());
			this.orgBean = orgBean2;
			List subOrgList = orgManageService.getOrgSubInfo(parentOrgCode,
					pageBean);
			List orgList = orgManageService.getOrgCode(userInfoBean);
			request.setAttribute("parentOrgName", orgName.getOrgName());
			request.setAttribute("subOrgList", subOrgList);
			request.setAttribute("orgList", orgList);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = "在执行OrgManageAction类中的updateOneInfo方法时出错："
					+ e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage", errorMessage);
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * 
	 * @author Cao Yang 2012-11-15
	 * @return String
	 * @Description TODO delete org info
	 */

	public String deleteOneInfo() {
		String orgCode = orgBean.getOrgCode();
		try {
			if (orgCode == null) {
				return "error";
			} else {
				orgManageService.deleteOneInfo(orgCode);
				pageBean.setTotalCount(0);
				pageBean.setCurrentPage(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			String errorMessage = "在执行OrgManageAction类中的deleteOneInfo方法时出错："
					+ e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage", errorMessage);
			return ERROR;
		}

		return "deleteSuccess";
	}

	public void setPage(String orgCode) {
		int count = pageBean.getTotalCount();
		if (count == 0) {
			// 获取总数
			count = orgManageService.getSubOrgCount(orgCode);
			pageBean.setTotalCount(count);
		}
	}
}
