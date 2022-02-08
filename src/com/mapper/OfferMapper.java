package com.mapper;

import com.model.Offer;
import java.util.List;
import java.util.Map;

public interface OfferMapper {
	/**
	 * 查询所有面试offer
	 * 
	 * @return
	 */
	public List<Offer> query(Map<String, Object> inputParam);

	/**
	 * 查询面试offer记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存面试offer
	 * 
	 * @param offer
	 * @return
	 */
	public int insertOffer(Offer offer);

	/**
	 * 删除面试offer
	 * 
	 * @param id
	 * @return
	 */
	public int deleteOffer(int id);

	/**
	 * 更新面试offer
	 * 
	 * @param offer
	 * @return
	 */
	public int updateOffer(Offer offer);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Offer queryOfferById(int id);
}
