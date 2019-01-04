package main.java.web.web.util.service;

import org.apache.log4j.Logger;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import main.java.web.web.util.IInitDataLoad;

public class SynContext {
	private transient final static Logger logger = Logger.getLogger("synlog");
	private static ApplicationContext context;
	private String[] springConfigArray;

	public SynContext() {

	}

	public void setSpringConfigArray(String[] springConfigArray) {
		this.springConfigArray = springConfigArray;
	}

	public static void setContext() {
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(new String[] {
				"classpath:main/java/dao/resources/spring/box-dao.xml",
				"classpath:main/java/dao/resources/spring/box-datasource.xml",
				"classpath:main/java/service/resources/spring/box-service.xml" });
		SynContext.context = applicationContext;
	}

	public static void setContext(ApplicationContext context) {
		SynContext.context = context;
	}

	public static T getObject(String name, Class<T> requiredType) {
		return context.getBean(name, requiredType);
	}

	public static Object getObject(String name) {
		return context.getBean(name);
	}

	public void initConft() throws Exception {
		if (springConfigArray == null || springConfigArray.length < 1)
			throw new Exception("配置文件不能为空");
		context = new ClassPathXmlApplicationContext(springConfigArray);
		logger.info("初始化配置文件成功");
	}

	public void initLoadData() {
		IInitDataLoad initDataLoad = (IInitDataLoad) getObject("initDataLoadImpl");
		initDataLoad.load();// !!!!
	}

}
