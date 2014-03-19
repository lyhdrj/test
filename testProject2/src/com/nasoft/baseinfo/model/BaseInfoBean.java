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
package com.nasoft.baseinfo.model;

/**
 * @author Chi Kehan
 */
public class BaseInfoBean {
	private String rowno;
	private long id;
	private String ids;
	private String code;
	private String name;
	private String remark;
	/**
	 * @return the ids
	 */
	public String getIds() {
		return ids;
	}
	/**
	 * @param ids the ids to set
	 */
	public void setIds(String ids) {
		this.ids = ids;
	}
	/**
	 * @return the rowno
	 */
	public String getRowno() {
		return rowno;
	}
	/**
	 * @param rowno the rowno to set
	 */
	public void setRowno(String rowno) {
		this.rowno = rowno;
	}
	/**
	 * @return the id
	 */
	public long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}
	
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}
	/**
	 * @param remark the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
