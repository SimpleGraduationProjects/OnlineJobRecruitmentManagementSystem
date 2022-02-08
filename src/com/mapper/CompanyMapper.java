package com.mapper;
import com.model.Company;
import java.util.List;
import java.util.Map;
public interface CompanyMapper
{
/**
* 查询所有企业介绍
* @return
*/
public List<Company> query(Map<String,Object> inputParam);
    /**
    * 查询企业介绍记录数
    * @param inputParam
    * @return
    */
    public int getCount(Map<String,Object> inputParam);
    /**
    * 保存企业介绍
    * @param company
    * @return
    */
    public int insertCompany(Company company);
    /**
    * 删除企业介绍
    * @param id
    * @return
    */
    public int deleteCompany(int id);
    /**
    * 更新企业介绍
    * @param company
    * @return
    */
    public int updateCompany(Company company);
    /**
    * 根据ID查询记录
    * @param id
    * @return
    */
    public Company queryCompanyById(int id);
}
