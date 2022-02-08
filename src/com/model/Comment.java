package com.model;

/**
 * 评论Model类
 */
public class Comment {
	public Comment() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 应聘者
	 */
	private Integer uid;
	/**
	 * 招聘公司
	 */
	private Integer bid;
	/**
	 * 评论内容
	 */
	private String content;
	/**
	 * 评论时间
	 */
	private String cdate;
	private User userVO;
	private Boss bossVO;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return this.uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Boss getBossVO() {
		return this.bossVO;
	}

	public void setBossVO(Boss bossVO) {
		this.bossVO = bossVO;
	}
}
