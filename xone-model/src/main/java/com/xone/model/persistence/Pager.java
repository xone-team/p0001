/**
 * Pager.java
 *
 * Copyright 2008-2011 Shanghai Everelegance Technologies Co.,Ltd. All rights reserved. 
 *  
 * Created date: 2011-4-8
 *
 */
package com.xone.model.persistence;

import com.xone.model.utils.Constants;

/**
 * @author Hunny
 * @created 2011-4-8 下午10:56:49
 * @version 1.0.0
 * @sinace 1.0.0 
 * @modify
 * 
 */
public class Pager {
	
	private int total = 0; //总共记录数
	private int count = Constants.NUM_PER_PAGE; //每页记录数
	private int start = 0; //起始记录数
	private int totalPage = 0; //总共页数
	
	public int getLastPage() {
		return this.totalPage;
	}
	
	public int getFirst() {
		return 1;
	}
	
	public int getLast() {
		return totalPage;
	}
	
	public int getNext() {
		if (start + count >= total) {
			return 0;
		}
		return start + count;
	}
	
	public int getPrevious() {
		if (start - count < 0) {
			return 0;
		}
		return start - count;
	}
	
	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	/**
	 * @return the count
	 */
	public int getCount() {
		return count;
	}
	/**
	 * @param count the count to set
	 */
	public void setCount(int count) {
		this.count = count;
	}
	/**
	 * @return the start
	 */
	public int getStart() {
		return start;
	}
	/**
	 * @param start the start to set
	 */
	public void setStart(int start) {
		this.start = start;
	}
	
	/**
	 * @return the totalPage
	 */
	public int getTotalPage() {
		return this.totalPage = total / count + (total % count == 0 ? 0 : 1);
	}
	
	/**
	 * return the current page
	 * @return
	 */
	public int getCurrentPage() {
		return start / count + 1;
	}
	
}

