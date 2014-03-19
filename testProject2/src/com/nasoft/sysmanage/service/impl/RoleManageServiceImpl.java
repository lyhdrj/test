/**
 *
 **************************************************************
 * @Project     : RoleManageServiceImpl.java
 * @date        : Nov 12, 2012 
 * @author      : Liu Hanpeng 
 * @company     : Nasoft
 * @model		: RoleManage
 * @Description	: Role Manager Business Logic Layer
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.nasoft.base.SysConstants;
import com.nasoft.sysmanage.model.MenuBean;
import com.nasoft.sysmanage.model.PositionBean;
import com.nasoft.sysmanage.model.RoleBean;
import com.nasoft.sysmanage.model.RoleMenuBean;
import com.nasoft.sysmanage.persistence.iface.IRoleManageDao;
import com.nasoft.sysmanage.service.IRoleManageService;

/**
 * @author Liu Hanpeng
 */
@SuppressWarnings("unchecked")
public class RoleManageServiceImpl implements IRoleManageService{
	
	private IRoleManageDao roleManageDao;

	/**
	 * @param roleManageDao the roleManageDao to set
	 */
	public void setRoleManageDao(IRoleManageDao roleManageDao) {
		this.roleManageDao = roleManageDao;
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param companyCode
	 * @return List
	 * @Description Get role information
	 */
	public List getRoleInfo(String companyCode) {
		return roleManageDao.getRoleInfo(companyCode);
	}
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param companyCode
	 * @return String
	 * @Description Check role information
	 */
	public String checkRoleInfo(RoleBean roleBean, String type,String com) {		
		String roleInfo="";
		Integer count = null;
		HashMap<String,Object> map = new HashMap<String,Object>();		
		map.clear();
		if(type.equalsIgnoreCase("update")){
			count = roleManageDao.getUpdateRoleCount(roleBean);
		}else{
			map.put("roleName", roleBean.getRoleName());
			map.put("companyCode", com);
			count = roleManageDao.getInsertRoleCount(map);
		}
		if(count.intValue()>0){
			roleInfo=roleInfo+"角色名称:"+roleBean.getRoleName()+"已存在，请重新输入";
		}
		return roleInfo;
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @Description Add role information
	 */
	public void addRoleInfo(RoleBean roleBean) {
		roleManageDao.insertRoleInfo(roleBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleID
	 * @return boolean
	 * @Description Delete role information
	 */
	public boolean deleteRole(String roleID) {
		boolean flag=false;
		//查询菜单角色表是否有role_ID
		Integer roleCount = roleManageDao.getRoleCount(roleID);
		Integer positCount = roleManageDao.getPositionCount(roleID);
		if(roleCount.intValue()==0&&positCount.intValue()==0){
			roleManageDao.deleteRoleInfo(roleID);
			flag=true;
		}
		return flag;
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleId
	 * @return RoleBean
	 * @Description Get a role information
	 */
	public RoleBean getOneRoleInfo(String roleId) {
		return roleManageDao.getOneRoleInfo(roleId);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleBean
	 * @Description Modify a role information
	 */
	public void updateOneRoleInfo(RoleBean roleBean) {
		roleManageDao.modifyOneRoleInfo(roleBean);
	}

	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleID
	 * @param rights
	 * @return List
	 * @Description get a role permission
	 */
	public List getRolePrivilege(String roleID, String rights) {
		List menuRsList = null;
		if(rights.equalsIgnoreCase("true")){
			menuRsList = roleManageDao.getRolePrivile();
		}else{
			menuRsList = roleManageDao.getRolePrivileT();
		}
		List roleMenuRsList = roleManageDao.getMenuRole(roleID);
		List menuList = new ArrayList();
		String roleId = null;
		MenuBean menuBean;
		String isPrivil="false";//false代表没有选择菜单，true代表选上菜单
		for (int i = 0; i < menuRsList.size(); i++) {
			isPrivil="false";
			menuBean= (MenuBean)menuRsList.get(i);
			for (int j = 0; j < roleMenuRsList.size(); j++) {
				roleId = (String)roleMenuRsList.get(j);
				if(roleId.equalsIgnoreCase(menuBean.getMenuID())){
					isPrivil="true";
				}
			}
			menuBean.setMenuType(isPrivil);
			menuList.add(menuBean);
		}
		return menuList;
	}
	
	/**
	 * @author Liu Hanpeng Nov 14, 2012
	 * @param roleMenuList
	 * @param roleID
	 * @param rights
	 * @param companyCode
	 * @return boolean
	 * @Description Update role permission
	 */
	public boolean updateRolePrivilege(List roleMenuList, String roleID,
			String rights, String companyCode) throws Exception {
		boolean flag=false;
		//删除现表数据
		if("true".equalsIgnoreCase(rights)){
			roleManageDao.deleteMenuRole(roleID);
		}else{
			roleManageDao.deleteMenuRoleT(roleID);
		}
		if(!roleMenuList.isEmpty()){
			roleManageDao.insertMenuRole(roleMenuList);
		}
		return flag;
	}
	
}
