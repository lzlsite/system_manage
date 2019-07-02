package com.lzl.common;

import java.util.List;

/**
 * 
 * @author: lzl
 * @Date: 2018年10月30日下午9:46:31
 * @Description:分页实体类
 */

public class PageBean {
	
	private int pageSize = 10;// 页的大小
	private int pageNum = 1;// 当前页
	private int total=0;//总记录数
	private int totalPage = 0;// 总页数，和bootstrap table插件无关
	private int start = 0;// 起始位置
	private List rows;// 结果集
	private String url="";//url,和bootstrap table插件无关

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPage() {
		 int pageCount=0;
		 //判断是否正好一页total/pageSize
		 if(total%pageSize==0){
			 pageCount=total/pageSize;
		 }else{
			 //如果有余数那么需要加1页 total/pageSize+1
			 pageCount=total/pageSize+1;
		 }
		 totalPage=pageCount;
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStart() {
		start=(pageNum-1)*pageSize;
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	
	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "pageBean [pageSize=" + pageSize + ", pageNum=" + pageNum + ", total=" + total + ", totalPage="
				+ totalPage + ", start=" + start + ", rows=" + rows + ", url=" + url + "]";
	}
	
	

}
