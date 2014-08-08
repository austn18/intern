//package kt.c.listener;
//
//import javax.servlet.ServletContext;
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//
//public class CopyOfContextLoaderListener implements ServletContextListener{
//
//	@Override
//	public void contextInitialized(ServletContextEvent sce) {
//		System.out.println("ContextLoaderListener.contextInitialized()");
//		ServletContext ctx = sce.getServletContext();
//		ctx.setAttribute("contextRoot", ctx.getContextPath());
//	}
//
//	@Override
//	public void contextDestroyed(ServletContextEvent sce) {
//		// TODO Auto-generated method stub
//		System.out.println("ContextLoaderListener.contextDestroyed()");
//		
//	}
//
//}
