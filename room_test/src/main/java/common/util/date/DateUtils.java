package main.java.common.util.date;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;

import org.apache.commons.lang.time.DateFormatUtils;

import main.java.common.util.StrUtils;

/**
 * createTime：2013-4-9 下午4:06:02 说明：时间操作的工具类
 */
public class DateUtils {

	private static String[] parsePatterns = new String[] { "yyyy-MM", "yyyyMM", "yyyy/MM", "yyyyMMdd", "yyyy-MM-dd", "yyyy/MM/dd", "yyyyMMddHHmmss",
			"yyyy-MM-dd HH:mm:ss", "yyyy/MM/dd HH:mm:ss" };

	private static Map<String, SimpleDateFormat> map = new HashMap<String, SimpleDateFormat>();

	private static DatatypeFactory dtf = null;

	static {
		map.put("yyyy-MM-dd HH:mm:ss", SimpleDateFormatUtil.getFullDateFormat());
		map.put("yyyy-MM-dd", SimpleDateFormatUtil.getSimpleDateFormat());
		map.put("yyyy-MM", SimpleDateFormatUtil.getYmDateFormat());
		map.put("yyyy", SimpleDateFormatUtil.getYearDateFormat());
		try {
			dtf = DatatypeFactory.newInstance();
		} catch (DatatypeConfigurationException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 返回"yyyy-MM-dd 00:00:00"
	 * 
	 * @param day
	 *            必须是"yyyy-MM-dd"格式，否则返回结果可能不正确
	 * @return
	 */
	public static String beginOfDay(String day) {
		return day + " 00:00:00";
	}

	/**
	 * 返回"yyyy-MM-dd 23:59:59"
	 * 
	 * @param day
	 *            必须是"yyyy-MM-dd"格式，否则返回结果可能不正确
	 * @return
	 */
	public static String endOfDay(String day) {
		return day + " 23:59:59";
	}

	/**
	 * @param date
	 * @return 当天最后一秒的时间
	 */
	public static Date endOfDate(Date date) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.set(11, 23);
		c.set(12, 59);
		c.set(13, 59);
		return c.getTime();
	}

	/**
	 * @param date
	 * @return 当天最早一秒的时间
	 */
	public static Date startOfDate(Date date) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.set(11, 0);
		c.set(12, 0);
		c.set(13, 0);
		return c.getTime();
	}

	/**
	 * @param string
	 * @return 当天最后一秒的时间
	 */
	public static String getStartFormatStr(Date date) {
		date = startOfDate(date);
		return formatDate(date);
	}

	/**
	 * @param string
	 * @return 当天最早一秒的时间
	 */
	public static String getEndFormatStr(Date date) {
		date = endOfDate(date);
		return formatDate(date);
	}

	/**
	 * @return 获取服务器当前时间
	 */
	public static Date now() {
		return new Date();
	}

	/**
	 * @return 1970-01-01 00:00:00
	 */
	public static Date startYear() {
		return new GregorianCalendar(1970, 0, 1, 0, 0, 0).getTime();
	}

	/**
	 * 获取指定时间（date）的days天后的当天的最后一秒的时间
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static Date getNextDays(Date date, int days) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.add(5, days);
		c.set(11, 23);
		c.set(12, 59);
		c.set(13, 59);
		return c.getTime();
	}

	/**
	 * 获取指定时间的后days天
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static Date nextDays(Date date, int days) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.add(5, days);
		return c.getTime();
	}

	/**
	 * @return 当前秒数
	 */
	public static int nowSecond() {
		Calendar c = getCalendar();
		return c.get(Calendar.SECOND);
	}

	/**
	 * @return 当前分钟数
	 */
	public static int nowMinute() {
		Calendar c = getCalendar();
		return c.get(Calendar.MINUTE);
	}

	/**
	 * @return 当前小时数
	 */
	public static int nowHour() {
		Calendar c = getCalendar();
		return c.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * @return 当前星期几
	 */
	public static int dayOfWeek() {
		return dayOfWeek(DateUtils.now());
	}

	/**
	 * @param day
	 * @return 星期几
	 */
	public static int dayOfWeek(Date day) {
		Calendar c = getCalendar();
		c.setTime(day);
		int week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (week < 0) {
			return 0;
		}
		return week;
	}

	/**
	 * @return
	 */
	public static Calendar getCalendar() {
		return Calendar.getInstance();
	}

	/**
	 * 返回格式是yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date
	 * @return 格式化日期
	 */
	public static String formatDate(Date date) {
		return formatDate(date, null);
	}

	/**
	 * 返回格式是yyyy-MM-dd
	 * 
	 * @param date
	 * @return
	 * @ThreadSafe
	 */
	public static String formatDate2Day(Date date) {
		if (date == null) {
			return null;
		}
		// return SimleDateFormatUtil.getSimpleDateFormat().format(date);
		return DateFormatUtils.format(date, "yyyy-MM-dd");
	}

	/**
	 * @param date
	 * @param format
	 * @return 按照指定格式格式化日期，默认格式化为: yyyy-MM-dd HH:mm:ss
	 * @ThreadSafe
	 */
	public static String formatDate(Date date, String format) {
		if (date == null) {
			return null;
		}
		if (format == null) {
			// return SimleDateFormatUtil.getFullDateFormat().format(date);
			return DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:ss");
		} else if (map.get(format) != null) {
			return map.get(format).format(date);
		} else {
			return DateFormatUtils.format(date, format);
		}
	}

	/**
	 * @param sdf
	 * @param date
	 * @return
	 * @ThreadSafe
	 */
	public static String formatDate(SimpleDateFormat sdf, Date date) {
		if (date == null) {
			return null;
		}
		if (sdf == null) {
			// return SimleDateFormatUtil.getFullDateFormat().format(date);
			return DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:ss");
		}
		return sdf.format(date);
	}

	/**
	 * @param day
	 * @return
	 * @ThreadSafe
	 */
	public static Date parseDay(String day) {
		if (day == null || "".contains(day.trim())) {
			return null;
		}
		try {
			// return SimleDateFormatUtil.getSimpleDateFormat().parse(day);
			return org.apache.commons.lang.time.DateUtils.parseDate(day, parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * @param second
	 *            下几秒
	 * @return
	 */
	public static String getNextSecond(Long second) {
		return String.valueOf((System.currentTimeMillis() + (second * 1000)));
	}

	/**
	 * 获取指定时间
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @param hour
	 * @param minuth
	 * @param second
	 * @return
	 */
	public static Date formartDate(int year, int month, int day, int hour, int minuth, int second) {
		Calendar c = getCalendar();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, (month - 1));
		c.set(Calendar.DAY_OF_MONTH, day);
		c.set(Calendar.HOUR_OF_DAY, hour);
		c.set(Calendar.MINUTE, minuth);
		c.set(Calendar.SECOND, second);
		return c.getTime();
	}

	public static Date formartDate(int year, int month, int day) {
		return formartDate(year, month, day, 0, 0, 0);
	}

	/**
	 * 按历法获取当月最后一秒的时间对象
	 * 
	 * @param date
	 * @return
	 */
	public static Date getMonthEndDate(Date date) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.set(Calendar.DATE, 1);
		c.roll(Calendar.DATE, -1);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return c.getTime();
	}

	/**
	 * 按历法获取当月最初一秒的时间对象是
	 * 
	 * @param date
	 * @return
	 */
	public static Date getMonthBeginDate(Date date) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return c.getTime();
	}

	/**
	 * @param date
	 * @return
	 */
	public static Date getNextSecondForDate(Date date, int second) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.add(Calendar.SECOND, second);
		return c.getTime();
	}

	/**
	 * 获取当前月份
	 * 
	 * @return
	 */
	public static Integer getNowMonth() {
		Calendar c = getCalendar();
		return (c.get(Calendar.MONTH) + 1);
	}

	/**
	 * 获取当前月份
	 * 
	 * @return
	 */
	public static Integer getNowYear() {
		Calendar c = getCalendar();
		return (c.get(Calendar.YEAR));
	}

	/**
	 * @return
	 */
	public static Integer getYearForDate(Date date) {
		Calendar c = getCalendar();
		c.setTime(date);
		return (c.get(Calendar.YEAR));
	}

	/**
	 * 获取指定date对象的月份
	 * 
	 * @param date
	 * @return
	 */
	public static Integer getMonthForDate(Date date) {
		Calendar c = getCalendar();
		c.setTime(date);
		return (c.get(Calendar.MONTH) + 1);
	}

	/**
	 * 默认的格式为 fullDateForamt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 * 
	 * @param str
	 * @return
	 * @throws ParseException
	 */
	public static Date str2Date(String str) throws ParseException {
		if (StrUtils.isNotEmpty(str)) {
			return str2Date(str, null);
		}
		return null;
	}

	/**
	 * 按指定格式 返回date对象
	 * 
	 * @param str
	 * @param sdff
	 * @return
	 * @throws ParseException
	 */
	public static Date str2Date(String str, SimpleDateFormat sdff) throws ParseException {
		if (sdff == null) {
			sdff = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}
		if (StrUtils.isNotEmpty(str)) {
			return sdff.parse(str);
		}
		return null;
	}

	/**
	 * 获取下几个月
	 * 
	 * @param date
	 * @param num
	 * @return
	 */
	public static Date getNextMonthForDate(Date date, int num) {
		Calendar c = getCalendar();
		c.setTime(date);
		c.add(Calendar.MONTH, num);
		return c.getTime();
	}

	/**
	 * d1 与 d2 的时间差。返回秒
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static Integer diffSecond(Date d1, Date d2) {
		if (d1 == null && d2 == null) {
			throw new IllegalArgumentException(" d1 and d2 must be not null . ");
		}
		if (d1 == null || d2 == null) {
			return null;
		}
		return (int) ((d1.getTime() - d2.getTime()) / 1000);
	}

	/**
	 * 计算 d1 - d2 的天数差
	 * 
	 * @since 2007-12-10
	 */
	public static long diffDays(Date d1, Date d2) {
		d1 = clearTime(d1);
		d2 = clearTime(d2);
		return (d1.getTime() - d2.getTime()) / (24 * 60 * 60 * 1000);
	}

	/**
	 * 清除时间，得到日期
	 * 
	 * @since 2007-12-10
	 */
	public static Date clearTime(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}

	/**
	 * @since 2008-01-02
	 */
	public static Date add(Date date, int field, int diff) {
		Calendar c = getCalendar(date);
		c.add(field, diff);
		return c.getTime();
	}

	/**
	 * @since 2008-01-02
	 */
	public static Calendar getCalendar(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c;
	}

	public static Date getLastDate(Date date) {
		Calendar c = getCalendar(date);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return c.getTime();
	}

	public static Date getFirstDate(Date date) {
		Calendar c = getCalendar(date);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return c.getTime();
	}

	/**
	 * 说明：date to int 例如：2011-02-12 to 20110212
	 * 
	 * @param date
	 * @return
	 */
	public static Integer dateToInt(Date date) {
		if (date == null) {
			return 0;
		}
		return Integer.valueOf(formatDate(date, "yyyyMMdd"));
	}

	/**
	 * 是否是同一天，精确到天。两个参数不能同时为空，否则报错。如果一个参数为空，则返回<code>false</code>
	 * 
	 * @param day1
	 * @param day2
	 * @return
	 */
	public static boolean isSameDay(Date day1, Date day2) {
		if (day1 == null && day2 == null) {
			throw new RuntimeException("can't be null.");
		}
		if (day1 == null || day2 == null) {
			return Boolean.FALSE;
		}
		return org.apache.commons.lang.time.DateUtils.isSameDay(day1, day2);
		// return SimleDateFormatUtil.getSimpleDateFormat().format(day1)
		// .equals(SimleDateFormatUtil.getSimpleDateFormat().format(day2));
	}

	/**
	 * 年份比较
	 * 
	 * @param y1
	 * @param y2
	 * @return
	 */
	public static boolean isSameYear(Date y1, Integer y2) {
		if (y1 == null && y2 == 0) {
			throw new RuntimeException("can't be null.");
		}
		Calendar c = getCalendar();
		c.setTime(y1);
		Integer year = c.get(Calendar.YEAR);
		return year.intValue() < y2.intValue();
	}

	/**
	 * @param date
	 * @return
	 * @ThreadSafe
	 */
	public static String formatDay(Date date) {
		try {
			return DateFormatUtils.format(date, "yyyy-MM-dd HH:mm:ss");
			// return SimleDateFormatUtil.getFullDateFormat().format(date);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * @param date
	 * @return
	 */
	// public static Date formatDateTime(Date date) {
	// if (date == null) {
	// return null;
	// }
	// String d = fullDateForamt.format(date);
	// try {
	// return fullDateForamt.parse(d);
	// } catch (ParseException e) {
	// //throw new RuntimeException("can't parse : " + d);
	// return null;
	// }
	// }

	/**
	 * XMLGregorianCalendar类型和日期类型之间的相互转换 amazon 请求time type
	 * 
	 * @param date
	 * @return
	 */
	public static XMLGregorianCalendar converXMLGregorianCalendar(Date date) {
		if (date == null) {
			throw new IllegalArgumentException(" converXMLGregorianCalendar date must not be null . ");
		} else {
			GregorianCalendar gc = new GregorianCalendar();
			gc.setTimeInMillis(date.getTime());
			return dtf.newXMLGregorianCalendar(gc);
		}
	}

	/**
	 * XMLGregorianCalendar类型和日期类型之间的相互转换
	 * 
	 * @param xgc
	 * @return
	 */
	public static Date converDate(XMLGregorianCalendar xgc) {
		if (xgc == null) {
			throw new IllegalArgumentException(" converXMLGregorianCalendar date must not be null . ");
		} else {
			return xgc.toGregorianCalendar().getTime();
		}
	}

	public static Date getFirstDate(Date d1, Date payTime) {
		if (d1 == null && payTime == null) {
			return null;
		}
		if (d1 == null) {
			return payTime;
		}
		if (payTime == null) {
			return d1;
		}
		if (d1.getTime() < payTime.getTime()) {
			return d1;
		} else {
			return payTime;
		}
	}

	public static Date getLastDate(Date d1, Date payTime) {
		if (d1 == null && payTime == null) {
			return null;
		}
		if (d1 == null) {
			return payTime;
		}
		if (payTime == null) {
			return d1;
		}
		if (d1.getTime() > payTime.getTime()) {
			return d1;
		} else {
			return payTime;
		}
	}

	/**
	 * @param d1
	 * @param d2
	 * @return d2 - d1 的相差的天数
	 */
	public static Integer getDays(Date date1, Date date2) {
		if (date1 == null || date2 == null) {
			return null;
		}
		boolean flag = Boolean.TRUE;
		Date d1 = null;
		Date d2 = null;
		if (date1.before(date2)) {
			d1 = startOfDate(date1);
			d2 = startOfDate(date2);
		} else {
			d1 = startOfDate(date2);
			d2 = startOfDate(date1);
			flag = Boolean.FALSE;
		}
		int differ = 0;
		while (d1.before(d2)) {
			d1 = startOfDate(nextDays(d1, 1));
			++differ;
		}
		if (flag) {
			return differ;
		} else {
			return 0 - differ;
		}
		// boolean flag = Boolean.TRUE;
		// Integer differ = 0;
		// if (d1 == null || d2 == null) {
		// return null;
		// } else {
		// Calendar c1 = new GregorianCalendar();
		// Calendar c2 = new GregorianCalendar();
		// if (d1.before(d2)) {
		// c1.setTime(d1);
		// c2.setTime(d2);
		// } else {
		// c1.setTime(d2);
		// c2.setTime(d1);
		// flag = Boolean.FALSE;
		// }
		// c1.clear(Calendar.MILLISECOND);
		// c1.clear(Calendar.SECOND);
		// c1.clear(Calendar.MINUTE);
		// c1.clear(Calendar.HOUR);
		// c1.clear(Calendar.HOUR_OF_DAY);
		// c2.clear(Calendar.MILLISECOND);
		// c2.clear(Calendar.SECOND);
		// c2.clear(Calendar.MINUTE);
		// c2.clear(Calendar.HOUR_OF_DAY);
		// c2.clear(Calendar.HOUR);
		// while (true) {
		// int k = c1.compareTo(c2);
		// if (k == 0) {
		// break;
		// } else {
		// c1.add(Calendar.DATE, 1);
		// ++differ;
		// }
		// }
		// }
		// if (flag) {
		// return differ;
		// } else {
		// return 0 - differ;
		// }
	}

	public static void main(String[] args) {
		Date nowTime = now();
		Date d1 = formartDate(2013, 9, 23);
		System.out.println(DateUtils.isSameDay(DateUtils.nextDays(nowTime, -1), d1));
		// long start = System.currentTimeMillis();
		// // Date d1 = nextDays(now(), -10);
		// Date d1 = formartDate(0001, 1, 1);
		// Date d2 = now();
		// System.out.println(getDays(d2, d1));
		// System.out.println(System.currentTimeMillis() - start);
	}

	public static Date getDateByDays(String days, String string) {
		if (StrUtils.isEmpty(days)) {
			return null;
		}
		Calendar calendar = Calendar.getInstance();
		if ("begin".equals(string)) {
			calendar.add(Calendar.DATE, -(Integer.valueOf(days).intValue() - 1));
			Date begin = DateUtils.startOfDate(calendar.getTime());
			return begin;
		} else if ("begin1".equals(string)) {
			calendar.add(Calendar.DATE, -(Integer.valueOf(days).intValue() - 1));
			Date begin1 = DateUtils.endOfDate(calendar.getTime());
			return begin1;
		} else {
			return calendar.getTime();
		}
	}

	public static Date getBTDateByDays(int days, String string) {
		Calendar calendar = Calendar.getInstance();
		if ("begin".equals(string)) {
			calendar.add(Calendar.DATE, -days);
			Date begin = DateUtils.startOfDate(calendar.getTime());
			return begin;
		} else if ("end".equals(string)) {
			calendar.add(Calendar.DATE, -days);
			Date begin1 = DateUtils.endOfDate(calendar.getTime());
			return begin1;
		}
		return null;
	}

	/***
	 * 获取指定时间的后house小时
	 */
	public static Date nextHouse(Date date, int house) {
		Calendar c = getCalendar();
		c.add(java.util.Calendar.HOUR, house);
		return c.getTime();
	}

	/**
	 * 获取月份第一秒
	 * 
	 * @param year
	 * @param month
	 * @return
	 * @throws ParseException
	 */
	public static Date startOfMonth(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, 1, 0, 0, 0);
		calendar.add(Calendar.MONTH, -1);
		return calendar.getTime();
	}

	/**
	 * 获取月份最后一秒
	 * 
	 * @param year
	 * @param month
	 * @return
	 * @throws ParseException
	 */
	public static Date endOfMonth(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(year, month, 0, 23, 59, 59);
		return calendar.getTime();
	}

	public static java.sql.Date getSqlDate(Date date) {

		return new java.sql.Date(date.getTime());
	}

	public static Timestamp getSqlTime(Date date) {

		return new java.sql.Timestamp(date.getTime());
	}
}
