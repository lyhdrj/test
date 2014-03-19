/**
 *
 **************************************************************
 * @Project     : MenuManageAction.java
 * @date        : Nov 12, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: MenuManage
 * @Description	: Menu management functions according to user requests
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
import com.nasoft.sysmanage.model.MenuBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.service.IMenuManageService;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public class MenuManageAction extends BaseAction {

	private IMenuManageService menuManageService;
	private PageBean pageBean;
	private MenuBean menuBean;
	private String errorMessage;
	
	/**
	 * @return the pageBean
	 */
	public PageBean getPageBean() {
		return pageBean;
	}
	/**
	 * @param pageBean the pageBean to set
	 */
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	/**
	 * @return the menuBean
	 */
	public MenuBean getMenuBean() {
		return menuBean;
	}
	/**
	 * @param menuBean the menuBean to set
	 */
	public void setMenuBean(MenuBean menuBean) {
		this.menuBean = menuBean;
	}
	/**
	 * @param menuManageService the menuManageService to set
	 */
	public void setMenuManageService(IMenuManageService menuManageService) {
		this.menuManageService = menuManageService;
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Query menu record
	 */
	public String queryMenu() {
		try {
			List menuList = menuManageService.getMenuInfo();
			request.setAttribute("menuList", menuList);
			request.setAttribute("menuAdd", "none");
		} catch (Exception e) {
			errorMessage = "在执行MenuAction类中的queryMenu方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "querysuccess";
	} 

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Query a menu record 
	 */
	public String queryOneMenu(){
		
		menuBean = new MenuBean();
		pageBean = getPageBean();
		try {
			
			String parentMenuID = request.getParameter("menuId");
			setPageBeanInfo(parentMenuID);
			
			String parentMenuName = menuManageService.getMenuName(parentMenuID);
			List subMenuList = menuManageService.getMenuFuncPage(parentMenuID,pageBean);
			List menuList = menuManageService.getAllMenuFunc();
			menuBean.setParentMenuID(parentMenuID);
			menuBean.setParentMenuName(parentMenuName);
			request.setAttribute("subMenuList", subMenuList);
			request.setAttribute("menuList", menuList);
			
		} catch (Exception e) {
			errorMessage = "在执行MenuAction类中的queryOneMenu方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description add menu information
	 */
	public String insertMenu() {
		menuBean = getMenuBean();
		pageBean = getPageBean();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		try {
			boolean insertFlag = menuManageService.checkInsertMenu(menuBean);
			if(insertFlag){
				menuBean.setUserId(userInfoBean.getUserid());
				menuManageService.addMenuFunc(menuBean);
				request.setAttribute("insertFlag", 0);
			}else{
				request.setAttribute("insertFlag", 1);
			}
			String menuID = request.getParameter("menuId");
			if (menuID == null) {
				menuID = menuBean.getParentMenuID();
			}

			int totalCount = menuManageService.getSubMenuCount(menuID);
			pageBean.setTotalCount(totalCount);
			List subMenuList = menuManageService.getMenuFuncPage(menuID,pageBean);
			List menuList = menuManageService.getAllMenuFunc();
			request.setAttribute("subMenuList", subMenuList);
			request.setAttribute("menuList", menuList);
			menuBean.setMenuName("");
			menuBean.setMenuFunc("");
		} catch (Exception e) {
			errorMessage = "在执行MenuAction类中的insertMenu方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "queryOneSuccess";
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Modify menu information
	 */
	public String modifyOneMenu() {
		String menuID = request.getParameter("menuId");
		pageBean = getPageBean();
		try {
			if (menuID == null) {
				return "error";
			} else {
				menuBean = menuManageService.getOneMenuFunc(menuID);
				String parentMenuName = menuManageService.getMenuName(menuBean.getParentMenuID());
				menuBean.setParentMenuName(parentMenuName);
				if (menuBean != null) {
				} else {
					return "error";
				}
				List menuList = menuManageService.getAllMenuFunc();
				request.setAttribute("menuList", menuList);
			}
		} catch (Exception e) {
			errorMessage = "在执行MenuAction类中的modifyOneMenu方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "modifyOneSuccess";
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Remove menu information
	 */
	public String removeMenuInfo(){
		String menuID = request.getParameter("menuId");
		Integer delFlag = 1;
		String parentMenuID = "-1";
		pageBean = getPageBean();
		try {
			if (menuID == null) {
				return "error";
			} else {
				Integer menuCount = menuManageService.getMenuCount(menuID);
				if(menuCount.intValue()>0){
					MenuBean getMenuBean = menuManageService.getOneMenuFunc(menuID);
					parentMenuID = getMenuBean.getParentMenuID();
					menuManageService.deleteMenuRoleInfo(menuID);
					menuManageService.deleteMenuInfo(menuID);
				}
				int totalCount = menuManageService.getSubMenuCount(parentMenuID);
				pageBean.setTotalCount(totalCount);
				List subMenuList = menuManageService.getMenuFuncPage(parentMenuID,pageBean);
				List menuList = menuManageService.getAllMenuFunc();
				request.setAttribute("subMenuList", subMenuList);
				request.setAttribute("menuList", menuList);
			}
			request.setAttribute("flag", delFlag);
		} catch (Exception e) {
			errorMessage = "在执行MenuAction类中的removeMenuInfo方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "queryOneSuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return String
	 * @Description Update a menu information
	 */
	public String updateOneMenu() {
		menuBean = getMenuBean();
		pageBean = getPageBean();
		UserLoginBean userInfoBean = (UserLoginBean) request.getSession()
				.getAttribute("userlogin");
		String menuID;
		try {
			menuBean.setUserId(userInfoBean.getUserid());
			menuManageService.updateOneMenuFunc(menuBean);
			menuID = menuBean.getParentMenuID();
			List subMenuList = menuManageService.getMenuFuncPage(menuID,pageBean);
			List menuList = menuManageService.getAllMenuFunc();
			request.setAttribute("subMenuList", subMenuList);
			request.setAttribute("menuList", menuList);
			menuBean.setMenuName("");
			menuBean.setMenuFunc("");
		} catch (Exception e) {
			errorMessage = "在执行MenuAction类中的updateOneMenu方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}
		return "queryOneSuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 19, 2012
	 * @param parentMenuID
	 * @Description set PageBean information
	 */
	public void setPageBeanInfo(String parentMenuID){
		
		if(pageBean.getTotalCount()==0){
			int totalCount = menuManageService.getSubMenuCount(parentMenuID);
			pageBean.setTotalCount(totalCount);
		}
	}
}
