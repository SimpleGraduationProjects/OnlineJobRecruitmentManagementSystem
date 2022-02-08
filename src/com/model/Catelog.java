package com.model;

/**
 * 职位类别Model类
 */
public class Catelog {
	public Catelog() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 职位类别
	 */
	private String name;
	/**
	 * 描述
	 */
	private String miaoshu;

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
}
