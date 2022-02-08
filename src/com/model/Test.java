package com.model;

/**
 * 测试题Model类
 */
public class Test {
	public Test() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 习题
	 */
	private Integer xtid;
	/**
	 * 问题
	 */
	private String content;
	/**
	 * 选项1
	 */
	private String option1;
	/**
	 * 选项2
	 */
	private String option2;
	/**
	 * 选项3
	 */
	private String option3;
	/**
	 * 选项4
	 */
	private String option4;
	/**
	 * 答案
	 */
	private String okey;
	/**
	 * 得分
	 */
	private Integer score;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getXtid() {
		return this.xtid;
	}

	public void setXtid(Integer xtid) {
		this.xtid = xtid;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOption1() {
		return this.option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return this.option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return this.option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return this.option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getOkey() {
		return this.okey;
	}

	public void setOkey(String okey) {
		this.okey = okey;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}
}
