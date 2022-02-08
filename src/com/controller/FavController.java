package com.controller;

import com.model.Boss;
import com.model.Catelog;
import com.model.Fav;
import com.model.Offer;
import com.service.BossService;
import com.service.CatelogService;
import com.service.FavService;
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

/**
 * 收藏Controller业务控制类
 */
@Controller
public class FavController {
	/**
	 * 注入Service
	 */
	@Autowired
	private FavService favService;
	@Autowired
	private UserService userService;
	@Autowired
	private CatelogService catelogService;
	@Autowired
	private BossService bossService;
	

	/**
	 * 收藏列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_list")
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
		Fav fav = new Fav();
		Boss boss = (Boss) request.getSession().getAttribute("boss");
		fav.setBid(boss.getId());
		
		
		// 查询记录总数
		counts = favService.getCount(fav);
		// 获取当前页记录
		List<Fav> favList = favService.queryFavList(fav, page);
		if(favList!=null&&favList.size()>0){
			for (Fav fav2 : favList) {
				Catelog catelogVO = catelogService.queryCatelogById(fav2.getUserVO().getCatelogid());
				fav2.getUserVO().setCatelogVO(catelogVO);
			}
		}
		request.setAttribute("list", favList);
		User userQuery = new User();
		List<User> userList = userService.queryUserList(userQuery, null);
		request.setAttribute("userList", userList);
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/fav/fav_list.jsp";
	}

	/**
	 * 跳转到新增收藏界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_toAdd")
	public String toAdd(HttpServletRequest request) throws Exception {
		User user = new User();
		List<User> userList = userService.queryUserList(user, null);
		request.setAttribute("userList", userList);
		return "/admin/fav/fav_add.jsp";
	}

	/**
	 * 保存新增收藏
	 * 
	 * @param fav
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_add")
	public String add( HttpServletRequest request) throws Exception {
		
		
		Fav fav = new Fav();
		int uid = Integer.parseInt(request.getParameter("uid")) ;
		Boss boss = (Boss) request.getSession().getAttribute("boss");
		fav.setUid(uid);
		fav.setBid(boss.getId());
		fav.setCdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		.format(new Date()));
		List<Fav> favList = favService.queryFavList(fav, null);
		if(favList==null || favList.size()==0){

			// 保存到数据库
			favService.insertFav(fav);
		}
		
		return "redirect:fav_list.action";
	}

	/**
	 * 跳转到更新收藏界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Fav fav = favService.queryFavById(id);
		request.setAttribute("fav", fav);
		User user = new User();
		List<User> userList = userService.queryUserList(user, null);
		request.setAttribute("userList", userList);
		return "/admin/fav/fav_update.jsp";
	}

	/**
	 * 更新收藏
	 * 
	 * @param fav
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_update")
	public String update(Fav fav, HttpServletRequest request) throws Exception {
		// 更新数据库
		favService.updateFav(fav);
		return "redirect:fav_list.action";
	}

	/**
	 * 删除收藏
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		favService.deleteFav(id);
		return "redirect:fav_list.action";
	}

	/**
	 * 查看收藏详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/fav_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Fav fav = new Fav();
		fav.setId(id);
		List<Fav> list = favService.queryFavList(fav, null);
		fav = list.get(0);
		request.setAttribute("fav", fav);
		return "/admin/fav/fav_view.jsp";
	}
}
