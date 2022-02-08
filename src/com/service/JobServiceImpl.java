package com.service;

import java.util.List;
import com.model.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import com.util.PageBean;
import java.util.Map;
import com.mapper.JobMapper;

/**
 * 招聘Service实现类
 */
@Service
public class JobServiceImpl implements JobService {
	/**
	 * 注入mapper
	 */
	@Autowired
	private JobMapper jobMapper;

	/**
	 * 查询招聘记录数
	 * 
	 * @param job
	 * @return
	 */
	public int getCount(Job job) {
		Map<String, Object> map = getQueryMap(job, null);
		return jobMapper.getCount(map);
	}

	/**
	 * 查询所有招聘
	 * 
	 * @return
	 */
	public List<Job> queryJobList(Job job, PageBean page) throws Exception {
		Map<String, Object> map = getQueryMap(job, page);
		List<Job> list = jobMapper.query(map);
		return list;
	}

	/**
	 * 封装查询条件
	 * 
	 * @param job
	 * @param page
	 * @return
	 */
	private Map<String, Object> getQueryMap(Job job, PageBean page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (job != null) {
			map.put("id", job.getId());
			map.put("bid", job.getBid());
			map.put("catelogid", job.getCatelogid());
			map.put("name", job.getName());
			map.put("minsalary", job.getMinsalary());
			map.put("maxsalary", job.getMaxsalary());
			map.put("quyu", job.getQuyu());
			map.put("xueli", job.getXueli());
			map.put("xinzIndex", job.getXinzIndex());
			
		}
		if (page != null) {
			PageBean.setPageMap(map, page);
		}
		return map;
	}

	/**
	 * 保存招聘
	 * 
	 * @param job
	 * @return
	 */
	public int insertJob(Job job) throws Exception {
		return jobMapper.insertJob(job);
	}

	/**
	 * 删除招聘
	 * 
	 * @param id
	 * @return
	 */
	public int deleteJob(int id) throws Exception {
		return jobMapper.deleteJob(id);
	}

	/**
	 * 更新招聘
	 * 
	 * @param job
	 * @return
	 */
	public int updateJob(Job job) throws Exception {
		return jobMapper.updateJob(job);
	}

	/**
	 * 根据ID查询记录
	 * 
	 * @param id
	 * @return
	 */
	public Job queryJobById(int id) throws Exception {
		return jobMapper.queryJobById(id);
	}
}
