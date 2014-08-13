package kt.c.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ContextLoaderListener01 implements ServletContextListener {

	// OracleDataSource dataSource;
	ServletContext ctx;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ctx = sce.getServletContext();
		ctx.setAttribute("contextRoot", ctx.getContextPath());
		

		try {
			
			ApplicationContext appCtx = new ClassPathXmlApplicationContext(
					new String[]{
						"kt/c/conf/application-context.xml" // 스프링 설정 파일 위치(classpath 기준)
					});
			
			ctx.setAttribute("beanContainer", appCtx);
			
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
