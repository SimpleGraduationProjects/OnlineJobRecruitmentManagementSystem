package com.service;
import java.util.List;
import com.util.PageBean;
import com.model.Company;
/**
*  企业介绍Service接口
*/
public interface CompanyService
{
	/**
	* 查询企业介绍记录数
	* @param company
	* @return
	*/
	public int getCount(Company company);
	/**
	* 查询所有企业介绍
	* @return
	*/
    public List<Company> queryCompanyList(Company company, PageBean page) throws Exception;
	/**
	* 保存企业介绍
	* @param company
	* @return
	*/
	public int insertCompany(Company company) throws Exception ;
	/**
	* 删除企业介绍
	* @param id
	* @return
	*/
	public int deleteCompany(int id) throws Exception ;
	/**
	* 更新企业介绍
	* @param company
	* @return
	*/
	public int updateCompany(Company company) throws Exception ;
	/**
	* 根据ID查询记录
	* @param id
	* @return
	*/
	public Company queryCompanyById(int id) throws Exception ;
}
