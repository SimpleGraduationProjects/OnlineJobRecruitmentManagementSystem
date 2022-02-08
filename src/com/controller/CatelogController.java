package com.controller;

import com.model.Catelog;
import com.service.CatelogService;
import com.util.PageBean;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 职位类别Controller业务控制类
 */
@Controller
public class CatelogController {
	/**
	 * 注入Service
	 */
	@Autowired
	private CatelogService catelogService;

	/**
	 * 职位类别列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_list")
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
		Catelog catelog = new Catelog();
		String name = request.getParameter("name");
		catelog.setName(name);
		request.setAttribute("name", name);
		// 查询记录总数
		counts = catelogService.getCount(catelog);
		// 获取当前页记录
		List catelogList = catelogService.queryCatelogList(catelog, page);
		request.setAttribute("list", catelogList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/catelog/catelog_list.jsp";
	}

	/**
	 * 跳转到新增职位类别界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/catelog/catelog_add.jsp";
	}

	/**
	 * 保存新增职位类别
	 * 
	 * @param catelog
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_add")
	public String add(Catelog catelog, HttpServletRequest request)
			throws Exception {
		// 保存到数据库
		catelogService.insertCatelog(catelog);
		return "redirect:catelog_list.action";
	}

	/**
	 * 跳转到更新职位类别界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Catelog catelog = catelogService.queryCatelogById(id);
		request.setAttribute("catelog", catelog);
		return "/admin/catelog/catelog_update.jsp";
	}

	/**
	 * 更新职位类别
	 * 
	 * @param catelog
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_update")
	public String update(Catelog catelog, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		catelogService.updateCatelog(catelog);
		return "redirect:catelog_list.action";
	}

	/**
	 * 删除职位类别
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		catelogService.deleteCatelog(id);
		return "redirect:catelog_list.action";
	}

	/**
	 * 查看职位类别详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/catelog_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Catelog catelog = catelogService.queryCatelogById(id);
		request.setAttribute("catelog", catelog);
		return "/admin/catelog/catelog_view.jsp";
	}
}
