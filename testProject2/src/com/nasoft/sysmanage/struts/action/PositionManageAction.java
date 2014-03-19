/**
 *
 **************************************************************
 * @Project     : PositionManageAction.java
 * @date        : Nov 12, 2012 
 * @author      : Wu Di
 * @company     : Nasoft
 * @model		: PositionManage
 * @Description	: Position Manager Action
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
import com.nasoft.sysmanage.service.IPositionManageService;
import com.nasoft.sysmanage.model.*;

/**
 * @author Wu Di
 */
@SuppressWarnings("unchecked")
public class PositionManageAction extends BaseAction {

	private IPositionManageService service;
	private PositionBean positionBean;

	/**
	 * @return the positionBean
	 */
	public PositionBean getPositionBean() {
		return positionBean;
	}

	/**
	 * @param positionBean
	 *            the positionBean to set
	 */
	public void setPositionBean(PositionBean positionBean) {
		this.positionBean = positionBean;
	}

	/**
	 * @return the service
	 */
	public IPositionManageService getService() {
		return service;
	}

	/**
	 * @param service
	 *            the service to set
	 */
	public void setService(IPositionManageService service) {
		this.service = service;
	}

	public PositionManageAction(IPositionManageService service) {
		this.service = service;
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return ActionForward
	 * @Description query all Position informations
	 */
	public String queryPosition() {
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			List positionList = service.getPositionCode(userInfoBean);
			List roleList = service.getRoleInfo(userInfoBean);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());// 将用户权限放入request中
			request.setAttribute("positionList", positionList);
			request.setAttribute("roleList", roleList);
			request.setAttribute("funShow", "none");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", " 查询错误:" + e.getMessage());
			return ERROR;
		}

		return "querysuccess";
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return ActionForward
	 * @Description Insert position.
	 */
	public String insertPosition() {
		positionBean = getPositionBean();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		String orgCode = positionBean.getOrgCode();
		boolean flag = false;
		try {
			String checkInfo = service.checkInfo(positionBean, "insert");
			if (checkInfo.equalsIgnoreCase("")) {
				service.addPositionInfo(positionBean, userInfoBean);
				flag = true;
				request.setAttribute("flag", flag);
			} else {
				request.setAttribute("hintMsg", checkInfo);
			}
			String[] orgName = service.getOrgName(orgCode);
			getPositionBean().setOrgCode(orgCode);
			getPositionBean().setOrgName(orgName[0]);
			getPositionBean().setComCode(orgName[1]);
			getPositionBean().setOrgID(orgName[2]);
			pageBean.setTotalCount(0);
			setPage(orgCode);

			positionBean.setPositionName("");
			positionBean.setMemo("");

			List subPositionList = service.getPositionInfo(orgCode, "false",
					pageBean);
			List roleList = service.getRoleInfo(userInfoBean);
			List positionList = service.getPositionCode(userInfoBean);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());// 将用户权限放入request中
			request.setAttribute("orgName", orgName[0]);
			request.setAttribute("subPositionList", subPositionList);
			request.setAttribute("positionList", positionList);
			request.setAttribute("roleList", roleList);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "添加职位错误:" + e.getMessage());
			return ERROR;
		}
		return "querysuccess";
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return ActionForward
	 * @Description query psoition's information
	 */
	public String queryOneInfo() {
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		try {
			String orgCode = positionBean.getOrgCode();

			setPage(orgCode);

			String[] orgName = service.getOrgName(orgCode);
			List subPositionList = service.getPositionInfo(orgCode, "false",
					pageBean);
			List positionList = service.getPositionCode(userInfoBean);
			List roleList = service.getRoleInfo(userInfoBean);
			positionBean.setOrgCode(orgCode);
			positionBean.setOrgName(orgName[0]);
			positionBean.setComCode(orgName[1]);
			positionBean.setOrgID(orgName[2]);
			setPositionBean(positionBean);
			request.setAttribute("orgName", orgName[0]);
			request.setAttribute("subPositionList", subPositionList);
			request.setAttribute("positionList", positionList);
			request.setAttribute("roleList", roleList);
			positionBean.setPositionName("");
			positionBean.setMemo("");
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());// 将用户权限放入request中
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "error:" + e.getMessage());
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return ActionForward
	 * @Description modify One position by positionID
	 */
	public String modifyOneInfo() {
		String positionID = getPositionBean().getPositionID();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		if (positionID == null) {
			return "error";
		} else {
			try {
				PositionBean positionBean = service.getOneInfo(positionID);
				if (positionBean != null) {
					positionBean.setPositionID(positionID);
					setPositionBean(positionBean);
				} else {
					return "error";
				}

				List positionList = service.getPositionCode(userInfoBean);
				List roleList = service.getRoleInfo(userInfoBean);
				request.setAttribute("roleList", roleList);
				request.setAttribute("positionList", positionList);
				request.setAttribute("userDepartment", userInfoBean
						.getManagementCode());// 将用户权限放入request中

			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("errorMessage", "修改错误:" + e.getMessage());
				return ERROR;

			}
			return "modifyOneSuccess";
		}
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return ActionForward
	 * @Description update position's information
	 */
	public String updateOneInfo() {
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		String userID = userInfoBean.getUserid();
		String parentPositionCode;
		boolean flag = false;
		try {
			String checkInfo = service.checkInfo(positionBean, "update");
			if (checkInfo.equalsIgnoreCase("")) {
				service.updateOnePosition(positionBean, userID);
				flag = true;
				request.setAttribute("flag", flag);
			} else {
				request.setAttribute("hintMsg", checkInfo);
			}
			parentPositionCode = positionBean.getOrgCode();
			String[] orgName = service.getOrgName(parentPositionCode);
			getPositionBean().setOrgCode(parentPositionCode);
			getPositionBean().setOrgName(orgName[0]);
			getPositionBean().setComCode(orgName[1]);
			getPositionBean().setOrgID(orgName[2]);

			List subPositionList = service.getPositionInfo(parentPositionCode,
					"false", pageBean);
			List positionList = service.getPositionCode(userInfoBean);
			List roleList = service.getRoleInfo(userInfoBean);

			positionBean.setPositionName("");
			positionBean.setMemo("");

			request.setAttribute("roleList", roleList);
			request.setAttribute("subPositionList", subPositionList);
			request.setAttribute("positionList", positionList);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());// 将用户权限放入request中
			request.setAttribute("orgName", positionBean.getOrgName());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "更新错误:" + e.getMessage());
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * @author Wu Di 2012-11-15
	 * @return
	 * @Description delete Position
	 */
	public String deletePosition() {
		String positionID = getPositionBean().getPositionID();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		if (positionID == null) {
			return "error";
		} else {
			try {			
				service.deletePositionInfo(positionID);			
				pageBean.setTotalCount(0);
				setPage(positionBean.getOrgCode());
				List positionList = service.getRoleInfo(userInfoBean);
				request.setAttribute("pageBean", pageBean);
				request.setAttribute("roleList", positionList);
				request.setAttribute("userDepartment", userInfoBean
						.getManagementCode());
			} catch (Exception e) {
				log.error("在执行PositionManageAction类中的deletePosition方法时出错："
						+ e.getMessage());
				return "error";
			}
			return "deleteSuccess";
		}
	}

	/**
	 * @author Wu Di 2012-11-22
	 * @param orgCode
	 * @Description get count
	 */
	public void setPage(String orgCode) {
		int count = pageBean.getTotalCount();
		if (count == 0) {
			// 获取总数
			count = service.getPositionCount(orgCode);
			pageBean.setTotalCount(count);
		}
	}
}
