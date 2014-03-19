package com.nasoft.log.model;

public class LogBean {
	
	//日志标识
	private String logId;
	//操作类型
	private String logType;
	//日志信息
	private String logMessage;
	//操作人员
	private String logOper;
	//生成时间
	private String createDate;
	
	/**
	 * @return the logType
	 */
	public String getLogType() {
		return logType;
	}
	/**
	 * @param logType the logType to set
	 */
	public void setLogType(String logType) {
		this.logType = logType;
	}
	/**
	 * @return the logMessage
	 */
	public String getLogMessage() {
		return logMessage;
	}
	/**
	 * @param logMessage the logMessage to set
	 */
	public void setLogMessage(String logMessage) {
		this.logMessage = logMessage;
	}
	/**
	 * @return the logId
	 */
	public String getLogId() {
		return logId;
	}
	/**
	 * @param logId the logId to set
	 */
	public void setLogId(String logId) {
		this.logId = logId;
	}
	/**
	 * @return the logOper
	 */
	public String getLogOper() {
		return logOper;
	}
	/**
	 * @param logOper the logOper to set
	 */
	public void setLogOper(String logOper) {
		this.logOper = logOper;
	}
	/**
	 * @return the createDate
	 */
	public String getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}
