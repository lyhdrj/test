/**
 *
 **************************************************************
 * @Project     : UserManageServiceImpl.java
 * @date        : 2012-11-13
 * @author      : Chi Kehan 
 * @company     : Nasoft
 * @model		: User Management
 * @Description	: User Management Service Implements
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
import java.util.List;

import com.nasoft.base.SysConstants;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.PositionBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.UserTreeBean;
import com.nasoft.sysmanage.model.UserBean;
import com.nasoft.sysmanage.persistence.iface.IUserManageDao;
import com.nasoft.sysmanage.service.IUserManageService;
import com.nasoft.util.MD5;

@SuppressWarnings("unchecked")
public class UserManageServiceImpl implements IUserManageService{
	
	private IUserManageDao userManageDao;
	
	public void setUserManageDao(IUserManageDao userManageDao) {
		this.userManageDao = userManageDao;
	}

	public List getUserPosition(UserLoginBean userLogin) {
		List userList = new ArrayList();
		if (userLogin.getManagementCode().equals(SysConstants.PRIVILEGE_ADMIN)) {
			// ����Ա��¼����ѯ���й�˾�Ͳ���
			userList = userManageDao.getUserPosition();
		} else if (userLogin.getManagementCode().equals(
				SysConstants.PRIVILEGE_USER)) {// ��ͨ�û���¼
			return null;
		} else {
			// ���Ż�˾����Ա��¼����ѯ���ϼ����Ź�˾���������Ź�˾
			userList = userManageDao.getUserPositionInfo(userLogin.getManagementCode());
		}
		return userList;
	}

	public String getUserDepartment(String managementCode) {
	if (managementCode.equals(SysConstants.PRIVILEGE_ADMIN)||managementCode.equals(SysConstants.PRIVILEGE_USER)) {
		return managementCode;
	} else {
		return userManageDao.getUserDepartment(managementCode);
	}
	}

	public PositionBean getPositionName(String positionId) {
		return userManageDao.getPositionName(positionId);
	}

	public List getAllUserInfo(String positionID, String flagDB,PageBean pageBean) {
		List rsList = userManageDao.getAllUserInfo(positionID,pageBean.getFirstResult(),pageBean.getMaxResult());
		List userList = new ArrayList();
		UserBean userBean;
		for (int i = 0; i < rsList.size(); i++) {
			userBean = (UserBean)rsList.get(i);
			userBean.setManagementName(getDepartmentByCode(userBean.getManagementCode()));
			
			userList.add(userBean);
		}
		return userList;
	}
	
	/*
	 * ���ݲ��Ż�˾����ڹ�˾���ű��в�ѯ������
	 * 
	 * @param String Code�����Ż�˾���
	 * 
	 * @return ���Ż�˾����
	 */
	public String getDepartmentByCode(String code) {
		if (code.equals(SysConstants.PRIVILEGE_USER)) {
			return "��";
		} else if (code.equals(SysConstants.PRIVILEGE_ADMIN)) {
			return "��������Ա";
		} else {
			return userManageDao.getDepartmentByCode(code);
		}
	}

	public List getOrgTree(String companyCode) {
		List rsList = userManageDao.getOrgTree(companyCode);
		List orgTreeList = new ArrayList();
		UserTreeBean userTreeVO = null;
		for (int i = 0; i < rsList.size(); i++) {
			userTreeVO = (UserTreeBean)rsList.get(i);
			if (companyCode.equals(userTreeVO.getCode())) {
				userTreeVO.setParentCode(SysConstants.TREE_ROOT_NODE);
			}
			orgTreeList.add(userTreeVO);
		}
		return orgTreeList;
	}

	public void addUserInfo(UserBean userBean, UserLoginBean userLoginBean,
			String flagDB) {
			String userID = "";
			String pwd = SysConstants.INITPWD;
			userID = userManageDao.getUserId().toString();
			if (userBean.getManagementCode() == null) {
				userBean.setManagementCode(SysConstants.PRIVILEGE_USER);
			}
			userBean.setUserID(userID);
			userBean.setCreateBy(userLoginBean.getUserid());
			userBean.setPassword(MD5.getMD5(pwd));
			userManageDao.addUserInfo(userBean);
			userManageDao.addPositionUser(userBean);
			
	}
	
	public List getUserInfo(String userID, String flagDB) {
		UserBean userBean = userManageDao.getUserInfo(userID);
		List userList = new ArrayList();
		
		userList.add(userBean);
		return userList;
	}

	public String checkLoginName(String userName) {
	    String isExist = "false";
	    Integer count = userManageDao.checkLoginName(userName);
	    if(count.intValue()==0){
	    	isExist = "true";
	    }
		return isExist;
	}

	public void updateUserInfo(UserBean userBean, String userID, String flagDB) {
		userBean.setCreateBy(userID);
		userManageDao.updateUserInfo(userBean);
		userManageDao.updatePositionInfo(userBean);
		
	}

	public void resetPassword(UserBean userBean) {
		userManageDao.resetPassword(userBean);
	}
	/**
	 * �����û�ְλ
	 */
	public boolean updateUserPosition(UserBean userBean, UserLoginBean userLoginBean) {
		boolean flag = false;
		try {
			if (userBean.getPositionID().length() > 0) {
				userBean.setPositionID(userBean.getPositionID().substring(1));
			}
			userBean.setCreateBy(userLoginBean.getUserid());
			userManageDao.updatePositionInfo(userBean);
			flag = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return flag;
	}


	public boolean deleteUserInfo(String userID) {
		int flag = userManageDao.deleteUserPositionInfo(userID);
		if (flag < 1) {
			return false;
		} else {
			flag = userManageDao.deleteUserInfo(userID);
		}
		if (flag < 1) {
			return false;
		}
		return true;
	}


	public int getAllUserCount(String positionID) {
		// TODO Auto-generated method stub
		int count = 0;
		count = userManageDao.getAllUserCount(positionID).intValue();
		return count;
	}


}
