package com.mapper;

import com.model.Test;
import java.util.List;
import java.util.Map;

public interface TestMapper {
	/**
	 * 查询所有测试题
	 * 
	 * @return
	 */
	public List<Test> query(Map<String, Object> inputParam);

	/**
	 * 查询测试题记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存测试题
	 * 
	 * @param test
	 * @return
	 */
	public int insertTest(Test test);

	/**
	 * 删除测试题
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTest(int id);

	/**
	 * 更新测试题
	 * 
	 * @param test
	 * @return
	 */
	public int updateTest(Test test);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Test queryTestById(int id);
}
