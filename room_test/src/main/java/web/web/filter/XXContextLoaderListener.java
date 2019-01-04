package main.java.web.web.filter;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import main.java.web.web.util.service.SynContext;

public class XXContextLoaderListener extends ContextLoaderListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// TODO Auto-generated method stub
		super.contextInitialized(event);
		
		WebApplicationContext context = getCurrentWebApplicationContext();
		SynContext.setContext(context);
		
	}
}
