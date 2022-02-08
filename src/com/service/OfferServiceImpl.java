package com.service;

import java.util.List;
import com.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.OfferMapper;

/**
 * 面试offerService实现类
 */
@Service
public class OfferServiceImpl implements OfferService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private OfferMapper offerMapper;

	/**
	 * 查询面试offer记录数
	 * 
	 * @param offer
	 * @return
	 */
	public int getCount(Offer offer) {
		Map<String, Object> map = getQueryMap(offer, null);
		return offerMapper.getCount(map);
	}

	/**
	 * 查询所有面试offer
	 * 
	 * @return
	 */
	public List<Offer> queryOfferList(Offer offer, PageBean page)
			throws Exception {
		Map<String, Object> map = getQueryMap(offer, page);
		List<Offer> list = offerMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param offer
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Offer offer, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (offer != null) {
			map.put("id", offer.getId());
			map.put("uid", offer.getUid());
			map.put("jobid", offer.getJobid());
			map.put("bid", offer.getBid());
			map.put("zt", offer.getZt());
			map.put("jieguo", offer.getJieguo());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存面试offer
	 * 
	 * @param offer
	 * @return
	 */
	public int insertOffer(Offer offer) throws Exception {
		return offerMapper.insertOffer(offer);
	}

	/**
	 * 删除面试offer
	 * 
	 * @param id
	 * @return
	 */
	public int deleteOffer(int id) throws Exception {
		return offerMapper.deleteOffer(id);
	}

	/**
	 * 更新面试offer
	 * 
	 * @param offer
	 * @return
	 */
	public int updateOffer(Offer offer) throws Exception {
		return offerMapper.updateOffer(offer);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Offer queryOfferById(int id) throws Exception {
		return offerMapper.queryOfferById(id);
	}
}
