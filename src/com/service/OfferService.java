package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Offer;

/**
 * 面试offerService接口
 */
public interface OfferService {
	/**
	 * 查询面试offer记录数
	 * 
	 * @param offer
	 * @return
	 */
	public int getCount(Offer offer);

	/**
	 * 查询所有面试offer
	 * 
	 * @return
	 */
	public List<Offer> queryOfferList(Offer offer, PageBean page)
			throws Exception;

	/**
	 * 保存面试offer
	 * 
	 * @param offer
	 * @return
	 */
	public int insertOffer(Offer offer) throws Exception;

	/**
	 * 删除面试offer
	 * 
	 * @param id
	 * @return
	 */
	public int deleteOffer(int id) throws Exception;

	/**
	 * 更新面试offer
	 * 
	 * @param offer
	 * @return
	 */
	public int updateOffer(Offer offer) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Offer queryOfferById(int id) throws Exception;
}
