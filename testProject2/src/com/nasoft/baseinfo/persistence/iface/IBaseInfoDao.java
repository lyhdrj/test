/**
 *
 **************************************************************
 * @Project     : BaseInfoBean.java
 * @date        : 2012-11-23 
 * @author      : Chi Kehan
 * @company     : Nasoft
 * @model		: BaseInfo DAO Interface
 * @Description	: TODO
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */

package com.nasoft.baseinfo.persistence.iface;

import java.util.HashMap;
import java.util.List;

import com.nasoft.baseinfo.model.BaseInfoBean;
import com.nasoft.sysmanage.model.ReportBean;

public interface IBaseInfoDao {

	/**
	 * @author Chi Kehan 2012-11-23
	 * @param baseInfo
	 * @return List<BaseInfoBean>
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryBaseInfo(BaseInfoBean baseInfo,int firstResult,int maxResult);
	
	/**
	 * @author Liu Hanpeng 2012-11-23
	 * @param baseInfo
	 * @Description Insert Base Information
	 */
	public void addBaseInfo(BaseInfoBean baseInfo);
	/**
	 * @author Chi Kehan 2012-11-23
	 * @param baseInfo
	 * @return List<BaseInfoBean>
	 * @Description TODO
	 */
	public Integer queryBaseInfoCount(BaseInfoBean baseInfo);
	
	/**
	 * @author Chi Kehan 2012-11-23
	 * @param baseInfo
	 * @return 
	 * @Description TODO
	 */
	public int deleteBaseInfo(List<String> idList);
	
	/**
	 * @author Chi Kehan 2012-11-26
	 * @param id
	 * @return 
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryOne(long id);
	
	/**
	 * @author Chi Kehan 2012-11-26
	 * @param baseInfoBean
	 * @return 
	 * @Description TODO
	 */
	public Integer updateBaseInfo(BaseInfoBean baseInfoBean);
	/**
	 * @author Liu Hanpeng 2012-12-12
	 * @param baseInfoBean
	 * @return 
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryAll(BaseInfoBean baseInfo);
	
	public HashMap getReport(String reportFuncId);
	
	public ReportBean getReportInfo(String reportId);
	
}
