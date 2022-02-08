package com.controller;

import com.model.Boss;
import com.model.Tadmin;
import com.service.BossService;
import com.util.PageBean;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 招聘者Controller业务控制类
 */
@Controller
public class BossController {
	/**
	 * 注入Service
	 */
	@Autowired
	private BossService bossService;

	/**
	 * 招聘者列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_list")
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
		Boss boss = new Boss();
		
		String name = request.getParameter("name");
		boss.setName(name);
		request.setAttribute("name", name);
		// 查询记录总数
		counts = bossService.getCount(boss);
		// 获取当前页记录
		List bossList = bossService.queryBossList(boss, page);
		request.setAttribute("list", bossList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/boss/boss_list.jsp";
	}

	/**
	 * 跳转到新增招聘者界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/boss/boss_add.jsp";
	}

	/**
	 * 保存新增招聘者
	 * 
	 * @param boss
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_add")
	public String add(Boss boss, HttpServletRequest request) throws Exception {
		// 保存到数据库
		bossService.insertBoss(boss);
		return "redirect:boss_list.action";
	}

	/**
	 * 跳转到更新招聘者界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Boss boss = bossService.queryBossById(id);
		request.setAttribute("boss", boss);
		return "/admin/boss/boss_update.jsp";
	}

	/**
	 * 更新招聘者
	 * 
	 * @param boss
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_update")
	public String update(Boss boss, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		bossService.updateBoss(boss);
		return "redirect:boss_list.action";
	}

	/**
	 * 删除招聘者
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		bossService.deleteBoss(id);
		return "redirect:boss_list.action";
	}

	/**
	 * 查看招聘者详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Boss boss = bossService.queryBossById(id);
		request.setAttribute("boss", boss);
		return "/admin/boss/boss_view.jsp";
	}

	/**
	 * 判断账号是否存在
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/boss_unameExist")
	public String unameExist(HttpServletRequest request) throws Exception {
		String exist = "true";
		String uname = request.getParameter("uname");
		Boss boss = new Boss();
		boss.setUname(uname);
		List list = bossService.queryBossList(boss, null);
		if (list != null && list.size() > 0) {
			exist = "false"; // 验证插件需要返回false 返回false时验证提示已存在
		}
		return exist;
	}
	
	
	/**
	 * 更新boss密码
	 * 
	 * @param boss
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_upwd")
	public String upwd(HttpServletRequest request) throws Exception {
		String upwd = request.getParameter("upwd");
		Boss boss = (Boss) request.getSession().getAttribute("boss");
		boss.setUpwd(upwd);
		bossService.updateBoss(boss);
		request.getSession().setAttribute("boss", boss);
		request.setAttribute("message", "操作成功");
		request.setAttribute("path", "/admin/boss/boss_upwd.jsp");
		return "/common/succeed.jsp";
	}
	
	/**
	 * 更新招聘者
	 * 
	 * @param boss
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/boss_info")
	public String info(Boss boss, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		bossService.updateBoss(boss);
		request.getSession().setAttribute("boss", boss);
		request.setAttribute("message", "操作成功");
		request.setAttribute("path", "/admin/boss/boss_info.jsp");
		return "/common/succeed.jsp";
	}
}
