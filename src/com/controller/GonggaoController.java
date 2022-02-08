package com.controller;

import com.model.Gonggao;
import com.service.GonggaoService;
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

/**
 * 资讯Controller业务控制类
 */
@Controller
public class GonggaoController {
	/**
	 * 注入Service
	 */
	@Autowired
	private GonggaoService gonggaoService;

	/**
	 * 资讯列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_list")
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
		Gonggao gonggao = new Gonggao();
		String name = request.getParameter("name");
		gonggao.setName(name);
		request.setAttribute("name", name);
		String gtype = request.getParameter("gtype");
		gonggao.setGtype(gtype);
		request.setAttribute("gtype", gtype);
		// 查询记录总数
		counts = gonggaoService.getCount(gonggao);
		// 获取当前页记录
		List gonggaoList = gonggaoService.queryGonggaoList(gonggao, page);
		request.setAttribute("list", gonggaoList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/gonggao/gonggao_list.jsp";
	}

	/**
	 * 跳转到新增资讯界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/gonggao/gonggao_add.jsp";
	}

	/**
	 * 保存新增资讯
	 * 
	 * @param gonggao
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_add")
	public String add(Gonggao gonggao, HttpServletRequest request)
			throws Exception {
		gonggao.setCdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		.format(new Date()));
		// 保存到数据库
		gonggaoService.insertGonggao(gonggao);
		return "redirect:gonggao_list.action";
	}

	/**
	 * 跳转到更新资讯界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Gonggao gonggao = gonggaoService.queryGonggaoById(id);
		request.setAttribute("gonggao", gonggao);
		return "/admin/gonggao/gonggao_update.jsp";
	}

	/**
	 * 更新资讯
	 * 
	 * @param gonggao
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_update")
	public String update(Gonggao gonggao, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		gonggaoService.updateGonggao(gonggao);
		return "redirect:gonggao_list.action";
	}

	/**
	 * 删除资讯
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		gonggaoService.deleteGonggao(id);
		return "redirect:gonggao_list.action";
	}

	
	
	/*************************************** web 前端 *********************************************/
	
	/**
	 * 查看资讯详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Gonggao gonggao = gonggaoService.queryGonggaoById(id);
		request.setAttribute("gonggao", gonggao);
		return "/web/gonggao/gonggao_view.jsp";
	}
	
	
	
	/**
	 * 资讯列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/gonggao_list_web")
	public String gg_list_web(HttpServletRequest request) throws Exception {
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
		Gonggao gonggao = new Gonggao();
		String name = request.getParameter("name");
		gonggao.setName(name);
		request.setAttribute("name", name);
		String gtype = request.getParameter("gtype");
		gonggao.setGtype(gtype);
		request.setAttribute("gtype", gtype);
		// 查询记录总数
		counts = gonggaoService.getCount(gonggao);
		// 获取当前页记录
		List gonggaoList = gonggaoService.queryGonggaoList(gonggao, page);
		request.setAttribute("list", gonggaoList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		
		request.getSession().setAttribute("top_index", 4);
		return "/web/gonggao/gonggao_list.jsp";
	}
}
