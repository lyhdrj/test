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
		if (userLogin.getManagementCode().equals(SysConstants.PRIVILEGE_ADMIN)) {// ȫ�ֹ���Ա��¼
			orgList = orgManageDao.getAllOrgInfo();
			// ���νṹ�а������й�˾�Ͳ���
		} else if (userLogin.getManagementCode().equals(
				SysConstants.PRIVILEGE_USER)) {// ��ͨ�û���¼
			return null;// �����νṹ
		} else {
			orgList = orgManageDao.getOrgInfo(userLogin);
			// ���νṹ�а����û��ɲ������Ż�˾
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
	 * ��ò�����Ϣ
	 */
	public OrgBean getOrgName(String parentOrgCode) {
		return orgManageDao.getOrgName(parentOrgCode);
	}

	/**
	 * �õ���λһ���µ������¼���λ���Ƶ���Ϣ
	 */
	public List<OrgBean> getOrgSubInfo(String parentComCode, PageBean pageBean) {
		return orgManageDao.getOrgSubInfo(parentComCode, pageBean
				.getFirstResult(), pageBean.getMaxResult());
	}

	/**
	 * ��֤�������ơ����Ŵ���
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
			msg = "��������:" + orgBean.getOrgName().trim() + " �Ѵ��ڣ����������룡";
			count = 0;
		}
		if (!type.equalsIgnoreCase("update")) {
			count = orgManageDao.getOrgCodeCount(orgBean);
		}
		if (count.intValue() > 0) {
			msg = msg + "���Ŵ���:" + orgBean.getOrgCode().trim() + " �Ѵ��ڣ����������룡 ";
		}
		return msg;
	}

	/**
	 * ��Ӳ���
	 */
	public void addOrgInfo(OrgBean orgBean) {
		orgManageDao.addOrgInfo(orgBean);
	}

	/**
	 * ��ѯ����
	 */
	public List getOneInfo(String orgCode) {
		return orgManageDao.getOneInfo(orgCode);
	}

	/**
	 * �޸Ĳ���
	 */
	public void updateOneInfo(OrgBean orgBean) {
		orgManageDao.updateOneInfo(orgBean);
	}

	/**
	 * ɾ������
	 */
	public void deleteOneInfo(String orgCode) {
		List<String> userIdList = orgManageDao.getUserIds(orgCode);
		if (userIdList.size()!=0 && userIdList!=null) {
			orgManageDao.deletePositionUser(orgCode);// ɾ��ְλ���û�
			orgManageDao.deleteTmUser(userIdList);// ɾ���û����Ӧ�û�
			orgManageDao.deletePositionRole(orgCode);// ɾ��ְλ�Ľ�ɫ
			orgManageDao.deletePosition(orgCode);// ɾ�����������ְλ
			orgManageDao.deleteOrgInfo(orgCode);// ɾ������������Ӳ���
			orgManageDao.deleteOneInfo(orgCode);// ɾ������
		} else {
			orgManageDao.deletePositionUser(orgCode);// ɾ��ְλ���û�
			orgManageDao.deletePositionRole(orgCode);// ɾ��ְλ�Ľ�ɫ
			orgManageDao.deletePosition(orgCode);// ɾ�����������ְλ
			orgManageDao.deleteOrgInfo(orgCode);// ɾ������������Ӳ���
			orgManageDao.deleteOneInfo(orgCode);// ɾ������
		}
	}
	/**
	 * ��ѯ��������
	 */
	public Integer getSubOrgCount(String orgCode) {
		return orgManageDao.getSubOrgCount(orgCode);
	}
}
