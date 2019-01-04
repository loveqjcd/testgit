package main.java.common.util;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonParser;

/**
 * created 2013-7-4 - 上午11:50:07 StrUtils.java
 * 
 * @explain -
 */
public class StrUtils {

	private static final String mobileRegex = "^(\\+86|0086)?\\s?1[\\d]{10}$";
	private static final String emailRegex = "^(\\w)+(\\.\\w+)*@(\\w)+(\\.\\w+)*((\\.(com|cn|net){1,3}+)+)$";

	private static Gson gson = new Gson();

	private static Gson gsonBuilder;

	private static JsonParser gsonParer;

	static {
		gsonBuilder = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().enableComplexMapKeySerialization().serializeNulls()
				.setDateFormat("yyyy-MM-dd HH:mm:ss").setPrettyPrinting().setVersion(1.0).create();
		gsonParer = new JsonParser();
	}

	/**
	 * 获取合法的手机号码
	 * 
	 * @param mobile
	 * @return
	 */
	public static String getMobile(String mobile) {
		if (isMobile(mobile)) {
			return mobile;
		}
		return null;
	}

	/**
	 * 验证手机号码是否合法
	 * 
	 * @param mobile
	 * @return
	 */
	public static boolean isMobile(String mobile) {
		if (isNotEmpty(mobile)) {
			return Pattern.matches(mobileRegex, mobile);
		}
		return Boolean.FALSE;
	}

	/**
	 * 手机号段类型
	 * 
	 * @param mobile
	 * @return
	 */
	public static String getMobileType(String mobile) {
		if (isMobile(mobile)) {
			if (mobile.startsWith("1")) {
				return mobile.substring(0, 3);
			} else {
				return mobile.substring(mobile.indexOf("1"), (mobile.indexOf("1") + 3));
			}
		}
		return null;
	}

	/**
	 * 数据库邮箱长度为 100 默认取 100
	 * 
	 * @param email
	 * @return
	 */
	public static String getEmail(String email) {
		return getEmail(email, 100);
	}

	/**
	 * 获取合法的邮箱地址 ，
	 * 
	 * @param email
	 * @param len
	 *            长度
	 * @return
	 */
	public static String getEmail(String email, int len) {
		if (isEmail(email)) {
			if (email.length() > len) {
				return null;
			} else {
				return email;
			}
		}
		return null;
	}

	/**
	 * 验证邮箱地址是否合法
	 * 
	 * @param email
	 * @return
	 */
	public static boolean isEmail(String email) {
		if (isNotEmpty(email)) {
			return Pattern.matches(emailRegex, email);
		}
		return Boolean.FALSE;
	}

	/**
	 * @param email
	 * @return
	 */
	public static String getEmailType(String email) {
		return getEmailType(email, null);
	}

	/**
	 * 获取邮箱类型,默认长度为50，数据库长度为50
	 * 
	 * @param email
	 * @param len
	 * @return
	 */
	public static String getEmailType(String email, Integer len) {
		if (len == null) {
			len = 50;
		}
		if (isEmail(email)) {
			String type = email.substring((email.indexOf("@") + 1), email.length());
			if (isNotEmpty(type)) {
				if (type.length() < len) {
					return type;
				}
			}
		}
		return null;
	}

	/**
	 * 去除空格，不只是两端
	 * 
	 * @param str
	 * @return
	 */
	public static String trim(String str) {
		if (isNotEmpty(str)) {
			return str.replaceAll(" ", "");
		} else {
			return str;
		}
	}

	/**
	 * 判断一个字符串是否为空，空格作空处理
	 */
	public static boolean isEmpty(String str) {
		return ((str == null) || (str.replaceAll(" ", "").length() == 0));
	}

	public static boolean isNotEmpty(String str) {
		return ((str != null) && (str.replaceAll(" ", "").length() > 0));
	}

	public static Gson getGson() {
		return gson;
	}

	public static JsonParser getGsonParer() {
		return gsonParer;
	}

	public static Gson getGsonBuilder() {
		return gsonBuilder;
	}

	public static String subString(String string, Integer len) {
		if (len == null || !StrUtils.isNotEmpty(string)) {
			return string;
		}
		if (string.length() > len) {
			return string.substring(0, len);
		} else {
			return string;
		}
	}

	public static String exToString(Exception e, Integer len) {
		if (e == null) {
			return null;
		}
		StringBuilder sb = new StringBuilder();
		StackTraceElement[] ex = e.getStackTrace();
		for (StackTraceElement stackTraceElement : ex) {
			sb.append(stackTraceElement.toString()).append("\n");
		}
		if (len == null) {
			return sb.toString();
		} else {
			return subString(sb.toString(), len);
		}
	}

	/**
	 * 对list进行排序 小的，位数短的 排在前面。
	 * 
	 * @param list
	 */
	@SuppressWarnings("unchecked")
	public static void sort(@SuppressWarnings("rawtypes") List list) {
		if (list == null || list.isEmpty()) {
			throw new IllegalArgumentException(" list can't be null . ");
		}
		Collections.sort(list, new Comparator<Object>() {
			@Override
			public int compare(Object o1, Object o2) {
				if (o1 instanceof java.lang.String) {
					return strCompare(o1, o2);
				} else if (o1 instanceof java.lang.Integer) {
					return numCompare(o1, o2);
				} else {
					throw new IllegalArgumentException(" list type must string or Integer . ");
				}
			}

			private int strCompare(Object o1, Object o2) {
				String s1 = (String) o1;
				String s2 = (String) o2;
				int len1 = s1.length();
				int len2 = s2.length();
				if (len1 != len2) {
					return len1 - len2;
				}
				int n = Math.min(len1, len2);
				char v1[] = s1.toCharArray();
				char v2[] = s2.toCharArray();
				int pos = 0;
				while (n-- != 0) {
					char c1 = v1[pos];
					char c2 = v2[pos];
					if (c1 != c2) {
						return c1 - c2;
					}
					pos++;
				}
				return len1 - len2;
			}

			private int numCompare(Object o1, Object o2) {
				Integer i1 = (Integer) o1;
				Integer i2 = (Integer) o2;
				return i1 - i2;
			}

		});
	}

	public static String trimToEmpty(String str) {
		return str == null ? "" : str.trim();
	}

	public static boolean isNum(String content) {
		Pattern p = Pattern.compile("^(-?\\d+)|((-?\\d+)(\\.\\d+))$");
		Matcher m = p.matcher(content);
		return m.matches();
	}

	public static String getSellerId(String str) {
		Long now = System.currentTimeMillis();
		Integer n = (int) (Math.random() * 900 + 100);

		return str + now.toString() + n.toString();
	}

	public static boolean equalsIgnoreCase(String str1, String str2) {
		if (str1 == null) {
			return str2 == null;
		}
		return str1.equalsIgnoreCase(str2);
	}

	private static final double EARTH_RADIUS = 6378137;

	private static double rad(double d) {
		return d * Math.PI / 180.0;
	}

	/**
	 * 根据两点间经纬度坐标（double值），计算两点间距离，单位为米
	 * 
	 * @param lng1
	 * @param lat1
	 * @param lng2
	 * @param lat2
	 * @return
	 */
	public static double GetDistance(double lng1, double lat1, double lng2, double lat2) {
		double radLat1 = rad(lat1);
		double radLat2 = rad(lat2);
		double a = radLat1 - radLat2;
		double b = rad(lng1) - rad(lng2);
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
		s = s * EARTH_RADIUS;
		s = Math.round(s * 10000) / 10000;
		return s;
	}

	/**
	 * 生成订单编号
	 * 
	 * @return
	 */
	public static String getOrderNo() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		Date date = new Date();
		String s1 = sdf.format(date);
		String s2 = "";
		long ms = date.getTime() % 1000;
		if (ms >= 0l && ms < 10l) {
			s2 = "00" + ms;
		} else if (ms >= 10l && ms < 100) {
			s2 = "0" + ms;
		} else {
			s2 = "" + ms;
		}
		return s1 + s2;
	}

	/**
	 * 生成付款编号
	 * 
	 * @return
	 */
	public static String getPayNo() {
		long ms = new Date().getTime();
		return ms + "" + (1000 + Math.random() * 9000);
	}

	/**
	 * 生成订单兑换码
	 * 
	 * @return
	 */
	public static String getOrderCode() {

		return (100000 + Math.random() * 900000) + "";
	}

}
