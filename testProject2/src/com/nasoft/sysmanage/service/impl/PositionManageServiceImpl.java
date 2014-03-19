/**
 *
 **************************************************************
 * @Project     : PositionManageServiceImpl.java
 * @date        : Nov 12, 2012 
 * @author      : Wu Di
 * @company     : Nasoft
 * @model		: PositionManage
 * @Description	: Position Manager Service Impl
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
import java.util.Arrays;
import java.util.List;

import com.nasoft.base.SysConstants;
import com.nasoft.sysmanage.persistence.iface.IPositionManageDao;
import com.nasoft.sysmanage.service.IPositionManageService;
import com.nasoft.sysmanage.model.*;

/**
 * 
 * @author Wu Di 2012-11-14
 */
public class PositionManageServiceImpl implements IPositionManageService {

	private IPositionManageDao positionManageDao;

	public void setPositionManageDao(IPositionManageDao positionManageDao) {
		this.positionManageDao = positionManageDao;
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionList
	 * @Description get Position's Code
	 */

	public List getPositionCode(UserLoginBean userInfoBean) {
		List positionList = new ArrayList();
		PositionBean positionBean;
		List rsList = null;
		if (userInfoBean.getManagementCode()
				.equals(SysConstants.PRIVILEGE_USER)) {// 普通用户登录
			return null;// 无树形结构
		} else if (userInfoBean.getManagementCode().equals(
				SysConstants.PRIVILEGE_ADMIN)) {// 全局管理员登录
			// 树形结构中包括所有公司、部门和职位
			rsList = positionManageDao.getAllPositionCode();
		} else {
			// 树形结构中包括用户可操作部门或公司中的职位信息
			rsList = positionManageDao.getPositionCode(userInfoBean);
		}

		if (rsList != null) {
			for (int i = 0; i < rsList.size(); i++) {
				positionBean = (PositionBean) rsList.get(i);
				if (userInfoBean.getManagementCode().equals(
						positionBean.getPositionCode())) {
					positionBean.setOrgCode(SysConstants.TREE_ROOT_NODE);
				}
				positionList.add(positionBean);
			}
		}
		return positionList;
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return userLoginBean
	 * @Description get Role's Information
	 */

	public List<RoleBean> getRoleInfo(UserLoginBean userLoginBean) {
		return positionManageDao.getRoleInfo(userLoginBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return orgCode
	 * @Description get Org's Name
	 */

	public String[] getOrgName(String orgCode) {
		return positionManageDao.getOrgName(orgCode);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return orgCode
	 * @Description get Position's Information
	 */

	public List getPositionInfo(String orgCode, String flagDB, PageBean pageBean) {
		return positionManageDao.getPositionInfo(orgCode, pageBean
				.getFirstResult(), pageBean.getMaxResult());
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return msg
	 * @Description check position's information
	 */

	public String checkInfo(PositionBean positionBean, String type) {
		String msg = "";
		String querySql = "";
		Integer count = null;
		if (type.equalsIgnoreCase("update")) {
			count = positionManageDao.checkUpdateInfo(positionBean);
		} else {
			count = positionManageDao.checkInsertInfo(positionBean);
		}
		if (count.intValue() > 0) {
			msg = "本部门职位名称:" + positionBean.getPositionName().trim()
					+ " 已存在，请重新输入！";
		}
		return msg;
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description add Position's Information
	 */

	public void addPositionInfo(PositionBean positionBean,
			UserLoginBean userLoginBean) {
		Integer seqValue = positionManageDao.getSequence();
		positionBean.setPositionID(seqValue.toString());
		positionBean.setUserId(userLoginBean.getUserid());
		positionManageDao.addPositionInfo(positionBean, userLoginBean);
		positionManageDao.addPositionRoleInfo(positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return positionId
	 * @Description get position's information
	 */
	public PositionBean getOneInfo(String positionId) {
		return positionManageDao.getOneInfo(positionId);
	}

	public List getUserInfo(String positionId) {
		return positionManageDao.getUserInfo(positionId);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description update Position
	 */

	public void updateOnePosition(PositionBean positionBean, String userId) {
		positionBean.setUserId(userId);
		positionManageDao.updatePositionInfo(positionBean);
		positionManageDao.updatePositionRoleInfo(positionBean);
	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description delete Position's information
	 */
	public void deletePositionInfo(String positionId) {
		List list = positionManageDao.getUserInfo(positionId);
		positionManageDao.deletePositionRole(positionId);
		positionManageDao.deletePositionUser(positionId);
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				positionManageDao.deleteUser((String) list.get(i));
			}
		}
		positionManageDao.deletePositionInfo(positionId);

	}

	/**
	 * @author Wu Di 2012-11-14
	 * @return
	 * @Description get Position's count
	 */
	public Integer getPositionCount(String orgCode) {
		return positionManageDao.getPositionCount(orgCode);
	}

}
