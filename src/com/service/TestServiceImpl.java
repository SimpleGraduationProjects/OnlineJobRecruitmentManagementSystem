package com.service;

import java.util.List;
import com.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.TestMapper;

/**
 * 测试题Service实现类
 */
@Service
public class TestServiceImpl implements TestService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private TestMapper testMapper;

	/**
	 * 查询测试题记录数
	 * 
	 * @param test
	 * @return
	 */
	public int getCount(Test test) {
		Map<String, Object> map = getQueryMap(test, null);
		return testMapper.getCount(map);
	}

	/**
	 * 查询所有测试题
	 * 
	 * @return
	 */
	public List<Test> queryTestList(Test test, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(test, page);
		List<Test> list = testMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param test
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Test test, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (test != null) {
			map.put("id", test.getId());
			map.put("xtid", test.getXtid());
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存测试题
	 * 
	 * @param test
	 * @return
	 */
	public int insertTest(Test test) throws Exception {
		return testMapper.insertTest(test);
	}

	/**
	 * 删除测试题
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTest(int id) throws Exception {
		return testMapper.deleteTest(id);
	}

	/**
	 * 更新测试题
	 * 
	 * @param test
	 * @return
	 */
	public int updateTest(Test test) throws Exception {
		return testMapper.updateTest(test);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Test queryTestById(int id) throws Exception {
		return testMapper.queryTestById(id);
	}
}
