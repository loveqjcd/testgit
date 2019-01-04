package main.java.common.util;

import java.io.IOException;
import java.util.Properties;

public class PropertyUtils {

	public static Properties prop;
	
	static{
		prop = new Properties();
		try {
			//prop.load(PropertyUtils.class.getClassLoader().getResourceAsStream("parameter.properties"));
			prop.load(PropertyUtils.class.getResourceAsStream("/main/java/common/resources/parameter.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String getValue(String key) {
		String value = prop.getProperty(key);
		return StrUtils.isEmpty(value) ? "" : value.toString().trim();
	}
	
	public static void main(String[] args) {
		System.out.println(getValue("thisapp"));
	}
	
}
