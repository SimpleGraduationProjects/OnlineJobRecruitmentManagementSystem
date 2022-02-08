package com.model;

/**
 * 资讯Model类
 */
public class Gonggao {
	public Gonggao() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 咨询标题
	 */
	private String name;
	/**
	 * 图片
	 */
	private String tupian;
	/**
	 * 简介
	 */
	private String jianjie;
	
	/**
	 * 描述
	 */
	private String miaoshu;
	/**
	 * 创建时间
	 */
	private String cdate;
	/**
	 * 资讯类型
	 */
	private String gtype;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getGtype() {
		return this.gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	public String getTupian() {
		return tupian;
	}

	public void setTupian(String tupian) {
		this.tupian = tupian;
	}

	public String getJianjie() {
		return jianjie;
	}

	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}
	
	
}
