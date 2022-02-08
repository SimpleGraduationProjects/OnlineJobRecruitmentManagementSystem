package com.service;

import java.util.List;
import com.model.Catelog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.CatelogMapper;

/**
 * 职位类别Service实现类
 */
@Service
public class CatelogServiceImpl implements CatelogService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private CatelogMapper catelogMapper;

	/**
	 * 查询职位类别记录数
	 * 
	 * @param catelog
	 * @return
	 */
	public int getCount(Catelog catelog) {
		Map<String, Object> map = getQueryMap(catelog, null);
		return catelogMapper.getCount(map);
	}

	/**
	 * 查询所有职位类别
	 * 
	 * @return
	 */
	public List<Catelog> queryCatelogList(Catelog catelog, PageBean page)
			throws Exception {
		Map<String, Object> map = getQueryMap(catelog, page);
		List<Catelog> list = catelogMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param catelog
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Catelog catelog, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (catelog != null) {
			map.put("id", catelog.getId());
			map.put("name", catelog.getName());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存职位类别
	 * 
	 * @param catelog
	 * @return
	 */
	public int insertCatelog(Catelog catelog) throws Exception {
		return catelogMapper.insertCatelog(catelog);
	}

	/**
	 * 删除职位类别
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCatelog(int id) throws Exception {
		return catelogMapper.deleteCatelog(id);
	}

	/**
	 * 更新职位类别
	 * 
	 * @param catelog
	 * @return
	 */
	public int updateCatelog(Catelog catelog) throws Exception {
		return catelogMapper.updateCatelog(catelog);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Catelog queryCatelogById(int id) throws Exception {
		return catelogMapper.queryCatelogById(id);
	}
}
