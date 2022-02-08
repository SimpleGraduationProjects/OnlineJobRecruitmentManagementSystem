package com.controller;

import com.model.Comment;
import com.service.CommentService;
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
import com.service.UserService;
import com.model.User;
import com.service.BossService;
import com.model.Boss;

/**
 * 评论Controller业务控制类
 */
@Controller
public class CommentController {
	/**
	 * 注入Service
	 */
	@Autowired
	private CommentService commentService;
	@Autowired
	private UserService userService;
	@Autowired
	private BossService bossService;

	/**
	 * 评论列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_list")
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
		Comment comment = new Comment();
		String uid = request.getParameter("uid");
		comment.setUid(Integer.parseInt(uid == null || "".equals(uid) ? "0"
				: uid));
		request.setAttribute("uid", uid);
		String bid = request.getParameter("bid");
		comment.setBid(Integer.parseInt(bid == null || "".equals(bid) ? "0"
				: bid));
		request.setAttribute("bid", bid);
		// 查询记录总数
		counts = commentService.getCount(comment);
		// 获取当前页记录
		List commentList = commentService.queryCommentList(comment, page);
		request.setAttribute("list", commentList);
		User userQuery = new User();
		List<User> userList = userService.queryUserList(userQuery, null);
		request.setAttribute("userList", userList);
		Boss bossQuery = new Boss();
		List<Boss> bossList = bossService.queryBossList(bossQuery, null);
		request.setAttribute("bossList", bossList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/comment/comment_list.jsp";
	}
	
	
	
	/**************************************************************************************/
	/**
	 * 评论列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_list_web")
	public String comment_list_web(HttpServletRequest request) throws Exception {
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
		Comment comment = new Comment();
		
		// 查询记录总数
		counts = commentService.getCount(comment);
		// 获取当前页记录
		List commentList = commentService.queryCommentList(comment, page);
		request.setAttribute("list", commentList);
		
		
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		
		request.getSession().setAttribute("top_index", 6);
		return "/web/comment/comment_list.jsp";
	}

	/**
	 * 跳转到新增评论界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		
		return "/admin/comment/comment_add.jsp";
	}

	/**
	 * 保存新增评论
	 * 
	 * @param comment
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_add")
	public String add(Comment comment, HttpServletRequest request)
			throws Exception {
		User user= (User) request.getSession().getAttribute("user");
		comment.setCdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		comment.setUid(user.getId());
		// 保存到数据库
		commentService.insertComment(comment);
		return "redirect:comment_list_web.action";
	}

	/**
	 * 跳转到更新评论界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Comment comment = commentService.queryCommentById(id);
		request.setAttribute("comment", comment);
		User user = new User();
		List<User> userList = userService.queryUserList(user, null);
		request.setAttribute("userList", userList);
		Boss boss = new Boss();
		List<Boss> bossList = bossService.queryBossList(boss, null);
		request.setAttribute("bossList", bossList);
		return "/admin/comment/comment_update.jsp";
	}

	/**
	 * 更新评论
	 * 
	 * @param comment
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_update")
	public String update(Comment comment, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		commentService.updateComment(comment);
		return "redirect:comment_list.action";
	}

	/**
	 * 删除评论
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		commentService.deleteComment(id);
		return "redirect:comment_list.action";
	}

	/**
	 * 查看评论详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Comment comment = new Comment();
		comment.setId(id);
		List<Comment> list = commentService.queryCommentList(comment, null);
		comment = list.get(0);
		request.setAttribute("comment", comment);
		return "/admin/comment/comment_view.jsp";
	}
}
