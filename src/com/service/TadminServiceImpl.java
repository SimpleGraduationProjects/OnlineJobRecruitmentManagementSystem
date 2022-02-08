package com.service;

import java.util.List;
import com.model.Tadmin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.TadminMapper;

/**
 * 管理员信息Service实现类
 */
@Service
public class TadminServiceImpl implements TadminService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private TadminMapper tadminMapper;

	/**
	 * 查询管理员信息记录数
	 * 
	 * @param tadmin
	 * @return
	 */
	public int getCount(Tadmin tadmin) {
		Map<String, Object> map = getQueryMap(tadmin, null);
		return tadminMapper.getCount(map);
	}

	/**
	 * 查询所有管理员信息
	 * 
	 * @return
	 */
	public List<Tadmin> queryTadminList(Tadmin tadmin, PageBean page)
			throws Exception {
		Map<String, Object> map = getQueryMap(tadmin, page);
		List<Tadmin> list = tadminMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param tadmin
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Tadmin tadmin, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (tadmin != null) {
			map.put("id", tadmin.getId());
			map.put("uname", tadmin.getUname());
			map.put("upwd", tadmin.getUpwd());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存管理员信息
	 * 
	 * @param tadmin
	 * @return
	 */
	public int insertTadmin(Tadmin tadmin) throws Exception {
		return tadminMapper.insertTadmin(tadmin);
	}

	/**
	 * 删除管理员信息
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTadmin(int id) throws Exception {
		return tadminMapper.deleteTadmin(id);
	}

	/**
	 * 更新管理员信息
	 * 
	 * @param tadmin
	 * @return
	 */
	public int updateTadmin(Tadmin tadmin) throws Exception {
		return tadminMapper.updateTadmin(tadmin);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Tadmin queryTadminById(int id) throws Exception {
		return tadminMapper.queryTadminById(id);
	}
}
