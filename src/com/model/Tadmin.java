package com.model;

/**
 * 管理员信息Model类
 */
public class Tadmin {
	public Tadmin() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 用户名
	 */
	private String uname;
	/**
	 * 密码
	 */
	private String upwd;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 联系电话
	 */
	private String tel;
	/**
	 * 用户类型
	 */
	private String utype;

	public String getUtype() {
		return utype;
	}

	public void setUtype(String utype) {
		this.utype = utype;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return this.upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
}
