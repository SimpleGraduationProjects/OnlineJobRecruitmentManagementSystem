package com.mapper;

import com.model.Job;
import java.util.List;
import java.util.Map;

public interface JobMapper {
	/**
	 * 查询所有招聘
	 * 
	 * @return
	 */
	public List<Job> query(Map<String, Object> inputParam);

	/**
	 * 查询招聘记录数
	 * 
	 * @param inputParam
	 * @return
	 */
	public int getCount(Map<String, Object> inputParam);

	/**
	 * 保存招聘
	 * 
	 * @param job
	 * @return
	 */
	public int insertJob(Job job);

	/**
	 * 删除招聘
	 * 
	 * @param id
	 * @return
	 */
	public int deleteJob(int id);

	/**
	 * 更新招聘
	 * 
	 * @param job
	 * @return
	 */
	public int updateJob(Job job);

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Job queryJobById(int id);
}
