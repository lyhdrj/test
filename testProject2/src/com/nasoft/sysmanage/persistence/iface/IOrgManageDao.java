package com.nasoft.sysmanage.persistence.iface;

import java.util.List;
import com.nasoft.sysmanage.model.OrgBean;
import com.nasoft.sysmanage.model.UserLoginBean;

@SuppressWarnings("unchecked")
public interface IOrgManageDao {

	public List getAllOrgInfo();

	public List getOrgInfo(UserLoginBean userLogin);

	public OrgBean getOrgName(String parentOrgCode);

	public List<OrgBean> getOrgSubInfo(String parentComCode, int firstResult,
			int maxResult);

	public Integer getOrgNameCount(OrgBean orgBean);

	public Integer getOrgCodeCount(OrgBean orgBean);

	public Integer getOrgCodeCountT(OrgBean orgBean);

	public void addOrgInfo(OrgBean orgBean);

	public List getOneInfo(String orgCode);

	public void updateOneInfo(OrgBean orgBean);

	public void deleteOneInfo(String orgCode);

	public void deletePosition(String orgCode);

	public void deletePositionRole(String orgCode);

	public Integer getSubOrgCount(String orgCode);

	public void deleteOrgInfo(String orgCode);

	public void deletePositionUser(String orgCode);

	public int deleteTmUser(List<String> userIdList);

	public List getUserIds(String orgCode);

}
