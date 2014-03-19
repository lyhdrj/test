package com.nasoft.sysmanage.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import com.nasoft.base.SysConstants;
import com.nasoft.sysmanage.persistence.iface.IOrgManageDao;
import com.nasoft.sysmanage.service.IOrgManageService;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.OrgBean;

/**
 * 
 * @author Cao Yang
 */
@SuppressWarnings("unchecked")
public class OrgManageServiceImpl implements IOrgManageService {

	private IOrgManageDao orgManageDao;

	public IOrgManageDao getOrgManageDao() {
		return orgManageDao;
	}

	public void setOrgManageDao(IOrgManageDao orgManageDao) {
		this.orgManageDao = orgManageDao;
	}

	/**
	 * 
	 */
	public List<OrgBean> getOrgCode(UserLoginBean userLogin) {
		List orgList = null;
		List orgListTwo = new ArrayList();
		OrgBean orgBean = null;
		if (userLogin.getManagementCode().equals(SysConstants.PRIVILEGE_ADMIN)) {// 全局管理员登录
			orgList = orgManageDao.getAllOrgInfo();
			// 树形结构中包括所有公司和部门
		} else if (userLogin.getManagementCode().equals(
				SysConstants.PRIVILEGE_USER)) {// 普通用户登录
			return null;// 无树形结构
		} else {
			orgList = orgManageDao.getOrgInfo(userLogin);
			// 树形结构中包括用户可操作部门或公司
		}
		for (int i = 0; i < orgList.size(); i++) {
			orgBean = (OrgBean) orgList.get(i);
			if (orgBean.getOrgCode().equals(userLogin.getManagementCode())) {
				orgBean.setParentOrgCode(SysConstants.TREE_ROOT_NODE);
			}
			orgListTwo.add(orgBean);
		}
		return orgListTwo;
	}

	/**
	 * 获得部门信息
	 */
	public OrgBean getOrgName(String parentOrgCode) {
		return orgManageDao.getOrgName(parentOrgCode);
	}

	/**
	 * 得到单位一个下的所有下级单位名称等信息
	 */
	public List<OrgBean> getOrgSubInfo(String parentComCode, PageBean pageBean) {
		return orgManageDao.getOrgSubInfo(parentComCode, pageBean
				.getFirstResult(), pageBean.getMaxResult());
	}

	/**
	 * 验证部门名称、部门代码
	 * 
	 * @param name
	 * @param pwd
	 * @return
	 */
	public String checkInfo(OrgBean orgBean, String type) {
		String msg = "";
		Integer count = null;
		if (type.equalsIgnoreCase("update")) {
			count = orgManageDao.getOrgCodeCountT(orgBean);
		} else {
			count = orgManageDao.getOrgNameCount(orgBean);
		}
		if (count.intValue() > 0) {
			msg = "部门名称:" + orgBean.getOrgName().trim() + " 已存在，请重新输入！";
			count = 0;
		}
		if (!type.equalsIgnoreCase("update")) {
			count = orgManageDao.getOrgCodeCount(orgBean);
		}
		if (count.intValue() > 0) {
			msg = msg + "部门代码:" + orgBean.getOrgCode().trim() + " 已存在，请重新输入！ ";
		}
		return msg;
	}

	/**
	 * 添加部门
	 */
	public void addOrgInfo(OrgBean orgBean) {
		orgManageDao.addOrgInfo(orgBean);
	}

	/**
	 * 查询部门
	 */
	public List getOneInfo(String orgCode) {
		return orgManageDao.getOneInfo(orgCode);
	}

	/**
	 * 修改部门
	 */
	public void updateOneInfo(OrgBean orgBean) {
		orgManageDao.updateOneInfo(orgBean);
	}

	/**
	 * 删除部门
	 */
	public void deleteOneInfo(String orgCode) {
		List<String> userIdList = orgManageDao.getUserIds(orgCode);
		if (userIdList.size()!=0 && userIdList!=null) {
			orgManageDao.deletePositionUser(orgCode);// 删除职位的用户
			orgManageDao.deleteTmUser(userIdList);// 删除用户表对应用户
			orgManageDao.deletePositionRole(orgCode);// 删除职位的角色
			orgManageDao.deletePosition(orgCode);// 删除部门下面的职位
			orgManageDao.deleteOrgInfo(orgCode);// 删除部门下面的子部门
			orgManageDao.deleteOneInfo(orgCode);// 删除部门
		} else {
			orgManageDao.deletePositionUser(orgCode);// 删除职位的用户
			orgManageDao.deletePositionRole(orgCode);// 删除职位的角色
			orgManageDao.deletePosition(orgCode);// 删除部门下面的职位
			orgManageDao.deleteOrgInfo(orgCode);// 删除部门下面的子部门
			orgManageDao.deleteOneInfo(orgCode);// 删除部门
		}
	}
	/**
	 * 查询部门总数
	 */
	public Integer getSubOrgCount(String orgCode) {
		return orgManageDao.getSubOrgCount(orgCode);
	}
}
