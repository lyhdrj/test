package com.nasoft.sysmanage.service;

import java.util.List;

import com.nasoft.sysmanage.model.OrgBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.UserLoginBean;

/**
 * 
 * @author Cao Yang
 */
@SuppressWarnings("unchecked")
public interface IOrgManageService {

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param userLogin
	 * @return List
	 * @Description TODO getOrgCode
	 */
	public List<OrgBean> getOrgCode(UserLoginBean userLogin);

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param parentOrgCode
	 * @return OrgBean
	 * @Description TODO getOrgName
	 */
	public OrgBean getOrgName(String parentOrgCode);

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param parentComCode
	 * @return List
	 * @Description TODO getOrgSubInfo
	 */
	public List<OrgBean> getOrgSubInfo(String parentComCode, PageBean pageBean);

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param orgBean
	 * @param type
	 * @return String
	 * @Description TODO checkInfo
	 */
	public String checkInfo(OrgBean orgBean, String type);

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param orgBean
	 * @Description TODO addOrgInfo
	 */
	public void addOrgInfo(OrgBean orgBean);

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param orgCode
	 * @return List
	 * @Description TODO get org info
	 */
	public List getOneInfo(String orgCode);

	/**
	 * 
	 * @author Cao Yang 2012-11-14
	 * @param orgBean
	 * @Description TODO update org info
	 */
	public void updateOneInfo(OrgBean orgBean);

	/**
	 * 
	 * @author Cao Yang 2012-11-15
	 * @param orgCode
	 * @Description TODO delete one info
	 */
	public void deleteOneInfo(String orgCode);

	/**
	 * 
	 * @author Cao Yang 2012-11-15
	 * @param orgCode
	 * @Description TODO get sub OrgCount
	 */
	public Integer getSubOrgCount(String orgCode);
}
