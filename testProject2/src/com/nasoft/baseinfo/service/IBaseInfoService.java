/**
 *
 **************************************************************
 * @Project     : BaseInfoBean.java
 * @date        : 2012-11-23 
 * @author      : Chi Kehan
 * @company     : Nasoft
 * @model		: BaseInfo Service Interface
 * @Description	: TODO
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */

package com.nasoft.baseinfo.service;

import java.util.HashMap;
import java.util.List;

import com.nasoft.baseinfo.model.BaseInfoBean;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.ReportBean;

public interface IBaseInfoService {

	/**
	 * @author Chi Kehan 2012-11-23
	 * @param baseInfo
	 * @return List<BaseInfoBean>
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryBaseInfo(BaseInfoBean baseInfo,PageBean pageBean);
	
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
	 * @return List<BaseInfoBean>
	 * @Description TODO
	 */
	public boolean deleteBaseInfo(String []ids);
	
	/**
	 * @author Chi Kehan 2012-11-26
	 * @param id
	 * @return 
	 * @Description TODO
	 */
	public BaseInfoBean queryOne(long id);
	
	/**
	 * @author Chi Kehan 2012-11-26
	 * @param baseInfoBean
	 * @return 
	 * @Description TODO
	 */
	public boolean updateBaseInfo(BaseInfoBean baseInfoBean);
	/**
	 * @author Liu Hanpeng 2012-12-12
	 * @param baseInfoBean
	 * @return 
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryAll(BaseInfoBean baseInfoBean);
	
	/**
	 * @author Liu Hanpeng Dec 18, 2012
	 * @return 
	 * @Description TODO
	 */
	public HashMap getReport(String reportFuncId);
	
	/**
	 * @author Liu Hanpeng Dec 18, 2012
	 * @return 
	 * @Description TODO
	 */
	public ReportBean getReportInfo(String reportId);
	
}
