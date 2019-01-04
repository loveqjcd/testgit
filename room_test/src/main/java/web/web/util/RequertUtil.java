package main.java.web.web.util;

import javax.servlet.http.HttpServletRequest;

public class RequertUtil {

	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip != null) {
			String[] ipArray = ip.split(",");
			if (ipArray != null && ipArray.length > 1) {
				ip = ipArray[0];
			}
		}
		return ip;
	}

}
