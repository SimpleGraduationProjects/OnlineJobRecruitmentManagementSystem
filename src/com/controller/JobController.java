package com.controller;

import com.model.Job;
import com.service.JobService;
import com.util.PageBean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.service.BossService;
import com.model.Boss;
import com.service.CatelogService;
import com.model.Catelog;

/**
 * 招聘Controller业务控制类
 */
@Controller
public class JobController {
	/**
	 * 注入Service
	 */
	@Autowired
	private JobService jobService;
	@Autowired
	private BossService bossService;
	@Autowired
	private CatelogService catelogService;

	/**
	 * 招聘列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_list")
	public String list(HttpServletRequest request) throws Exception {
		/**
		 * 获取分页参数
		 */
		int offset = 0; // 记录偏移量
		int counts = 0; // 总记录数
		try {
			offset = Integer.parseInt(request.getParameter("pager.offset"));
		} catch (Exception e) {
		}
		PageBean page = new PageBean(offset);
		Job job = new Job();
		int utype = Integer.parseInt(request.getSession().getAttribute("utype").toString());
		Boss  boss = null;
		if(utype==1){
			boss = (Boss) request.getSession().getAttribute("boss");
			job.setBid(boss.getId());
		}
		
		String catelogid = request.getParameter("catelogid");
		job.setCatelogid(Integer.parseInt(catelogid == null
				|| "".equals(catelogid) ? "0" : catelogid));
		request.setAttribute("catelogid", catelogid);
		String name = request.getParameter("name");
		job.setName(name);
		request.setAttribute("name", name);
		
		String quyu = request.getParameter("quyu");
		job.setQuyu(quyu);
		request.setAttribute("quyu", quyu);
		String xueli = request.getParameter("xueli");
		job.setXueli(xueli);
		request.setAttribute("xueli", xueli);
		// 查询记录总数
		counts = jobService.getCount(job);
		// 获取当前页记录
		List jobList = jobService.queryJobList(job, page);
		request.setAttribute("list", jobList);
		
		
		Catelog catelogQuery = new Catelog();
		List<Catelog> catelogList = catelogService.queryCatelogList(
				catelogQuery, null);
		request.setAttribute("catelogList", catelogList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/job/job_list.jsp";
	}

	/**
	 * 跳转到新增招聘界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		Boss boss = new Boss();
		List<Boss> bossList = bossService.queryBossList(boss, null);
		request.setAttribute("bossList", bossList);
		Catelog catelog = new Catelog();
		List<Catelog> catelogList = catelogService.queryCatelogList(catelog,
				null);
		request.setAttribute("catelogList", catelogList);
		return "/admin/job/job_add.jsp";
	}

	/**
	 * 保存新增招聘
	 * 
	 * @param job
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_add")
	public String add(Job job, HttpServletRequest request) throws Exception {
		Boss boss = (Boss) request.getSession().getAttribute("boss");
		job.setBid(boss.getId());
		job.setZt("1");
		// 保存到数据库
		job.setCdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		.format(new Date()));
		jobService.insertJob(job);
		return "redirect:job_list.action";
	}

	/**
	 * 跳转到更新招聘界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Job job = jobService.queryJobById(id);
		request.setAttribute("job", job);
		Boss boss = new Boss();
		List<Boss> bossList = bossService.queryBossList(boss, null);
		request.setAttribute("bossList", bossList);
		Catelog catelog = new Catelog();
		List<Catelog> catelogList = catelogService.queryCatelogList(catelog,
				null);
		request.setAttribute("catelogList", catelogList);
		return "/admin/job/job_update.jsp";
	}

	/**
	 * 更新招聘
	 * 
	 * @param job
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_update")
	public String update(Job job, HttpServletRequest request) throws Exception {
		// 更新数据库
		jobService.updateJob(job);
		return "redirect:job_list.action";
	}

	/**
	 * 删除招聘
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		jobService.deleteJob(id);
		return "redirect:job_list.action";
	}

	/**
	 * 查看招聘详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/job_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Job job = new Job();
		job.setId(id);
		List<Job> list = jobService.queryJobList(job, null);
		job = list.get(0);
		request.setAttribute("job", job);
		return "/admin/job/job_view.jsp";
	}
}
