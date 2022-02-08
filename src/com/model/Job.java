package com.model;

import org.apache.commons.lang3.StringUtils;

/**
 * 招聘Model类
 */
public class Job {
	public Job() {
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
	 * 职位
	 */
	private Integer catelogid;
	/**
	 * 标题
	 */
	private String name;
	/**
	 * 最小薪资
	 */
	private Integer minsalary;
	/**
	 * 最大薪资
	 */
	private Integer maxsalary;
	/**
	 * 工作地址
	 */
	private String address;
	/**
	 * 工作区域
	 */
	private String quyu;
	/**
	 * 要求学历
	 */
	private String xueli;
	/**
	 * 工作经验
	 */
	private String jingyan;
	/**
	 * 公司福利
	 */
	private String fuli;
	//公司福利数组
	private String[] fuliArray;
	/**
	 * 职位描述
	 */
	private String miaoshu;
	/**
	 * 发布时间
	 */
	private String cdate;
	/**
	 * 状态
	 */
	private String zt;
	private Boss bossVO;
	private Catelog catelogVO;
	/** 薪资区间查询*/
	private Integer xinzIndex;
	

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

	public Integer getCatelogid() {
		return this.catelogid;
	}

	public void setCatelogid(Integer catelogid) {
		this.catelogid = catelogid;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getMinsalary() {
		return this.minsalary;
	}

	public void setMinsalary(Integer minsalary) {
		this.minsalary = minsalary;
	}

	public Integer getMaxsalary() {
		return this.maxsalary;
	}

	public void setMaxsalary(Integer maxsalary) {
		this.maxsalary = maxsalary;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getQuyu() {
		return this.quyu;
	}

	public void setQuyu(String quyu) {
		this.quyu = quyu;
	}

	public String getXueli() {
		return this.xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	public String getJingyan() {
		return this.jingyan;
	}

	public void setJingyan(String jingyan) {
		this.jingyan = jingyan;
	}

	public String getFuli() {
		return this.fuli;
	}

	public void setFuli(String fuli) {
		this.fuli = fuli;
	}

	public String getMiaoshu() {
		return this.miaoshu;
	}

	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}

	public String getCdate() {
		return this.cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getZt() {
		return this.zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public Boss getBossVO() {
		return this.bossVO;
	}

	public void setBossVO(Boss bossVO) {
		this.bossVO = bossVO;
	}

	public Catelog getCatelogVO() {
		return this.catelogVO;
	}

	public void setCatelogVO(Catelog catelogVO) {
		this.catelogVO = catelogVO;
	}

	public String[] getFuliArray() {
		if(StringUtils.isNotBlank(fuli)){
			String str = fuli.replace(",", "，");
			fuliArray = str.split("，");
		}
		
		return fuliArray;
	}
	public void setFuliArray(String[] fuliArray) {
		this.fuliArray = fuliArray;
	}

	public Integer getXinzIndex() {
		return xinzIndex;
	}

	public void setXinzIndex(Integer xinzIndex) {
		this.xinzIndex = xinzIndex;
	}
	
	
}
