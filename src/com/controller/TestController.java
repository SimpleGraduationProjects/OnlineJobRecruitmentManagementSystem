package com.controller;

import com.model.Test;
import com.service.TestService;
import com.util.PageBean;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 测试题Controller业务控制类
 */
@Controller
public class TestController {
	/**
	 * 注入Service
	 */
	@Autowired
	private TestService testService;

	/**
	 * 测试题列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_list")
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
		Test test = new Test();
		String xtid = request.getParameter("xtid");
		test.setXtid(Integer.parseInt(xtid == null || "".equals(xtid) ? "0"
				: xtid));
		request.setAttribute("xtid", xtid);
		// 查询记录总数
		counts = testService.getCount(test);
		// 获取当前页记录
		List testList = testService.queryTestList(test, page);
		request.setAttribute("list", testList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/test/test_list.jsp";
	}

	/**
	 * 跳转到新增测试题界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		return "/admin/test/test_add.jsp";
	}

	/**
	 * 保存新增测试题
	 * 
	 * @param test
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_add")
	public String add(Test test, HttpServletRequest request) throws Exception {
		// 保存到数据库
		testService.insertTest(test);
		return "redirect:test_list.action";
	}

	/**
	 * 跳转到更新测试题界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Test test = testService.queryTestById(id);
		request.setAttribute("test", test);
		return "/admin/test/test_update.jsp";
	}

	/**
	 * 更新测试题
	 * 
	 * @param test
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_update")
	public String update(Test test, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		testService.updateTest(test);
		return "redirect:test_list.action";
	}

	/**
	 * 删除测试题
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		testService.deleteTest(id);
		return "redirect:test_list.action";
	}

	/**
	 * 查看测试题详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Test test = testService.queryTestById(id);
		request.setAttribute("test", test);
		return "/admin/test/test_view.jsp";
	}
}
