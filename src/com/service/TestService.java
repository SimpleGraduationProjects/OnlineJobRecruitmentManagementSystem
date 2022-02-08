package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Test;

/**
 * 测试题Service接口
 */
public interface TestService {
	/**
	 * 查询测试题记录数
	 * 
	 * @param test
	 * @return
	 */
	public int getCount(Test test);

	/**
	 * 查询所有测试题
	 * 
	 * @return
	 */
	public List<Test> queryTestList(Test test, PageBean page) throws Exception;

	/**
	 * 保存测试题
	 * 
	 * @param test
	 * @return
	 */
	public int insertTest(Test test) throws Exception;

	/**
	 * 删除测试题
	 * 
	 * @param id
	 * @return
	 */
	public int deleteTest(int id) throws Exception;

	/**
	 * 更新测试题
	 * 
	 * @param test
	 * @return
	 */
	public int updateTest(Test test) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Test queryTestById(int id) throws Exception;
}
