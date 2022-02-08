package com.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * 系统常用方法
 * 
 * @author Administrator
 * 
 */
public class Utils {

	/**
	 * 获取过去或者未来 任意天内的日期数组
	 * 
	 * @param intervals
	 *            intervals天内
	 * @return 日期数组
	 */
	public static ArrayList<String> getNear6Month(int intervals) {
		ArrayList<String> fetureDaysList = new ArrayList<String>();
		for (int i = intervals - 1; i >= 0; i--) {
			fetureDaysList.add(getFetureDate(i));
		}
		return fetureDaysList;
	}

	/**
	 * 获取未来 第 past 月的日期
	 * 
	 * @param past
	 * @return
	 */
	public static String getFetureDate(int past) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - past);
		Date today = calendar.getTime();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		String result = format.format(today);
		return result;
	}

	// 获取当前时间的年份
	public static String getDateYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		return String.valueOf(year) + "年";
	}

	// 获取去年年份
	public static String getDateLastYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, -1);
		int year = calendar.get(Calendar.YEAR);
		return String.valueOf(year) + "年";
	}

}
