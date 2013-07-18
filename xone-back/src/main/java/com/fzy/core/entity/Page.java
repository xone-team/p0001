package com.fzy.core.entity;


public class Page {
	public static final int DEFAULT_PAGE_SIZE = 10;
	public static final int DEFAULT_PAGE_NO = 1;
	public static final int DEFAULT_TOTAL_COUNT = 0;
	
	protected long pageNo;
	protected long pageSize;
	protected long totalCount;
	
	public Page() {
		this.pageNo = DEFAULT_PAGE_NO;
		this.pageSize = DEFAULT_PAGE_SIZE;
		this.totalCount = DEFAULT_TOTAL_COUNT;
	}
	public Page(long pageNo, long pageSize, long totalCount) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
	}
	public long getPageNo() {
		return pageNo;
	}
	public void setPageNo(long pageNo) {
		this.pageNo = pageNo;
	}
	public long getPageSize() {
		return pageSize;
	}
	public void setPageSize(long pageSize) {
		this.pageSize = pageSize;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	
}
