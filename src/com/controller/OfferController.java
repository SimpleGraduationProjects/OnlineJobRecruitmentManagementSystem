package com.controller;

import com.model.Catelog;
import com.model.Fav;
import com.model.Job;
import com.model.Offer;
import com.service.CatelogService;
import com.service.FavService;
import com.service.JobService;
import com.service.OfferService;
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
 * 面试offerController业务控制类
 */
@Controller
public class OfferController {
	/**
	 * 注入Service
	 */
	@Autowired
	private OfferService offerService;
	@Autowired
	private UserService userService;
	@Autowired
	private JobService jobService;
	@Autowired
	private CatelogService catelogService;
	@Autowired
	private FavService favService;
	

	/**
	 * 面试offer列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_list")
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
		Offer offer = new Offer();
		int utype = Integer.parseInt(request.getSession().getAttribute("utype").toString());
		Boss  boss = null;
		if(utype==1){
			boss = (Boss) request.getSession().getAttribute("boss");
			offer.setBid(boss.getId());
		}
		
		String zt = request.getParameter("zt");
		offer.setZt(zt);
		request.setAttribute("zt", zt);
		String jieguo = request.getParameter("jieguo");
		offer.setJieguo(jieguo);
		request.setAttribute("jieguo", jieguo);
		// 查询记录总数
		counts = offerService.getCount(offer);
		// 获取当前页记录
		List<Offer> offerList = offerService.queryOfferList(offer, page);
		if(offerList!=null&&offerList.size()>0){
			for (Offer offer2 : offerList) {
				Job jobVO = offer2.getJobVO();
				Catelog catelogVO = catelogService.queryCatelogById(jobVO.getCatelogid());
				jobVO.setCatelogVO(catelogVO);
				offer2.setJobVO(jobVO);
				//查询是否收藏了简历
				if(boss!=null){
					Fav fav = new Fav();
					fav.setUid(offer2.getUid());
					fav.setBid(boss.getId());
					List<Fav> favList = favService.queryFavList(fav, null);
					if(favList!=null && favList.size()>0){
						offer2.setFav("是");
					}
				}
			}
		}
		
		
		request.setAttribute("list", offerList);
		
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/admin/offer/offer_list.jsp";
	}

	

	

	/**
	 * 跳转到更新面试offer界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_toUpdate")
	public String toUpdate(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		Offer offer = offerService.queryOfferById(id);
		User user = userService.queryUserById(offer.getUid());
		offer.setUserVO(user);
		request.setAttribute("offer", offer);
		
		return "/admin/offer/offer_update.jsp";
	}
	
	/**
	 * 跳转到更新面试offer界面
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_tojieguo")
	public String tojieguo(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出需要更新的记录
		
		Offer offer = offerService.queryOfferById(id);
		User user = userService.queryUserById(offer.getUid());
		offer.setUserVO(user);
		request.setAttribute("offer", offer);
		
		return "/admin/offer/offer_jieguo.jsp";
	}
	
	@RequestMapping(value = "/offer_jieguo")
	public String offer_jieguo(Offer offer, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		offerService.updateOffer(offer);
		return "redirect:offer_list.action";
	}

	/**
	 * 更新面试offer
	 * @param offer
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_update")
	public String update(Offer offer, HttpServletRequest request)
			throws Exception {
		// 更新数据库
		offerService.updateOffer(offer);
		return "redirect:offer_list.action";
	}

	/**
	 * 删除面试offer
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_delete")
	public String delete(HttpServletRequest request) throws Exception {
		// 根据id删除数据库记录
		int id = Integer.parseInt(request.getParameter("id"));
		offerService.deleteOffer(id);
		return "redirect:offer_list.action";
	}

	/**
	 * 查看面试offer详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_toView")
	public String toView(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Offer offer = new Offer();
		offer.setId(id);
		List<Offer> list = offerService.queryOfferList(offer, null);
		offer = list.get(0);
		Job jobVO = offer.getJobVO();
		Catelog catelogVO = catelogService.queryCatelogById(jobVO.getCatelogid());
		jobVO.setCatelogVO(catelogVO);
		request.setAttribute("offer", offer);
		return "/admin/offer/offer_view.jsp";
	}
	
	/*********************************************web***************************************************/
	/**
	 * 面试offer列表
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/my_offers")
	public String my_offers(HttpServletRequest request) throws Exception {
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
		Offer offer = new Offer();
		User user = (User) request.getSession().getAttribute("user");
		offer.setUid(user.getId());
		
		// 查询记录总数
		counts = offerService.getCount(offer);
		// 获取当前页记录
		List<Offer> offerList = offerService.queryOfferList(offer, page);
		if(offerList!=null&&offerList.size()>0){
			for (Offer offer2 : offerList) {
				Job jobVO = offer2.getJobVO();
				Catelog catelogVO = catelogService.queryCatelogById(jobVO.getCatelogid());
				jobVO.setCatelogVO(catelogVO);
				offer2.setJobVO(jobVO);
				
			}
		}
		request.setAttribute("list", offerList);
		
		// 将分页相关参数放到request中
		request.setAttribute("itemSize", counts);
		int page_count = counts % PageBean.PAGE_IETM == 0 ? counts
				/ PageBean.PAGE_IETM : counts / PageBean.PAGE_IETM + 1;
		request.setAttribute("pageItem", PageBean.PAGE_IETM);
		request.setAttribute("pageTotal", page_count);
		return "/web/offer/my_offers.jsp";
	}
	
	
	
	/**
	 * 保存新增面试offer
	 * 
	 * @param offer
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_add")
	public String add(HttpServletRequest request)
			throws Exception {
		Offer offer = new Offer();
		offer.setCdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		.format(new Date()));
		User user = (User) request.getSession().getAttribute("user");
		offer.setUid(user.getId());
		int jobid = Integer.parseInt(request.getParameter("jobid")) ;
		Job job = jobService.queryJobById(jobid);
		offer.setJobid(jobid);
		offer.setBid(job.getBid());
		offer.setZt("已投递");
		// 保存到数据库
		offerService.insertOffer(offer);
		return "redirect:my_offers.action";
	}
	/**
	 * 查看面试offer详情
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/offer_toView_web")
	public String toView_web(HttpServletRequest request) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		// 根据ID查询出记录放到request中，到前台jsp界面显示
		Offer offer = new Offer();
		offer.setId(id);
		List<Offer> list = offerService.queryOfferList(offer, null);
		offer = list.get(0);
		Job jobVO = offer.getJobVO();
		Catelog catelogVO = catelogService.queryCatelogById(jobVO.getCatelogid());
		jobVO.setCatelogVO(catelogVO);
		request.setAttribute("offer", offer);
		return "/web/offer/offer_view.jsp";
	}
}
