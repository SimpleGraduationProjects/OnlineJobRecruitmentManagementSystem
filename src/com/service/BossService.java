package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Boss;

/**
 * 招聘者Service接口
 */
public interface BossService {
	/**
	 * 查询招聘者记录数
	 * 
	 * @param boss
	 * @return
	 */
	public int getCount(Boss boss);

	/**
	 * 查询所有招聘者
	 * 
	 * @return
	 */
	public List<Boss> queryBossList(Boss boss, PageBean page) throws Exception;

	/**
	 * 保存招聘者
	 * 
	 * @param boss
	 * @return
	 */
	public int insertBoss(Boss boss) throws Exception;

	/**
	 * 删除招聘者
	 * 
	 * @param id
	 * @return
	 */
	public int deleteBoss(int id) throws Exception;

	/**
	 * 更新招聘者
	 * 
	 * @param boss
	 * @return
	 */
	public int updateBoss(Boss boss) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Boss queryBossById(int id) throws Exception;
}
