/**
 *
 **************************************************************
 * @Project     : MenuManageDaoImpl.java
 * @date        : Nov 14, 2012 
 * @author      : Liu Hanpeng
 * @company     : Nasoft
 * @model		: MenuManage
 * @Description	: Menu data persistence
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.persistence.sqlmapdao;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.nasoft.sysmanage.model.MenuBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.persistence.iface.IMenuManageDao;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public class MenuManageDaoImpl extends SqlMapClientTemplate implements IMenuManageDao{
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List 
	 * @Description Get menu information
	 */
	public List getMenuInfo() {
		return queryForList("MenuManage.getMenuInfo");
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuID 
	 * @return String
	 * @Description Get menu name
	 */
	public String getMenuName(String menuID) {
		return (String)queryForObject("MenuManage.getMenuName",menuID);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuID 
	 * @return List
	 * @Description Get menu function
	 */
	public List getMenuFunc(String menuID) {
		return queryForList("MenuManage.getMenuFunc",menuID);
	}

	/**
	 * @author Liu Hanpeng Nov 19, 2012
	 * @param menuID 
	 * @param pageBean
	 * @return List
	 * @Description Get menu function by page
	 */
	public List getMenuFuncPage(String menuID,PageBean pageBean) {
		return queryForList("MenuManage.getMenuFunc",menuID,pageBean.getFirstResult(),pageBean.getMaxResult());
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @return List
	 * @Description Get all menu function
	 */
	public List getAllMenuFunc() {
		return queryForList("MenuManage.getAllMenuFunc");
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Add menu function
	 */
	public void addMenuFunc(MenuBean menu) {
		insert("MenuManage.addMenuFunc",menu);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Get a menu function record
	 */
	public MenuBean getOneMenuFunc(String menuId) {
		return (MenuBean)queryForObject("MenuManage.getOneMenuFunc",menuId);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menu 
	 * @Description Update a menu function
	 */
	public void updateOneMenuFunc(MenuBean menu) {
		update("MenuManage.updateOneMenuFunc",menu);
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @Description remove menu information
	 */
	public void removeMenuInfo(String menuId) {
		 delete("MenuManage.deleteMenu",menuId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @reutrn Integer
	 * @Description Get menu record
	 */
	public Integer getMenuCount(String menuId) {
		return (Integer)queryForObject("MenuManage.getMenuCount",menuId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @Description Remove menu role information
	 */
	public void removeMenuRoleInfo(String menuId) {
		delete("MenuManage.deleteMenuRole",menuId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param menuId 
	 * @reutrn Integer
	 * @Description Get subMenu record
	 */
	public Integer getSubMenuCount(String menuId) {
		return (Integer)queryForObject("MenuManage.getSubMenuCount",menuId);
	}

	/**
	 * @author Liu Hanpeng Jan 8, 2013
	 * @param menuBean
	 * @return Integer
	 * @Description check insert menu
	 */
	public Integer checkInsertMenu(MenuBean menuBean) {
		return (Integer)queryForObject("MenuManage.checkInsert",menuBean);
	}
	
}
