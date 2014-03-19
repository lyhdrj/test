/**
 *
 **************************************************************
 * @Project     : PageBean.java
 * @date        : Nov 16, 2012 
 * @author      : Liu Hanpeng
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
package com.nasoft.sysmanage.model;


/**
 * @author Liu Hanpeng
 */
public class PageBean {

	//每页显示首记录
	private int firstResult=0;
	//当前页
	private int currentPage=1;
	//总记录条数
	private int totalCount;
	//总页数
	private int totalPage=0;
	//最大条数
	private int maxResult=10;
	//是否是首页
	private boolean isFirstPage=true;
	//是否是最后一页
	private boolean isLastPage=true;
	
	/**
	 * @return the firstResult
	 */
	public int getFirstResult() {
		return firstResult;
	}
	/**
	 * @param firstResult the firstResult to set
	 */
	public void setFirstResult(int firstResult) {
		this.firstResult = firstResult;
	}
	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * @return the totalCount
	 */
	public int getTotalCount() {
		return totalCount;
	}
	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return totalPage;
	}
	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	/**
	 * @return the maxResult
	 */
	public int getMaxResult() {
		return maxResult;
	}
	/**
	 * @param maxResult the maxResult to set
	 */
	public void setMaxResult(int maxResult) {
		this.maxResult = maxResult;
	}
	/**
	 * @return the isFirstPage
	 */
	public boolean getIsFirstPage() {
		return isFirstPage;
	}
	/**
	 * @param isFirstPage the isFirstPage to set
	 */
	public void setIsFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}
	/**
	 * @return the isLastPage
	 */
	public boolean getIsLastPage() {
		return isLastPage;
	}
	/**
	 * @param isLastPage the isLastPage to set
	 */
	public void setIsLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}
	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	/**
	 * @param totalCount the totalCount to set
	 */
	public void setTotalCount(int totalCount) {
		//通过总记录条数，设置总页数
		this.totalCount = totalCount;
		if(this.totalCount%this.maxResult==0){
			this.totalPage=this.totalCount/this.maxResult;
		}else{
			this.totalPage=this.totalCount/this.maxResult+1;
		}
		//通过当前页信息设置是否首页是否最后一页及每页显示首记录
		if(currentPage > totalPage&&totalPage != 0){
			currentPage = totalPage;
		}
		if(currentPage==1){
			isFirstPage=true;
		}else{
			isFirstPage=false;
		}
		if(currentPage==totalPage){
			isLastPage=true;
		}else{
			isLastPage=false;
		}
		if(totalPage == 1 || totalPage == 0){
			isFirstPage = true;
			isLastPage = true;
		}
		this.firstResult = (this.currentPage-1)*this.maxResult;
	}
}
