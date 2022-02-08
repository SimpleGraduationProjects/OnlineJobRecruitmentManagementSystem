package com.model;

/**
 * 面试offerModel类
 */
public class Offer {
	public Offer() {
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
	 * 招聘信息
	 */
	private Integer jobid;
	/**
	 * 状态
	 */
	private String zt;
	/**
	 * 回复内容
	 */
	private String content;
	
	private String fav="否";
	
	
	private String cdate;
	/**
	 * 面试结果
	 */
	private String jieguo;
	private User userVO;
	private Job jobVO;

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

	public String getZt() {
		return this.zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getJieguo() {
		return this.jieguo;
	}

	public void setJieguo(String jieguo) {
		this.jieguo = jieguo;
	}

	public User getUserVO() {
		return this.userVO;
	}

	public void setUserVO(User userVO) {
		this.userVO = userVO;
	}

	

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public Integer getJobid() {
		return jobid;
	}

	public void setJobid(Integer jobid) {
		this.jobid = jobid;
	}

	public Job getJobVO() {
		return jobVO;
	}

	public void setJobVO(Job jobVO) {
		this.jobVO = jobVO;
	}

	public String getFav() {
		return fav;
	}

	public void setFav(String fav) {
		this.fav = fav;
	}
	
	
}
