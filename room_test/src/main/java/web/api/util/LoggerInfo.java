package main.java.web.api.util;

import org.apache.log4j.Logger;

public class LoggerInfo {

	private transient final static Logger logger = Logger
			.getLogger(LoggerInfo.class);
	private static boolean enable_log = true;
	private static boolean show_screen = true;
	private static boolean write_log = true;

	public LoggerInfo() {

	}

	public static void outPrintln(Object message) {
		if (enable_log) {
			System.out.println(message);
		}
	}

	public static void writeLogInfo(Object message) {
		if (enable_log) {
			logger.info(message);
		}
	}

	public static void info(Object message) {
		if (show_screen) {
			outPrintln(message);
		}
		if (write_log) {
			writeLogInfo(message);
		}
	}
}
