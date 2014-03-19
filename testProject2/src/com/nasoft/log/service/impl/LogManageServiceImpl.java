package com.nasoft.log.service.impl;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;

import com.nasoft.log.model.LogBean;
import com.nasoft.log.persistence.iface.ILogManageDao;
import com.nasoft.sysmanage.model.UserLoginBean;

@Aspect
public class LogManageServiceImpl {
	
	private ILogManageDao logManageDao;
	/**
	 * @param logManageDao the logManageDao to set
	 */
	public void setLogManageDao(ILogManageDao logManageDao) {
		this.logManageDao = logManageDao;
	}
	
	@After("execution(* com.nasoft.baseinfo.service.impl.*.delete*(..))||execution(* com.nasoft.sysmanage.service.impl.*.delete*(..))")
	public void deleteAfter(JoinPoint j) {
		
		LogBean logBean = new LogBean();
		logBean.setLogType("delete");
		UserLoginBean userInfoBean = (UserLoginBean) ServletActionContext.getRequest().getSession().getAttribute("userlogin");
		logBean.setLogOper(userInfoBean.getUsername());
		String logMessage= getLogMessage(j.getArgs(),j.getSignature().getName().toString(),j.getSignature().getDeclaringTypeName().toString());
		logBean.setLogMessage(logMessage);
		logManageDao.addLogInfo(logBean);
	}
	
	@After("execution(* com.nasoft.baseinfo.service.impl.*.update*(..))||execution(* com.nasoft.sysmanage.service.impl.*.update*(..))")
	public void updateAfter(JoinPoint j) {
		
		LogBean logBean = new LogBean();
		logBean.setLogType("update");
		UserLoginBean userInfoBean = (UserLoginBean) ServletActionContext.getRequest().getSession().getAttribute("userlogin");
		logBean.setLogOper(userInfoBean.getUsername());
		String logMessage= getLogMessage(j.getArgs(),j.getSignature().getName().toString(),j.getSignature().getDeclaringTypeName().toString());
		logBean.setLogMessage(logMessage);
		logManageDao.addLogInfo(logBean);
	}
	
	@After("execution(* com.nasoft.baseinfo.service.impl.*.add*(..))||execution(* com.nasoft.sysmanage.service.impl.*.add*(..))")
	public void addAfter(JoinPoint j) {
		
		LogBean logBean = new LogBean();
		logBean.setLogType("insert");
		UserLoginBean userInfoBean = (UserLoginBean) ServletActionContext.getRequest().getSession().getAttribute("userlogin");
		logBean.setLogOper(userInfoBean.getUsername());
		String logMessage= getLogMessage(j.getArgs(),j.getSignature().getName().toString(),j.getSignature().getDeclaringTypeName().toString());
		logBean.setLogMessage(logMessage.toString());
		logManageDao.addLogInfo(logBean);
	}
	
	public String getLogMessage(Object obj[],String methodName,String className){
		StringBuffer logMessage = new StringBuffer("Class:");
		logMessage.append(className);
		logMessage.append("--Method:");
		logMessage.append(methodName);
		int i =1;
		for(Object o : obj){
			logMessage.append("--Args");
			logMessage.append(i++);
			logMessage.append(":");
			logMessage.append(o.toString());
		}
		return logMessage.toString();
	}
}
