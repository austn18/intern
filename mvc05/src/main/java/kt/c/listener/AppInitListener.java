package kt.c.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class AppInitListener implements ServletContextListener {


	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("AppInitListener.contextInitialized()");
		ServletContext ctx = sce.getServletContext();
		ctx.setAttribute("contextRoot", ctx.getContextPath());
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
