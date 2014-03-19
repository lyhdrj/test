/**
 *
 **************************************************************
 * @Project     : MenuManageServiceImpl.java
 * @date        : Nov 14, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: MenuManage
 * @Description	: Menu Manager Business Logic Layer
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
import com.nasoft.sysmanage.model.MenuBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.persistence.iface.IMenuManageDao;
import com.nasoft.sysmanage.service.IMenuManageService;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public class MenuManageServiceImpl implements IMenuManageService{
	
	private IMenuManageDao menuManageDao;

	/**
	 * @param menuManageDao the menuManageDao to set
	 */
	public void setMenuManageDao(IMenuManageDao menuManageDao) {
		this.menuManageDao = menuManageDao;
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List 
	 * @Description Get menu information
	 */
	public List getMenuInfo() {
		return menuManageDao.getMenuInfo();
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuID 
	 * @return String
	 * @Description Get menu name
	 */
	public String getMenuName(String menuID) {
		return menuManageDao.getMenuName(menuID);
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuID 
	 * @return List
	 * @Description Get menu function
	 */
	public List getMenuFunc(String menuID) {
		return menuManageDao.getMenuFunc(menuID);
	}
	
	/**
	 * @author Liu Hanpeng Nov 19, 2012
	 * @param menuID 
	 * @param pageBean
	 * @return List
	 * @Description Get menu function by page
	 */
	public List getMenuFuncPage(String menuID,PageBean pageBean) {
		return menuManageDao.getMenuFuncPage(menuID,pageBean);
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get all menu function
	 */
	public List getAllMenuFunc() {
		return menuManageDao.getAllMenuFunc();
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Add menu function
	 */
	public void addMenuFunc(MenuBean menu) {
		menuManageDao.addMenuFunc(menu);
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Get a menu function record
	 */
	public MenuBean getOneMenuFunc(String menuId) {
		return menuManageDao.getOneMenuFunc(menuId);
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Update a menu function
	 */
	public void updateOneMenuFunc(MenuBean menu) {
		menuManageDao.updateOneMenuFunc(menu);
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @Description Remove a menu information
	 */
	public void deleteMenuInfo(String menuId) {
		menuManageDao.removeMenuInfo(menuId);
	}
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Get menu record
	 */
	public Integer getMenuCount(String menuId) {
		return menuManageDao.getMenuCount(menuId);
	}
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Remove a menu role information
	 */
	public void deleteMenuRoleInfo(String menuId) {
		menuManageDao.removeMenuRoleInfo(menuId);
	}
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Get subMenu record
	 */
	public Integer getSubMenuCount(String menuId) {
		return menuManageDao.getSubMenuCount(menuId);
	}
	/**
	 * @author Liu Hanpeng Jan 8, 2013
	 * @param menuBean
	 * @return boolean
	 * @Description check insert menu
	 */
	public boolean checkInsertMenu(MenuBean menuBean) {
		
		int count =0;
		count  = menuManageDao.checkInsertMenu(menuBean);
		if(count >0){
			return false;
		}
		return true;
	}
	
}
