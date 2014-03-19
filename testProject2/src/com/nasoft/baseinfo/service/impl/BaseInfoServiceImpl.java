/**
 *
 **************************************************************
 * @Project     : BaseInfoBean.java
 * @date        : 2012-11-23 
 * @author      : Chi Kehan
 * @company     : Nasoft
 * @model		: 
 * @Description	: TODO
 * @Remarks		: 
 * ------------------------------------------------------------
 * @history
 * ID		Date		Modifier			Reason
 * 1		
 * 2
 **************************************************************
 */
package com.nasoft.baseinfo.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import com.nasoft.baseinfo.model.BaseInfoBean;
import com.nasoft.baseinfo.persistence.iface.IBaseInfoDao;
import com.nasoft.baseinfo.service.IBaseInfoService;
import com.nasoft.sysmanage.model.PageBean;
import com.nasoft.sysmanage.model.ReportBean;
@Component
public class BaseInfoServiceImpl implements IBaseInfoService {

	private IBaseInfoDao  baseInfoDao;
	
	
	/**
	 * @return the baseInfoDao
	 */
	public IBaseInfoDao getBaseInfoDao() {
		return baseInfoDao;
	}


	/**
	 * @param baseInfoDao the baseInfoDao to set
	 */
	public void setBaseInfoDao(IBaseInfoDao baseInfoDao) {
		this.baseInfoDao = baseInfoDao;
	}


	public List<BaseInfoBean> queryBaseInfo(BaseInfoBean baseInfo,PageBean pageBean) {
		return baseInfoDao.queryBaseInfo(baseInfo,pageBean.getFirstResult(),pageBean.getMaxResult());
	}
	
	public void addBaseInfo(BaseInfoBean baseInfo){
		baseInfoDao.addBaseInfo(baseInfo);
	}


	public Integer queryBaseInfoCount(BaseInfoBean baseInfo) {
		return baseInfoDao.queryBaseInfoCount(baseInfo);
	}


	public boolean deleteBaseInfo(String []ids) {
		List<String> idList = Arrays.asList(ids);
		int count = baseInfoDao.deleteBaseInfo(idList);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	public BaseInfoBean queryOne(long id) {
		List<BaseInfoBean> li = baseInfoDao.queryOne(id);
		if(li == null||li.isEmpty()){
			return null;
		}
		return li.get(0);
	}


	public boolean updateBaseInfo(BaseInfoBean baseInfoBean) {
		int count = baseInfoDao.updateBaseInfo(baseInfoBean);
		if(count > 0){
			return true;
		}
		return false;
	}
	/**
	 * @author Liu Hanpeng 2012-12-12
	 * @param baseInfoBean
	 * @return 
	 * @Description TODO
	 */
	public List<BaseInfoBean> queryAll(BaseInfoBean baseInfoBean){
		return baseInfoDao.queryAll(baseInfoBean);
	}
	
	/**
	 * @author Liu Hanpeng Dec 18, 2012
	 * @return 
	 * @Description TODO
	 */
	public HashMap getReport(String reportFuncId){
		return baseInfoDao.getReport(reportFuncId);
	}
	/**
	 * @author Liu Hanpeng Dec 18, 2012
	 * @return 
	 * @Description TODO
	 */
	public ReportBean getReportInfo(String reportId){
		return baseInfoDao.getReportInfo(reportId);
	}
}
