package com.controller;

import com.model.Company;
import com.service.CompanyService;
import com.util.PageBean;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 企业介绍Controller业务控制类
 */
@Controller
public class CompanyController {

	/**
	 * 注入Service
	 */
	@Autowired
	private CompanyService companyService;



	/**
	 * 跳转到新增企业介绍界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/company_toInfo")
	public String toInfo(HttpServletRequest request) throws Exception {
	    Company company = new Company();
		//获取当前页记录
		List<Company> companyList=companyService.queryCompanyList(company,null);
		if(companyList!=null&&companyList.size()>0){
			request.setAttribute("company", companyList.get(0));
		}

		return "/admin/company/company_info.jsp";
	}




	/**
	 * 更新企业介绍
	 * 
	 * @param company
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/company_info")
	public String info(Company company, HttpServletRequest request)
			throws Exception {
		if(company.getId()==null){
			companyService.insertCompany(company);
		}else{
			// 更新数据库
			companyService.updateCompany(company);
		}
		request.setAttribute("message","保存成功");
  		request.setAttribute("path","company_toInfo.action");
  		return "/common/succeed.jsp";
	}

	

	/**
	 * 查看企业介绍详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/company_toView")
	public String toView(HttpServletRequest request) throws Exception {
		Company company = new Company();
		//获取当前页记录
		List<Company> companyList=companyService.queryCompanyList(company,null);
		if(companyList!=null&&companyList.size()>0){
			request.setAttribute("company", companyList.get(0));
		}
		
		request.getSession().setAttribute("top_index", 5);
		return "/web/company/company_view.jsp";
	}
}
