package com.mapper;

import com.model.Boss;
import java.util.List;
import java.util.Map;

public interface BossMapper {
	/**
	 * 查询所有招聘者
	 * 
	 * @return
	 */
	public List<Boss> query(Map<String, Object> inputParam);

	/**
	 * 查询招聘者记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存招聘者
	 * 
	 * @param boss
	 * @return
	 */
	public int insertBoss(Boss boss);

	/**
	 * 删除招聘者
	 * 
	 * @param id
	 * @return
	 */
	public int deleteBoss(int id);

	/**
	 * 更新招聘者
	 * 
	 * @param boss
	 * @return
	 */
	public int updateBoss(Boss boss);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Boss queryBossById(int id);
}
