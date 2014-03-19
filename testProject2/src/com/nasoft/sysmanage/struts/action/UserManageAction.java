/**
 *
 **************************************************************
 * @Project     : UserManageAction.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Management
 * @Description	: User Management Action
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.struts.action;

import java.io.PrintWriter;
import java.util.List;

import com.nasoft.base.BaseAction;
import com.nasoft.base.SysConstants;
import com.nasoft.sysmanage.model.PositionBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.UserBean;
import com.nasoft.sysmanage.service.IPositionManageService;
import com.nasoft.sysmanage.service.IUserManageService;
import com.nasoft.util.MD5;

/**
 * @author Chi Kehan
 */
@SuppressWarnings("unchecked")
public class UserManageAction extends BaseAction {

	private IUserManageService userManageService;
	private UserBean userBean;
	private IPositionManageService positionManageService;

	/**
	 * @return the userManageService
	 */
	public IUserManageService getUserManageService() {
		return userManageService;
	}

	/**
	 * @param userManageService the userManageService to set
	 */
	public void setUserManageService(IUserManageService userManageService) {
		this.userManageService = userManageService;
	}

	/**
	 * @return the userBean
	 */
	public UserBean getUserBean() {
		return userBean;
	}

	/**
	 * @param userBean the userBean to set
	 */
	public void setUserBean(UserBean userBean) {
		this.userBean = userBean;
	}

	/**
	 * @return the positionManageService
	 */
	public IPositionManageService getPositionManageService() {
		return positionManageService;
	}

	/**
	 * @param positionManageService the positionManageService to set
	 */
	public void setPositionManageService(
			IPositionManageService positionManageService) {
		this.positionManageService = positionManageService;
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Query all users!
	 */
	public String queryUser() {
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			List userList = userManageService.getUserPosition(userInfoBean);
			String userDepartment = userManageService
					.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
			request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
			request.setAttribute("userList", userList);
			request.setAttribute("funShow", "none");
			request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
			request.setAttribute("user", SysConstants.PRIVILEGE_USER);
		} catch (Exception e) {
			e.printStackTrace();
			log.error("在执行UserManageAction类中的queryUser方法时出错：" + e.getMessage());
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的queryUser方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "querysuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Query one user by positionID.
	 */
	public String getAllUserInfo() {
		UserBean userBean = new UserBean();
		List subUserList = null;
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		String positionID = getUserBean().getPositionID();
		String pIdTmp = positionID.substring(1, positionID.length());
		
		setPage(pIdTmp);
		
		
		PositionBean positionName = userManageService.getPositionName(pIdTmp);
		
		subUserList = userManageService.getAllUserInfo(pIdTmp, "false",pageBean);
		String userDepartment = userManageService
				.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
		List userList = userManageService.getUserPosition(userInfoBean);


		userBean.setPositionID(pIdTmp);
		userBean.setPositionName(positionName.getPositionName());
		userBean.setComCode(positionName.getComCode());
		this.userBean = userBean;

		request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
		request.setAttribute("positionName", positionName.getPositionName());
		request.setAttribute("subUserList", subUserList);
		request.setAttribute("userList", userList);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
		request.setAttribute("user", SysConstants.PRIVILEGE_USER);
		return "queryOneSuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Get organization infomations and show as a tree.
	 */
	public String getOrgTree() {
		try {
			String comCode = getUserBean().getComCode();
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			String operatorDepartment = userManageService
					.getUserDepartment(userInfoBean.getManagementCode());
			List userList = userManageService.getOrgTree(comCode);
			request.setAttribute("userList", userList);
			request.setAttribute("userDepartment", operatorDepartment);
			request.setAttribute("operatorDepartment", operatorDepartment);
			request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的getOrgTree方法时出错："
							+ e.getMessage());
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的getOrgTree方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "getOrgTreeSuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Insert one user.
	 */
	public String addUserInfo() {
		String positionID = userBean.getPositionID();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		List subUserList = null;
		String flagDB = "false";
		try {
			userManageService.addUserInfo(userBean, userInfoBean, flagDB);
			PositionBean positionName = userManageService
					.getPositionName(positionID);

			pageBean.setTotalCount(0);
			pageBean.setCurrentPage(pageBean.getCurrentPage());
			setPage(positionID);
			
			
			//获取数据总数，用于分页
			subUserList = userManageService.getAllUserInfo(positionID, flagDB,pageBean);

			//设置userbean用于前台显示
			userBean = new UserBean();
			userBean.setPositionID(positionID);
			userBean.setPositionName(positionName.getPositionName());
			userBean.setComCode(positionName.getComCode());

			List userList = userManageService.getUserPosition(userInfoBean);
			String userDepartment = userManageService
					.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
			request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
			request.setAttribute("positionName", positionName.getPositionName());
			request.setAttribute("subUserList", subUserList);
			request.setAttribute("userList", userList);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
			request.setAttribute("user", SysConstants.PRIVILEGE_USER);

		} catch (Exception e) {
			request.setAttribute("modifyMsg", "false");
			log.error("在执行UserManageAction类中的insertUser方法时出错："
							+ e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的insertUser方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "querysuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Query one user and show it on modify page.
	 */
	public String modifyOneInfo() {
		try {
			String userID = getUserBean().getUserID();

			String flagDB = "false";
			List oneUserList = null;
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			if (userID == null) {
				return "error";
			} else {
				oneUserList = userManageService.getUserInfo(userID, flagDB);

				UserBean userBean;
				if (oneUserList.size() > 0) {
					userBean = (UserBean) oneUserList.get(0);
					this.userBean = userBean;
				} else {
					return "error";
				}
				String userDepartment = userManageService
						.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
				List userList = userManageService.getUserPosition(userInfoBean);
				request.setAttribute("permissionDepartment", userManageService
						.getDepartmentByCode(userBean.getManagementCode()));
				request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
				request.setAttribute("userList", userList);
				request.setAttribute("managementCode", getUserBean().getManagementCode());
				request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
				request.setAttribute("user", SysConstants.PRIVILEGE_USER);
			}
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的modifyOneInfo方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的modifyOneInfo方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "modifyOneSuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Check login username.
	 */
	public String checkLoginName() {
		String loginName = request.getParameter("loginName");
		try {
			String checkFlag = userManageService.checkLoginName(loginName);
			PrintWriter out = response.getWriter();
			out.print(checkFlag);
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的checkLoginName方法时出错："
					+ e.getMessage());
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的checkLoginName方法时出错:"+e.getMessage());
			return ERROR;
		}
		return null;
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Modify one user and update into database.
	 */
	public String updateUserInfo() {
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		String userID = userInfoBean.getUserid();

		List subUserList = null;
		String positionID;
		try {
			userManageService.updateUserInfo(userBean, userID, "false");
			request.setAttribute("modifyPosition", "true");
			positionID = userBean.getPositionID();
			PositionBean positionName = userManageService.getPositionName(positionID);
			List userList = userManageService.getUserPosition(userInfoBean);
			//设置userbean用于前台显示
			userBean = new UserBean();
			userBean.setPositionID(positionID);
			userBean.setPositionName(positionName.getPositionName());
			userBean.setComCode(positionName.getComCode());

			setPage(positionID);
			subUserList = userManageService.getAllUserInfo(positionID, "false",pageBean);

			String userDepartment = userManageService
					.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
			request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
			request.setAttribute("positionName", positionName.getPositionName());
			request.setAttribute("subUserList", subUserList);
			request.setAttribute("userList", userList);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
			request.setAttribute("user", SysConstants.PRIVILEGE_USER);
		} catch (Exception e) {
			request.setAttribute("modifyPosition", "false");
			log.error("在执行UserManageAction类中的updateOneInfo方法时出错："
					+ e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的updateOneInfo方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description reset user password.
	 */
	public String resetUserPwd() {
		PrintWriter out = null;
		UserBean userBean = null;
		try {
			out = response.getWriter();
			String userID = getUserBean().getUserID();
			if (userID == null) {
				return "error";
			} else {
				userBean = new UserBean();
				userBean.setUserID(userID);
				userBean.setPassword(MD5.getMD5(SysConstants.INITPWD));
				userManageService.resetPassword(userBean);
				out.print("true$" + "resetUserPwd");
			}
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的resetUserPwd方法时出错："
					+ e.getMessage());
			out.print("false$" + "resetUserPwd");
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的resetUserPwd方法时出错:"+e.getMessage());
			return ERROR;
		}
		return null;
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Get user's position and show it on position modify page.
	 */
	public String modifyUserPosition() {
		String userID = getUserBean().getUserID();

		List oneUserList = null;
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		if (userID == null) {
			return "error";
		} else {
			try {
				oneUserList = userManageService.getUserInfo(userID, "false");

				UserBean userBean;

				if (oneUserList.size() > 0) {
					userBean = (UserBean) oneUserList.get(0);
					setUserBean(userBean);

				} else {
					return "error";
				}

				String userDepartment = userManageService
						.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
				List userList = userManageService.getUserPosition(userInfoBean);
				request.setAttribute("permissionDepartment", userManageService
						.getDepartmentByCode(userBean.getManagementCode()));
				request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
				request.setAttribute("userList", userList);
				request.setAttribute("managementCode", getUserBean()
						.getManagementCode());
				request.setAttribute("admin", SysConstants.PRIVILEGE_ADMIN);
				request.setAttribute("user", SysConstants.PRIVILEGE_USER);
			} catch (Exception e) {
				log.error("在执行UserManageAction类中的modifyUserPosition方法时出错："
						+ e.getMessage());
				e.printStackTrace();
				request.setAttribute("errorMessage",
						"在执行UserManageAction类中的modifyUserPosition方法时出错:"+e.getMessage());
				return ERROR;
			}
			return "modifyUserPosition";
		}
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Query all positions.
	 */
	public String queryPosition() {
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			List positionList = positionManageService.getPositionCode(userInfoBean);
			request.setAttribute("userDepartment", userInfoBean
					.getManagementCode());// 将用户权限放入request中
			request.setAttribute("positionList", positionList);
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的queryPosition方法时出错："
					+ e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的queryPosition方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "queryUserPositionSuccess";
	}

	/**
	 * @author Chi Kehan 2012-11-13
	 * @return String
	 * @Description Update user's position into database.
	 */
	public String updateUserPosition() {
		String pid = userBean.getPositionID();
		try {
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
					.getAttribute("userlogin");
			boolean isSuccess = userManageService.updateUserPosition(userBean,
					userInfoBean);
			pageBean.setTotalCount(0);
			userBean.setPositionID(pid);
			request.setAttribute("modifyPosition", isSuccess);
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的updateUserPosition方法时出错："
					+ e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的updateUserPosition方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "updateSuccess";
	}
	
	/**
	 * @author Chi Kehan 2012-11-14
	 * @return String
	 * @Description delete user information
	 */
	public String deleteUserInfo() {
		String userID = userBean.getUserID();
		try {
			boolean flag = userManageService.deleteUserInfo(userID);
			UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");

			pageBean.setTotalCount(0);
			setPage(userBean.getPositionID());
			
			List subUserList = userManageService.getAllUserInfo(userBean.getPositionID(), "false",pageBean);
			List userList = userManageService.getUserPosition(userInfoBean);
			String userDepartment = userManageService
				.getUserDepartment(userInfoBean.getManagementCode());// 获得用户可操作部门
			PositionBean positionName = userManageService.getPositionName(userBean.getPositionID());
			request.setAttribute("deleteUser", flag);
			request.setAttribute("userDepartment", userDepartment);// 将用户可操作部门放入request中
			request.setAttribute("userList", userList);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("positionName", positionName.getPositionName());
			request.setAttribute("subUserList", subUserList);
		} catch (Exception e) {
			log.error("在执行UserManageAction类中的deleteUserInfo方法时出错："
					+ e.getMessage());
			e.printStackTrace();
			request.setAttribute("errorMessage",
					"在执行UserManageAction类中的deleteUserInfo方法时出错:"+e.getMessage());
			return ERROR;
		}
		return "deleteUserOver";
	}
	
	/**
	 * @author Chi Kehan 2012-11-19
	 * @param positionID 
	 * @Description TODO
	 */
	public void setPage(String positionID){
		int count = pageBean.getTotalCount();
		if(count == 0){
			//获取总数
			count = userManageService.getAllUserCount(positionID);
			pageBean.setTotalCount(count);
		}
	}
}
