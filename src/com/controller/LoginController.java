package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Boss;
import com.model.Tadmin;
import com.model.User;
import com.service.BossService;
import com.service.TadminService;
import com.service.UserService;

/**
 * 登录Controller控制类
 */
@Controller
public class LoginController {
	/**
	 * 注入Service
	 */
	@Autowired
	private TadminService tadminService;
	@Autowired
	private UserService userService;
	@Autowired
	private BossService bossService;

	/**
	 * 用户/管理员登录
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/tadmin_login")
	public String login(HttpServletRequest request) throws Exception {
		String flag = "false";
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		int utype = Integer.parseInt(request.getParameter("utype"));

		if (utype == 0) {
			Tadmin tadmin = new Tadmin();
			tadmin.setUname(uname);
			tadmin.setUpwd(upwd);
			List<Tadmin> tadminList = tadminService.queryTadminList(tadmin,
					null);
			if (tadminList != null && tadminList.size() > 0) {
				Tadmin admin = tadminList.get(0);
				request.getSession().setAttribute("cuser", admin);
				flag = "true";
			}
		} else if (utype == 1) {
			Boss ser = new Boss();
			ser.setUname(uname);
			ser.setUpwd(upwd);
			List<Boss> bossList = bossService.queryBossList(ser, null);
			if (bossList != null && bossList.size() > 0) {
				Boss boss = bossList.get(0);
				request.getSession().setAttribute("boss", boss);
				flag = "true";
			}

		}
		request.getSession().setAttribute("utype", utype);
		return flag;
	}

	@RequestMapping(value = "/tadmin_loginout")
	public String loginout(HttpServletRequest request) throws Exception {
		
		request.getSession().setAttribute("cuser", null);
	
		request.getSession().setAttribute("boss", null);
		

		request.getSession().invalidate();
		return "/admin/login.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/user_login")
	public String user_login(HttpServletRequest request) throws Exception {
		String flag = "false";
		String uname = request.getParameter("uname");
		String upwd = request.getParameter("upwd");
		String vcode = request.getParameter("vcode");
		HttpSession session = request.getSession();
		String vscode = session.getAttribute("vcode") + "";
		if (vscode.equals(vcode)) {
			User ser = new User();
			ser.setUname(uname);
			ser.setUpwd(upwd);
			List<User> userList = userService.queryUserList(ser, null);
			if (userList != null && userList.size() > 0) {
				User user = userList.get(0);
				request.getSession().setAttribute("user", user);
				flag = "true";
			}
		} else {
			flag = "false1";
		}
		return flag;
	}

	@RequestMapping(value = "/user_loginout")
	public String user_loginout(HttpServletRequest request) throws Exception {
		request.getSession().setAttribute("user", null);
		request.getSession().invalidate();
		return "/web/login.jsp";
	}

}
