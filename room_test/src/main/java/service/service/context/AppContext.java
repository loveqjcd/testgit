/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package main.java.service.service.context;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AppContext {

	private static ApplicationContext context;

	public static void setContext() {
		if (context == null) {
			context = new ClassPathXmlApplicationContext(new String[] { 
					"classpath:main/java/dao/resources/spring/box-dao.xml",
					"classpath:main/java/dao/resources/spring/box-dao-sequence.xml",
					"classpath:main/java/dao/resources/spring/box-datasource.xml",
					"classpath:main/java/service/resources/spring/box-service.xml"});
		}
	}

	public static void setContext(ApplicationContext context) {
		AppContext.context = context;
	}

	public static ApplicationContext getContext() {
		return context;
	}

	public static Object getBean(String name) {
		if (context == null) {
			setContext();
		}
		return context.getBean(name);
	}

}
