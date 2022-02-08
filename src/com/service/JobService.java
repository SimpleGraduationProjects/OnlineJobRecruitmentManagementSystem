package com.service;

import java.util.List;
import com.util.PageBean;
import com.model.Job;

/**
 * 招聘Service接口
 */
public interface JobService {
	/**
	 * 查询招聘记录数
	 * 
	 * @param job
	 * @return
	 */
	public int getCount(Job job);

	/**
	 * 查询所有招聘
	 * 
	 * @return
	 */
	public List<Job> queryJobList(Job job, PageBean page) throws Exception;

	/**
	 * 保存招聘
	 * 
	 * @param job
	 * @return
	 */
	public int insertJob(Job job) throws Exception;

	/**
	 * 删除招聘
	 * 
	 * @param id
	 * @return
	 */
	public int deleteJob(int id) throws Exception;

	/**
	 * 更新招聘
	 * 
	 * @param job
	 * @return
	 */
	public int updateJob(Job job) throws Exception;

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Job queryJobById(int id) throws Exception;
}
