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
package com.nasoft.baseinfo.struts.action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.nasoft.base.BaseAction;
import com.nasoft.baseinfo.model.BaseInfoBean;
import com.nasoft.baseinfo.service.IBaseInfoService;
import com.nasoft.sysmanage.model.ReportBean;
import com.nasoft.util.ReportService;

/** 
 * MyEclipse Struts
 * Creation date: 07-21-2010
 * 
 * XDoclet definition:
 * @struts.action path="/acctStateList" name="acctStateListForm" input="/form/acctStateList.jsp" scope="request"
 */
@Controller("baseInfoManage")
public class BaseInfoAction extends BaseAction {
	@Autowired
	private IBaseInfoService baseInfoService;
	private BaseInfoBean baseInfoBean;
	@Autowired
	private ReportService reportService;
	
	/**
	 * @return the baseInfoBean
	 */
	public BaseInfoBean getBaseInfoBean() {
		return baseInfoBean;
	}
	/**
	 * @param baseInfoBean the baseInfoBean to set
	 */
	public void setBaseInfoBean(BaseInfoBean baseInfoBean) {
		this.baseInfoBean = baseInfoBean;
	}

	public String queryBaseInfo() {
		try{
			setPage(baseInfoBean);
			
			List<BaseInfoBean> baseInfosList=baseInfoService.queryBaseInfo(baseInfoBean,pageBean);
			HashMap map = baseInfoService.getReport("1");
			
			request.setAttribute("reportMap", map);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("baseInfoList", baseInfosList);
		}catch(Exception e){
			e.printStackTrace();
			String errorMessage = "在执行BaseInfoAction类中的query方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}finally{
			baseInfoBean = new BaseInfoBean();
		}
		return "querysuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 23, 2012
	 * @return 
	 * @Description TODO
	 */
	public String deleteBaseInfo() {
		try{
			boolean isTrue = baseInfoService.deleteBaseInfo(baseInfoBean.getIds().split(","));
			String hintMsgString = "";
			if(isTrue){
				hintMsgString = "删除成功";
			}else {
				hintMsgString = "删除失败";
			}
			pageBean.setTotalCount(0);
			setPage(baseInfoBean);
			
			List<BaseInfoBean> baseInfosList=baseInfoService.queryBaseInfo(baseInfoBean,pageBean);
			HashMap map = baseInfoService.getReport("1");
			request.setAttribute("reportMap", map);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("hintMsg", hintMsgString);
			request.setAttribute("baseInfoList", baseInfosList);			
		}catch(Exception e){
			e.printStackTrace();
			String errorMessage = "在执行BaseInfoAction类中的deleteBaseInfo方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}finally{
			baseInfoBean = new BaseInfoBean();
		}
		return "deletesuccess";
	}
	
	/**
	 * @author Liu Hanpeng Nov 26, 2012
	 * @return String
	 * @Description TODO
	 */
	public String addBaseInfo(){
		baseInfoBean = getBaseInfoBean();
		pageBean = getPageBean();
		int flag = 1;
		try{
			if(baseInfoBean!=null){
				baseInfoService.addBaseInfo(baseInfoBean);
				request.setAttribute("flag", flag);
			}

			request.setAttribute("pageBean", pageBean);
		}catch(Exception e){
			String errorMessage = "在执行BaseInfoAction类中的query方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}finally{
			baseInfoBean = new BaseInfoBean();
		}
		return "updatesuccess";
	}
	

	/**
	 * @author Chi Kehan 2012-11-19
	 * @param baseInfoBean
	 * @Description TODO
	 */
	public void setPage(BaseInfoBean baseInfoBean){
		int count = pageBean.getTotalCount();
		if(count == 0){
			//获取总数
			count = baseInfoService.queryBaseInfoCount(baseInfoBean);
			pageBean.setTotalCount(count);
		}
	}
		
	/**
	 * @author Chi Kehan 2012-11-26
	 * @return 
	 * @Description TODO
	 */
	public String queryOneForUpdate(){
		baseInfoBean = getBaseInfoBean();
		pageBean = getPageBean();
		String hintMsg = "";
		try{
			BaseInfoBean bean = baseInfoService.queryOne(baseInfoBean.getId());
			
			if(bean == null){
				hintMsg = "无此数据，请查询后再修改";
				request.setAttribute("hintMsg", hintMsg);
			}else{
				request.setAttribute("baseInfoBean", bean);
			}
		}catch(Exception e){
			String errorMessage = "在执行BaseInfoAction类中的queryOneForUpdate方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}finally{
			baseInfoBean = new BaseInfoBean();
		}
		return "queryforupdate";
	}
	/**
	 * @author Chi Kehan 2012-11-26
	 * @return String
	 * @Description TODO
	 */
	public String updateBaseInfo(){
		int flag = 10;
		try{
			if(baseInfoBean!=null){
				baseInfoService.updateBaseInfo(baseInfoBean);
				flag = 1;
			}
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("flag", flag);
			request.getSession().setAttribute("flag", flag);
		}catch(Exception e){
			String errorMessage = "在执行BaseInfoAction类中的updateBaseInfo方法时出错：" + e.getMessage();
			log.error(errorMessage);
			request.setAttribute("errorMessage",errorMessage);
			return ERROR;
		}finally{
			baseInfoBean = new BaseInfoBean();
		}
		return "updatesuccess";
	}
	
	/**
	 * @author Liu Hanpeng Dec 6, 2012
	 * @return String
	 * @Description Generate Report
	 */
	public String generateReport(){
		ReportBean reportBean = new ReportBean();
		HttpSession session = request.getSession();
		List<BaseInfoBean> baseInfoList=null;
		try{
			String reportType = request.getParameter("reportType");
			String reportId = request.getParameter("reportId");
			reportBean = baseInfoService.getReportInfo(reportId);
			HashMap map = new HashMap();
			map.put("PageTitle", "历史数据报表");
			baseInfoBean = getBaseInfoBean();		
			baseInfoList = baseInfoService.queryAll(baseInfoBean);
			reportBean.setReportType(reportType);
			reportBean.setList(baseInfoList);
			reportBean.setMap(map);
			reportBean.setRealPath(session.getServletContext().getRealPath("/"));
			reportService.createReport(reportBean,response);
		}catch(Exception e){
			outPrintErrorMessage(e);
			return ERROR;
		}
		return NONE;
	}
	
	/**
	 * @author Liu Hanpeng Dec 17, 2012
	 * @param e 
	 * @Description out pring error message
	 */
	public void outPrintErrorMessage(Exception e){
		StackTraceElement[] st = e.getStackTrace();
		for (StackTraceElement stackTraceElement : st) {
			String exclass = stackTraceElement.getClassName();
			String method = stackTraceElement.getMethodName();
			log.error("[" + exclass + "]调用"+method +"时在第" + stackTraceElement.getLineNumber()
			+ "行代码处发生异常!异常类型:" + e.getClass().getName());
			}
	}
}