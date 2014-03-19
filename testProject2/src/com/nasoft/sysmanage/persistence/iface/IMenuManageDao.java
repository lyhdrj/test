/**
 *
 **************************************************************
 * @Project     : IMenuManageDao.java
 * @date        : Nov 14, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: MenuManage
 * @Description	: Menu data persistence interface
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.iface;

import java.util.List;
import com.nasoft.sysmanage.model.MenuBean;
import com.nasoft.sysmanage.model.PageBean;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public interface IMenuManageDao {
	
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
	 * @param menuId 
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
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @Description Remove menu information
	 */
	public void removeMenuInfo(String menuId);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @reutrn Integer
	 * @Description Get menu record
	 */
	public Integer getMenuCount(String menuId);

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @Description Remove menu role information
	 */
	public void removeMenuRoleInfo(String menuId);

	/**
	 * @author Liu Hanpeng Nov 19, 2012
	 * @param menuID 
	 * @param pageBean
	 * @return List
	 * @Description Get menu function by page
	 */
	public List getMenuFuncPage(String menuID, PageBean pageBean);
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @reutrn Integer
	 * @Description Get sub menu record
	 */
	public Integer getSubMenuCount(String menuId);
	/**
	 * @author Liu Hanpeng Jan 8, 2013
	 * @param menuBean
	 * @return Integer
	 * @Description check insert menu
	 */
	public Integer checkInsertMenu(MenuBean menuBean);
}
