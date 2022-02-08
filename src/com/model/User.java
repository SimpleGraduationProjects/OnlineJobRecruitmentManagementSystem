package com.model;

/**
 * 应聘人员Model类
 */
public class User {
	public User() {
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
	 * 性别
	 */
	private String sex;
	/**
	 * 联系电话
	 */
	private String tel;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 出生日期
	 */
	private String birthday;
	/**
	 * 照片
	 */
	private String photo;
	/**
	 * 学历
	 */
	private String xueli;
	/**
	 * 期望职位
	 */
	private Integer catelogid;
	/**
	 * 薪资要求
	 */
	private String xinzi;
	/**
	 * 工作经验
	 */
	private String gzjy;
	/**
	 * 工作经历
	 */
	private String gzjl;
	/**
	 * 毕业学校
	 */
	private String school;
	/**
	 * 专业
	 */
	private String zhuanye;
	/**
	 * 在校时间
	 */
	private String sdate;
	/**
	 * 求职状态
	 */
	private String zt;
	/**
	 * 个人优势
	 */
	private String youdian;
	
	/**
	 * 简历是否完善
	 */
	private Integer state;
	private Catelog catelogVO;

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

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getXueli() {
		return this.xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	public Integer getCatelogid() {
		return this.catelogid;
	}

	public void setCatelogid(Integer catelogid) {
		this.catelogid = catelogid;
	}

	public String getXinzi() {
		return this.xinzi;
	}

	public void setXinzi(String xinzi) {
		this.xinzi = xinzi;
	}

	public String getGzjy() {
		return this.gzjy;
	}

	public void setGzjy(String gzjy) {
		this.gzjy = gzjy;
	}

	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getZhuanye() {
		return this.zhuanye;
	}

	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}

	public String getSdate() {
		return this.sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getZt() {
		return this.zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getYoudian() {
		return this.youdian;
	}

	public void setYoudian(String youdian) {
		this.youdian = youdian;
	}

	public Catelog getCatelogVO() {
		return this.catelogVO;
	}

	public void setCatelogVO(Catelog catelogVO) {
		this.catelogVO = catelogVO;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getGzjl() {
		return gzjl;
	}

	public void setGzjl(String gzjl) {
		this.gzjl = gzjl;
	}
	
	
}
