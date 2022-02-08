package com.service;

import java.util.List;
import com.model.Gonggao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.GonggaoMapper;

/**
 * 资讯Service实现类
 */
@Service
public class GonggaoServiceImpl implements GonggaoService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private GonggaoMapper gonggaoMapper;

	/**
	 * 查询资讯记录数
	 * 
	 * @param gonggao
	 * @return
	 */
	public int getCount(Gonggao gonggao) {
		Map<String, Object> map = getQueryMap(gonggao, null);
		return gonggaoMapper.getCount(map);
	}

	/**
	 * 查询所有资讯
	 * 
	 * @return
	 */
	public List<Gonggao> queryGonggaoList(Gonggao gonggao, PageBean page)
			throws Exception {
		Map<String, Object> map = getQueryMap(gonggao, page);
		List<Gonggao> list = gonggaoMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param gonggao
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Gonggao gonggao, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (gonggao != null) {
			map.put("id", gonggao.getId());
			map.put("name", gonggao.getName());
			map.put("gtype", gonggao.getGtype());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存资讯
	 * 
	 * @param gonggao
	 * @return
	 */
	public int insertGonggao(Gonggao gonggao) throws Exception {
		return gonggaoMapper.insertGonggao(gonggao);
	}

	/**
	 * 删除资讯
	 * 
	 * @param id
	 * @return
	 */
	public int deleteGonggao(int id) throws Exception {
		return gonggaoMapper.deleteGonggao(id);
	}

	/**
	 * 更新资讯
	 * 
	 * @param gonggao
	 * @return
	 */
	public int updateGonggao(Gonggao gonggao) throws Exception {
		return gonggaoMapper.updateGonggao(gonggao);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Gonggao queryGonggaoById(int id) throws Exception {
		return gonggaoMapper.queryGonggaoById(id);
	}
}
