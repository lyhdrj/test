/**
 *
 **************************************************************
 * @Project     : MenuManageServiceImpl.java
 * @date        : Nov 12, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: MenuManage
 * @Description	: Menu Manager Business Logic Layer Interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service;

import java.util.List;
import com.nasoft.sysmanage.model.MenuBean;
import com.nasoft.sysmanage.model.PageBean;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public interface IMenuManageService {
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List 
	 * @Description Get menu information
	 */
	public List getMenuInfo();
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuID 
	 * @return String
	 * @Description Get menu name
	 */
	public String getMenuName(String menuID);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuID 
	 * @return List
	 * @Description Get menu function
	 */
	public List getMenuFunc(String menuID);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get all menu function
	 */
	public List getAllMenuFunc();
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Add menu function
	 */
	public void addMenuFunc(MenuBean menu);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description get a menu function record
	 */
	public MenuBean getOneMenuFunc(String menuId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Update a menu function
	 */
	public void updateOneMenuFunc(MenuBean menu);
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Remove a menu information
	 */
	public void deleteMenuInfo(String menuId);
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Get menu record
	 */
	public Integer getMenuCount(String menuId);
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Remove a menu role information
	 */
	public void deleteMenuRoleInfo(String menuId);

	/**
	 * @author Liu Hanpeng Nov 19, 2012
	 * @param menuID 
	 * @param pageBean
	 * @return List
	 * @Description Get menu function by page
	 */
	public List getMenuFuncPage(String parentMenuID, PageBean pageBean);
	
	/**
	 * @author Liu Hanpeng Nov 15, 2012
	 * @param menuId 
	 * @Description Get subMenu record
	 */
	public Integer getSubMenuCount(String menuId);

	/**
	 * @author Liu Hanpeng Jan 8, 2013
	 * @param menuBean
	 * @return boolean
	 * @Description check insert menu
	 */
	public boolean checkInsertMenu(MenuBean menuBean);
}
