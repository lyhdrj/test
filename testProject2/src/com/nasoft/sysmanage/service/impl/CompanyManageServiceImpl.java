/**
 *
 **************************************************************
 * @Project     : CompanyManageServiceImpl.java
 * @date        : Nov 14,2012
 * @author      : Li Fengli
 * @company     : Nasoft
 * @model		: CompanyManage
 * @Description	: Company Manage Business Logic Layer
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.sysmanage.service.impl;

import java.util.Iterator;
import java.util.List;

import com.nasoft.base.SysConstants;
import com.nasoft.sysmanage.model.CompanyBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.persistence.iface.ICompanyManageDao;
import com.nasoft.sysmanage.service.ICompanyManageService;
import com.nasoft.sysmanage.model.UserLoginBean;

/**
 * @author Li Fengli
 */
@SuppressWarnings("unchecked")
public class CompanyManageServiceImpl implements ICompanyManageService {

	private ICompanyManageDao companyManageDao;

	public ICompanyManageDao getCompanyManageDao() {
		return companyManageDao;
	}

	public void setCompanyManageDao(ICompanyManageDao companyManageDao) {
		this.companyManageDao = companyManageDao;
	}
	
	/**
	 * @author Li Fengli 2012-11-14
	 * @param userLogin
	 * @return 
	 * @Description get company code
	 */
	public List getCompanyCode(UserLoginBean userLogin) {
		List companyList = null;
		if (userLogin.getManagementCode().equals(SysConstants.PRIVILEGE_ADMIN)) {
			// ����Ա��¼����ѯ���й�˾�Ͳ���
			companyList = companyManageDao.getCompanyCode(null);
		} else if (userLogin.getManagementCode().equals(
				SysConstants.PRIVILEGE_USER)) {// ��ͨ�û���¼
			return null;// �����νṹ
		} else {
			if (companyManageDao.getOrgCount(userLogin.getManagementCode())
					.intValue() > 0) {// ���Ź���Ա��¼
				return null;// �����νṹ
			} else {
				// ���Ż�˾����Ա��¼����ѯ���ϼ����Ź�˾���������Ź�˾
				companyList = companyManageDao.getCompanyCode(userLogin);
				Iterator iterator = companyList.iterator();
				while (iterator.hasNext()) {
					CompanyBean companyBean = (CompanyBean) iterator.next();
					if (userLogin.getManagementCode().equals(
							companyBean.getCompanyCode())) {// ��˾����Ա��¼
						companyBean
								.setParentComCode(SysConstants.TREE_ROOT_NODE);// ��������������˾Ϊ���νṹ���ڵ���ӽڵ�
					}
				}
			}
		}
		return companyList;
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param userManagementCode
	 * @return 
	 * @Description get user department
	 */
	public String getUserDepartment(String userManagementCode) {
		if (userManagementCode.equals(SysConstants.PRIVILEGE_ADMIN)
				|| userManagementCode.equals(SysConstants.PRIVILEGE_USER)) {
			return userManagementCode;
		} else {
			return companyManageDao.getUserDepartment(userManagementCode);
		}

	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @return 
	 * @Description get company name
	 */
	public String getCompanyName(String companyCode) {
		return companyManageDao.getCompanyName(companyCode);
	}
	
	/**
	 * @author Li Fengli 2012-11-14
	 * @param parentComCode
	 * @return 
	 * @Description get company info
	 */
	public List<CompanyBean> getCompanyInfo(String parentComCode,PageBean pageBean) {
		return companyManageDao.getCompanyInfo(parentComCode,pageBean.getFirstResult(),pageBean.getMaxResult());
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean,type
	 * @return 
	 * @Description check info
	 */
	public String checkInfo(CompanyBean companyBean, String type) {
		String msg = "";
		CompanyBean company = null;
		Integer count = null;
		if (type.equalsIgnoreCase("update")) {
			count = companyManageDao.getCompanyNameCount(companyBean);
		} else {
			company = new CompanyBean();
			company.setCompanyName(companyBean.getCompanyName());
			count = companyManageDao.getCompanyNameCount(company);
		}
		if (count.intValue() != 0) {
			msg = msg + "��λ����:" + companyBean.getCompanyName().trim()
					+ " �Ѵ��ڣ����������룡 ";
			count = 0;
		}
		if (type.equalsIgnoreCase("insert")) {
			count = companyManageDao.getCompanyCodeCount(companyBean);
		}

		if (count.intValue() != 0) {
			msg = msg + "��λ����:" + companyBean.getCompanyCode().trim()
					+ " �Ѵ��ڣ����������룡";
		}
		return msg;
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean,userID
	 * @return 
	 * @Description add company info
	 */
	public void addCompanyInfo(CompanyBean companyBean, String userID) {
		companyManageDao.addCompanyInfo(companyBean, userID);
	}

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @return 
	 * @Description get company info
	 */
	public CompanyBean getOneInfo(String companyCode) {
		return companyManageDao.getOneInfo(companyCode);
	}
	
	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyBean
	 * @return 
	 * @Description update company info
	 */
	public void updateOneCompanyFunc(CompanyBean companyBean) {
		companyManageDao.updateOneCompanyFunc(companyBean);
	}
	

	/**
	 * @author Li Fengli 2012-11-14
	 * @param companyCode
	 * @return 
	 * @Description delete org info
	 */
	public void deleteOrg(CompanyBean companyBean) {
		companyManageDao.deleteOrg(companyBean);
	}
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyCode
	 * @return 
	 * @Description delete user info
	 */
	public void deleteUser(CompanyBean companyBean) {
		companyManageDao.deleteUser(companyBean);
	}

	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyCode
	 * @return 
	 * @Description delete position user info
	 */
	public void deletePositionUser(CompanyBean companyBean) {
		companyManageDao.deletePositionUser(companyBean);
	}
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyCode
	 * @return 
	 * @Description delete position role info
	 */
	public void deletePositionRole(CompanyBean companyBean) {
		companyManageDao.deletePositionRole(companyBean);
	}
	
	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyCode
	 * @return 
	 * @Description delete position info
	 */
	public void deletePosition(CompanyBean companyBean) {
		companyManageDao.deletePosition(companyBean);
	}

	/**
	 * @author Li Fengli 2012-12-24
	 * @param companyCode
	 * @return 
	 * @Description get sub company count info
	 */
	public int getSubComCount(String parentComCode) {
		return companyManageDao.getSubComCount(parentComCode);
	}

	public void deleteOneCompanyFunc(CompanyBean companyBean) {
	     companyManageDao.deletePositionUser(companyBean);
	     companyManageDao.deletePositionRole(companyBean);
	     companyManageDao.deleteUser(companyBean);
	     companyManageDao.deletePosition(companyBean);
	     companyManageDao.deleteOrg(companyBean);
	     companyManageDao.deleteOneCompanyFunc(companyBean);
	}
}
