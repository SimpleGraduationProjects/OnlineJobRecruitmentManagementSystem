package com.service;
import java.util.List;
import com.model.Company;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.CompanyMapper;
/**
* 企业介绍Service实现类
*/
@Service
public class CompanyServiceImpl implements CompanyService
{
	/**
	* 注入mapper
	*/
    @Autowired
	private CompanyMapper companyMapper;
	/**
	* 查询企业介绍记录数
	* @param company
	* @return
	*/
	public int getCount(Company company) {
		Map<String, Object> map =getQueryMap(company,null);
		return companyMapper.getCount(map);
	}
	/**
	* 查询所有企业介绍
	* @return
	*/
	public List<Company> queryCompanyList(Company company,PageBean page) throws Exception {
		Map<String, Object> map =getQueryMap(company,page);
		List<Company> list = companyMapper.query(map);
	    return list;
	}
	/**
	* 封装查询条件
	* @param company
	* @param page
	* @return
	*/
	private Map<String, Object> getQueryMap(Company company,PageBean page){
		Map<String, Object> map = new HashMap<String, Object>();
		if(company!=null){
		    map.put("id", company.getId());
            		}
		if(page!=null) {
		    PageBean.setPageMap(map, page);
		}
		return map;
	}
	/**
	* 保存企业介绍
	* @param company
	* @return
	*/
	public int insertCompany(Company company) throws Exception {
		return companyMapper.insertCompany(company);
	}
	/**
	* 删除企业介绍
	* @param id
	* @return
	*/
	public int deleteCompany(int id) throws Exception {
		return companyMapper.deleteCompany(id);
	}
	/**
	* 更新企业介绍
	* @param company
	* @return
	*/
	public int updateCompany(Company company) throws Exception {
		return companyMapper.updateCompany(company);
	}
	/**
	* 根据ID查询记录
	* @param id
	* @return
	*/
	public Company queryCompanyById(int id) throws Exception {
		return companyMapper.queryCompanyById(id);
	}
}
