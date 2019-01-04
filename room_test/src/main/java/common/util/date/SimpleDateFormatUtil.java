package main.java.common.util.date;

import java.text.SimpleDateFormat;

/**
 * created 2013-6-24 - 下午12:18:57 SimleDateFormatUtil.java
 * 
 * @explain - 防止并发的时间处理
 */
public class SimpleDateFormatUtil {

	private static ThreadLocal<SimpleDateFormat> fullDateFormat = new ThreadLocal<SimpleDateFormat>() {
		protected synchronized SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		}
	};

	private static ThreadLocal<SimpleDateFormat> simpleDateFormat = new ThreadLocal<SimpleDateFormat>() {
		protected synchronized SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyy-MM-dd");
		}
	};

	private static ThreadLocal<SimpleDateFormat> ymDateFormat = new ThreadLocal<SimpleDateFormat>() {
		protected synchronized SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyy-MM");
		}
	};

	private static ThreadLocal<SimpleDateFormat> yearDateFormat = new ThreadLocal<SimpleDateFormat>() {
		protected synchronized SimpleDateFormat initialValue() {
			return new SimpleDateFormat("yyyy");
		}
	};

	protected synchronized static SimpleDateFormat getFullDateFormat() {
		return fullDateFormat.get();
	}

	protected synchronized static SimpleDateFormat getSimpleDateFormat() {
		return simpleDateFormat.get();
	}

	protected synchronized static SimpleDateFormat getYmDateFormat() {
		return ymDateFormat.get();
	}

	protected synchronized static SimpleDateFormat getYearDateFormat() {
		return yearDateFormat.get();
	}

	// public static void main(String[] args) {
	// Date day1 = new Date();
	// Date day2 = DateUtils.getNextSecondForDate(day1,
	// -200);//DateUtils.getNextMonthForDate(day1, -2);

	// System.out.println(org.apache.commons.lang.time.DateUtils.isSameDay(day1,
	// day2));
	// for (int i = 0; i < 200; i++) {
	// executor.execute(new Runnable() {
	//
	// @Override
	// public void run() {
	// System.out.println("^^^^^   " +
	// getFullDateFormat().format(DateUtils.now()));
	// System.out.println("--------    " +
	// SDF_DATE_FORMAT.format(DateUtils.now()));
	// System.out.println(DateFormatUtils.format(DateUtils.now(),
	// "yyyy-MM-dd HH:mm:ss"));
	// try {
	// System.out.println(org.apache.commons.lang.time.DateUtils
	// .parseDate("2012-03-20 00:00:00", pattern));
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// }
	// });
	// }
	// }

}
