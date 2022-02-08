package com.service;

import java.util.List;
import com.model.Boss;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.BossMapper;

/**
 * 招聘者Service实现类
 */
@Service
public class BossServiceImpl implements BossService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private BossMapper bossMapper;

	/**
	 * 查询招聘者记录数
	 * 
	 * @param boss
	 * @return
	 */
	public int getCount(Boss boss) {
		Map<String, Object> map = getQueryMap(boss, null);
		return bossMapper.getCount(map);
	}

	/**
	 * 查询所有招聘者
	 * 
	 * @return
	 */
	public List<Boss> queryBossList(Boss boss, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(boss, page);
		List<Boss> list = bossMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param boss
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Boss boss, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (boss != null) {
			map.put("id", boss.getId());
			map.put("uname", boss.getUname());
			map.put("name", boss.getName());
			map.put("upwd", boss.getUpwd());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存招聘者
	 * 
	 * @param boss
	 * @return
	 */
	public int insertBoss(Boss boss) throws Exception {
		return bossMapper.insertBoss(boss);
	}

	/**
	 * 删除招聘者
	 * 
	 * @param id
	 * @return
	 */
	public int deleteBoss(int id) throws Exception {
		return bossMapper.deleteBoss(id);
	}

	/**
	 * 更新招聘者
	 * 
	 * @param boss
	 * @return
	 */
	public int updateBoss(Boss boss) throws Exception {
		return bossMapper.updateBoss(boss);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Boss queryBossById(int id) throws Exception {
		return bossMapper.queryBossById(id);
	}
}
