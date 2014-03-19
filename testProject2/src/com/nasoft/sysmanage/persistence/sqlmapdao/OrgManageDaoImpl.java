package com.nasoft.sysmanage.persistence.sqlmapdao;

import java.util.List;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import com.nasoft.sysmanage.model.OrgBean;
import com.nasoft.sysmanage.persistence.iface.IOrgManageDao;
import com.nasoft.sysmanage.model.UserLoginBean;

@SuppressWarnings("unchecked")
public class OrgManageDaoImpl extends SqlMapClientTemplate implements
		IOrgManageDao {

	public List getAllOrgInfo() {
		return queryForList("OrgManage.getAllOrgInfo");
	}

	public List getOrgInfo(UserLoginBean userLogin) {
		return queryForList("OrgManage.getOrgInfo", userLogin);
	}

	public OrgBean getOrgName(String parentOrgCode) {
		return (OrgBean) queryForObject("OrgManage.getOrgName", parentOrgCode);
	}

	public List<OrgBean> getOrgSubInfo(String parentComCode, int firstResult,
			int maxResult) {
		return queryForList("OrgManage.getOrgSubInfo", parentComCode,
				firstResult, maxResult);
	}

	public Integer getOrgNameCount(OrgBean orgBean) {
		return (Integer) queryForObject("OrgManage.getOrgNameCount", orgBean);
	}

	public Integer getOrgCodeCount(OrgBean orgBean) {
		return (Integer) queryForObject("OrgManage.getOrgCodeCount", orgBean);
	}

	public Integer getOrgCodeCountT(OrgBean orgBean) {
		return (Integer) queryForObject("OrgManage.getOrgCodeCountT", orgBean);
	}

	public void addOrgInfo(OrgBean orgBean) {
		insert("OrgManage.addOrgInfo", orgBean);
	}

	public List getOneInfo(String orgCode) {
		return queryForList("OrgManage.getOneInfo", orgCode);
	}

	public void updateOneInfo(OrgBean orgBean) {
		update("OrgManage.updateOneInfo", orgBean);
	}

	public void deleteOneInfo(String orgCode) {
		delete("OrgManage.deleteOneInfo", orgCode);
	}

	public void deletePosition(String orgCode) {
		delete("OrgManage.deletePosition", orgCode);
	}

	public void deletePositionRole(String orgCode) {
		delete("OrgManage.deletePositionRole", orgCode);
	}

	public Integer getSubOrgCount(String orgCode) {
		return (Integer) queryForObject("OrgManage.getSubOrgCount", orgCode);
	}

	public void deleteOrgInfo(String orgCode) {
		delete("OrgManage.deleteOrgInfo", orgCode);
	}

	public void deletePositionUser(String orgCode) {
		delete("OrgManage.deletePositionUser", orgCode);
	}

	public int deleteTmUser(List<String> uesrIdList) {
		return delete("OrgManage.deleteTmUser", uesrIdList);
	}

	public List<String> getUserIds(String orgCode) {
		return queryForList("OrgManage.getUserIds", orgCode);
	}
}
