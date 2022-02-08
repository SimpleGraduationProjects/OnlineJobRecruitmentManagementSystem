package com.model;

/**
 * 收藏Model类
 */
public class Fav {
	public Fav() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 招聘者
	 */
	private Integer bid;
	/**
	 * 简历
	 */
	private Integer uid;
	/**
	 * 收藏时间
	 */
	private String cdate;
	private User userVO;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getCdate() {
		return this.cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public User getUserVO() {
		return this.userVO;
	}

	public void setUserVO(User userVO) {
		this.userVO = userVO;
	}
}
