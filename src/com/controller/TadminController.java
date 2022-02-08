package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Tadmin;
import com.service.TadminService;
import com.util.PageBean;

/**
 * 管理员信息Controller业务控制类
 */
@Controller
public class TadminController {
	/**
	 * 注入Service
	 */
	@Autowired
	private TadminService tadminService;

	/**
	 * 管理员信息列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_list")
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
		Tadmin tadmin = new Tadmin();
		String uname = request.getParameter("uname");
		tadmin.setUname(uname);
		request.setAttribute("uname", uname);
		String upwd = request.getParameter("upwd");
		tadmin.setUpwd(upwd);
		request.setAttribute("upwd", upwd);
		// 查询记录总数
		counts = tadminService.getCount(tadmin);
		// 获取当前页记录
		List tadminList = tadminService.queryTadminList(tadmin, page);
		request.setAttribute("list", tadminList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/tadmin/tadmin_list.jsp";
	}

	/**
	 * 跳转到新增管理员信息界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/tadmin/tadmin_add.jsp";
	}

	/**
	 * 保存新增管理员信息
	 * 
	 * @param tadmin
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_add")
	public String add(Tadmin tadmin, HttpServletRequest request)
			throws Exception {
		// 保存到数据库
		tadminService.insertTadmin(tadmin);
		return "redirect:tadmin_list.action";
	}

	/**
	 * 跳转到更新管理员信息界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Tadmin tadmin = tadminService.queryTadminById(id);
		request.setAttribute("tadmin", tadmin);
		return "/admin/tadmin/tadmin_update.jsp";
	}

	/**
	 * 更新管理员信息
	 * 
	 * @param tadmin
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_update")
	public String update(Tadmin tadmin, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		tadminService.updateTadmin(tadmin);
		return "redirect:tadmin_list.action";
	}

	/**
	 * 删除管理员信息
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		tadminService.deleteTadmin(id);
		return "redirect:tadmin_list.action";
	}

	/**
	 * 查看管理员信息详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Tadmin tadmin = tadminService.queryTadminById(id);
		request.setAttribute("tadmin", tadmin);
		return "/admin/tadmin/tadmin_view.jsp";
	}

	/**
	 * 判断用户名是否存在
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/tadmin_unameExist")
	public String unameExist(HttpServletRequest request) throws Exception {
		String exist = "true";
		String uname = request.getParameter("uname");
		Tadmin tadmin = new Tadmin();
		tadmin.setUname(uname);
		List list = tadminService.queryTadminList(tadmin, null);
		if (list != null && list.size() > 0) {
			exist = "false"; // 验证插件需要返回false 返回false时验证提示已存在
		}
		return exist;
	}

	/**
	 * 更新管理员密码
	 * 
	 * @param tadmin
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tadmin_upwd")
	public String upwd(HttpServletRequest request) throws Exception {
		String upwd = request.getParameter("upwd");
		Tadmin admin = (Tadmin) request.getSession().getAttribute("cuser");
		admin.setUpwd(upwd);
		tadminService.updateTadmin(admin);
		request.getSession().setAttribute("cuser", admin);
		return "/admin/tadmin/tadmin_upwd.jsp";
	}


}
