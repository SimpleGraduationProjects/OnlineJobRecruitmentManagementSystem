package com.model;
/**
*  企业介绍Model类
*/
public class Company
{
	public Company(){
	}
	    /**
    * id
    */
	private Integer id;
            /**
    * 企业名称
    */
	private String name;
            /**
    * 视频介绍
    */
	private String shipin;
            /**
    * 企业介绍
    */
	private String miaoshu;
        	public Integer getId(){
		return this.id;
	}
	public void setId(Integer id){
		this.id = id;
	}
        	public String getName(){
		return this.name;
	}
	public void setName(String name){
		this.name = name;
	}
        	public String getShipin(){
		return this.shipin;
	}
	public void setShipin(String shipin){
		this.shipin = shipin;
	}
        	public String getMiaoshu(){
		return this.miaoshu;
	}
	public void setMiaoshu(String miaoshu){
		this.miaoshu = miaoshu;
	}
}
