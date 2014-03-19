/**
 *
 **************************************************************
 * @Project     : BaseInfoBean.java
 * @date        : 2012-11-23 
 * @author      : Chi Kehan
 * @company     : Nasoft
 * @model		: BaseInfo DAO Implement
 * @Description	: TODO
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.baseinfo.persistence.sqlmapdao;

import java.util.HashMap;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import com.nasoft.baseinfo.model.BaseInfoBean;
import com.nasoft.baseinfo.persistence.iface.IBaseInfoDao;
import com.nasoft.sysmanage.model.ReportBean;

@SuppressWarnings("unchecked")
public class BaseInfoDaoImpl extends SqlMapClientTemplate implements IBaseInfoDao {
	
	public List<BaseInfoBean> queryBaseInfo(BaseInfoBean baseInfo,int firstResult,int maxResult) {
		// TODO Auto-generated method stub
		return queryForList("BaseInfo.getBaseInfo", baseInfo,firstResult,maxResult);
	}
	/**
	 * @author Liu Hanpeng 2012-11-23
	 * @param baseInfo
	 * @Description Insert Base Information
	 */
	public void addBaseInfo(BaseInfoBean baseInfo) {
		insert("BaseInfo.addBaseInfo",baseInfo);
	}

	public Integer queryBaseInfoCount(BaseInfoBean baseInfo) {
		return (Integer)queryForObject("BaseInfo.getBaseInfoCount", baseInfo);
	}

	public int deleteBaseInfo(List<String> idList) {
		return delete("BaseInfo.deleteBaseInfo",idList);
	}
	public List<BaseInfoBean> queryOne(long id) {
		return queryForList("BaseInfo.getOne",id);
	}
	public Integer updateBaseInfo(BaseInfoBean baseInfoBean) {
		return update("BaseInfo.updateBaseInfo", baseInfoBean);
	}
	
	/**
	 * @author Liu Hanpeng 2012-12-12
	 * @param baseInfoBean
	 * @return 
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryAll(BaseInfoBean baseInfo){
		return queryForList("BaseInfo.getBaseInfo",baseInfo);
	}
	
	/**
	 * @author Liu Hanpeng 2012-12-18
	 * @return HashMap
	 * @Description TODO
	 */
	public HashMap getReport(String reportFuncId){
		return (HashMap)queryForMap("reportManage.getReportMap",reportFuncId,"reportId","reportName");
	}
	
	/**
	 * @author Liu Hanpeng 2012-12-18
	 * @return List<ReportBean>
	 * @Description TODO
	 */
	public ReportBean getReportInfo(String reportId){
		return (ReportBean)queryForObject("reportManage.getReportInfo",reportId);
	}
}
