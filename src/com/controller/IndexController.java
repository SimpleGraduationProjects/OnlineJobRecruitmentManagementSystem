package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.Boss;
import com.model.Catelog;
import com.model.Job;
import com.model.Offer;
import com.model.Score;
import com.model.Test;
import com.model.User;
import com.service.BossService;
import com.service.CatelogService;
import com.service.JobService;
import com.service.OfferService;
import com.service.TestService;
import com.util.PageBean;

/**
 * 记录榜Controller业务控制类
 */
@Controller
public class IndexController {
	/**
	 * 注入Service
	 */
	@Autowired
	private JobService jobService;
	/**
	 * 注入Service
	 */
	@Autowired
	private CatelogService catelogService;
	
	@Autowired
	private OfferService offerService;
	@Autowired
	private TestService testService;

	@Autowired
	private BossService bossService;
	

	@RequestMapping("/def")
	public String def( HttpServletRequest request) throws Exception {

		return "redirect:index.action";
	}
	
	
	/**
	 * 首页
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request) throws Exception {
		// 纪录榜信息查询最新的
		PageBean page = new PageBean(0);
		page.setPageSize(7);
		Job job = new Job();
		List<Job> list = jobService.queryJobList(job, page);
		request.setAttribute("list", list);
		request.getSession().setAttribute("top_index", 1);
		
		Catelog catelog = new Catelog();
		List<Catelog> catelogList = catelogService.queryCatelogList(catelog, null);
		request.getSession().setAttribute("catelogList", catelogList);
		return "/web/index.jsp";

	}

	
	/**
	 * 测试题列表
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_list_web")
	public String test_list_web(HttpServletRequest request) throws Exception {
		Test test = new Test();
		// 获取当前页记录
		List testList = testService.queryTestList(test, null);
		request.setAttribute("list", testList);
		request.getSession().setAttribute("top_index", 3);
		return "/web/test/test_list.jsp";
	}
	
	/**
	 * 保存新增答题关系
	 * 
	 * @param dati
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/dati_add")
	public String dati_add( HttpServletRequest request) throws Exception {
		return "redirect:test_list_web.action";
	}
	
	
	
	
	/**
	 * 招聘列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_list_web")
	public String job_list_web(HttpServletRequest request) throws Exception {
		
		Job job = new Job();
	
		String catelogid = request.getParameter("catelogid");
		job.setCatelogid(Integer.parseInt(catelogid == null
				|| "".equals(catelogid) ? "0" : catelogid));
		request.setAttribute("catelogid", catelogid);
		String name = request.getParameter("name");
		job.setName(name);
		request.setAttribute("name", name);
		String xinzIndex = request.getParameter("xinzIndex");
		job.setXinzIndex(Integer.parseInt(xinzIndex == null
				|| "".equals(xinzIndex) ? "0" : xinzIndex));
		request.setAttribute("xinzIndex", xinzIndex);
		String xueli = request.getParameter("xueli");
		job.setXueli(xueli);
		request.setAttribute("xueli", xueli);
		
		// 获取当前页记录
		List jobList = jobService.queryJobList(job, null);
		request.setAttribute("list", jobList);
		Boss bossQuery = new Boss();
		List<Boss> bossList = bossService.queryBossList(bossQuery, null);
		request.setAttribute("bossList", bossList);
		Catelog catelogQuery = new Catelog();
		List<Catelog> catelogList = catelogService.queryCatelogList(
				catelogQuery, null);
		request.setAttribute("catelogList", catelogList);
		
		
		request.getSession().setAttribute("top_index", 2);
		return "/web/job/job_list.jsp";
	}
	
	/**
	 * 查看招聘详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_toView_web")
	public String job_toView_web(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Job job = new Job();
		job.setId(id);
		List<Job> list = jobService.queryJobList(job, null);
		job = list.get(0);
		request.setAttribute("job", job);
		//是否投递
		if(request.getSession().getAttribute("user")!=null){
			Offer offer = new Offer();
			User user = (User) request.getSession().getAttribute("user");
			offer.setUid(user.getId());
			offer.setJobid(id);
			List<Offer> offerList = offerService.queryOfferList(offer, null);
			if(offerList!=null&&offerList.size()>0){
				request.setAttribute("is_offer", 1);
			}
		}
		
		
		return "/web/job/job_view.jsp";
	}
	
	//提交考卷
	@RequestMapping(value="/okTest")
	public String okTest(HttpServletRequest req) throws Exception{
		User user = (User) req.getSession().getAttribute("user");
		//获取页面上传的 参数信息，根据前端页面指定已'TM#'开头的参数为 提交试卷的答题信息
		Enumeration paraNames  = req.getParameterNames();
		ArrayList<String> paraNameList = new ArrayList<String>(); 
		while (paraNames.hasMoreElements()) { 
		     paraNameList.add((String) paraNames.nextElement()); 
		}
		
		int zongfen=0;
		int fenshu=0;
		int num =0;
		int zongshu = 0;
		String mydaans="";
		String okdaans="";
		
		for (int i = 0; i < paraNameList.size(); i++) { 
			String httpParamName =  paraNameList.get(i); 
			System.out.println(httpParamName+"YYYY");
			if(httpParamName.indexOf("TM#")>=0){
				zongshu +=1; 
				String httpParamName1 = httpParamName.split("#")[1];
				String daan = req.getParameter(httpParamName);//获取选中的值
				Test test = testService.queryTestById(Integer.parseInt(httpParamName1));
				zongfen+=test.getScore();
				String daan1=test.getOkey(); //查询正确答案
				if(daan.equalsIgnoreCase(daan1)){
					fenshu+=test.getScore();
					num +=1; 
				}
				okdaans = okdaans+daan1+",";
				mydaans = mydaans+daan+",";
			}
		} 
		if(StringUtils.isNotBlank(okdaans)){
			okdaans = okdaans.substring(0,okdaans.length()-1);
		}
		if(StringUtils.isNotBlank(mydaans)){
			mydaans = mydaans.substring(0,mydaans.length()-1);
		}
		
		
		
		//计算考试分数
		Score score = new Score();
		score.setZongfen(zongfen);
		score.setDefen(fenshu);
		score.setUid(user.getId());
		score.setOkdaan(okdaans);
		score.setMydaan(mydaans);
		score.setNum(num);
		score.setZongshu(zongshu);
		
		req.setAttribute("score", score);
		return "/web/test/testSucceed.jsp";
		
	}
}
