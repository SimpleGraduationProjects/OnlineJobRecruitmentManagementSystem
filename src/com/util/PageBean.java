package com.util;

import java.util.Map;

/**
 * 分页参数
 * 
 * @author Administrator
 * 
 */
public class PageBean {
	public static int PAGE_IETM = 10;
	/**
	 * 每页的记录条数
	 */
	private int pageSize = PAGE_IETM;
	/**
	 * 当前页
	 */
	private int currentPage = 1;
	/**
	 * 记录总数
	 */
	private int totalCount;
	/**
	 * 记录偏移量
	 */
	private int offset;

	public static void setPageMap(Map<String, Object> map, PageBean page) {
		if (page != null) {
			map.put("page", true);
			map.put("offset", page.getOffset());
			map.put("pageSize", page.getPageSize());
		}
	}

	public PageBean() {
	}

	public PageBean(int offset) {
		super();
		this.offset = offset;
	}

	public PageBean(int offset, int pageSize) {
		super();
		this.offset = offset;
		this.pageSize = pageSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

}
