package com.nasoft.sysmanage.model;

import java.io.Serializable;

/**
 * 创建人: 陈 凯 修改时间: 2009-03-22
 * 
 * 模块（类）说明： 短消息
 * 
 */
public class ShotMessage implements Serializable{

	private static final long serialVersionUID = 1L;
	private long msgId;
	private int sendBy;
	private int receiveBy;
	private String sendDate;
	private String receiveDate;
	private String msgTitle;
	private String msgContent;
	private int msgState;
	private String companyCode;
	
	public long getMsgId() {
		return msgId;
	}
	public void setMsgId(long msgId) {
		this.msgId = msgId;
	}
	public int getSendBy() {
		return sendBy;
	}
	public void setSendBy(int sendBy) {
		this.sendBy = sendBy;
	}
	public int getReceiveBy() {
		return receiveBy;
	}
	public void setReceiveBy(int receiveBy) {
		this.receiveBy = receiveBy;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getReceiveDate() {
		return receiveDate;
	}
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public int getMsgState() {
		return msgState;
	}
	public void setMsgState(int msgState) {
		this.msgState = msgState;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
}
