/**
 *
 **************************************************************
 * @Project     : ICompanyManageService.java
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
package com.nasoft.sysmanage.service;

import java.util.List;

import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.UserLoginBean;
import com.nasoft.sysmanage.model.CompanyBean;

/**
 * @author Li Fengli
 */
public interface ICompanyManageService {

	/**
	 * @return userLogin
	 */
	public List<CompanyBean> getCompanyCode(UserLoginBean userLogin);

	/**
	 * @return userManagementCode
	 */
	public String getUserDepartment(String userManagementCode);

	/**
	 * @return companyCode
	 */
	public String getCompanyName(String companyCode);
	
	/**
	 * @return parentComCode,pageBean
	 */
	public List<CompanyBean> getCompanyInfo(String parentComCode,PageBean pageBean);

	/**
	 * @return companyBean,type  check info
	 */
	public String checkInfo(CompanyBean companyBean, String type);

	/**
	 * @param companyBean,userID  add company info
	 */
	public void addCompanyInfo(CompanyBean companyBean, String userID);

	/**
	 * @return companyCode  get info
	 */
	public CompanyBean getOneInfo(String companyCode);

	/**
	 * @param companyBean update company info
	 */
	public void updateOneCompanyFunc(CompanyBean companyBean);
	
	/**
	 * @param companyBean delete company info
	 */
	public void deleteOneCompanyFunc(CompanyBean companyBean);
	
	/**
	 * @param companyBean delete org info
	 */
	public void deleteOrg(CompanyBean companyBean);

	/**
	 * @param parentComCode get sub company count
	 */
	public int getSubComCount(String parentComCode);
	
	/**
	 * @param companyBean delete user info
	 */
	public void deleteUser(CompanyBean companyBean);
	
	/**
	 * @param companyBean delete position user info
	 */
	public void deletePositionUser(CompanyBean companyBean);
	
	/**
	 * @param companyBean delete position role info
	 */
	public void deletePositionRole(CompanyBean companyBean);
	
	/**
	 * @param companyBean delete position info
	 */
	public void deletePosition(CompanyBean companyBean);
}
