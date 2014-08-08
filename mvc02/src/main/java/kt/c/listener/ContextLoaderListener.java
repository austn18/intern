package kt.c.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import kt.c.control.BoardDeleteController;
import kt.c.control.BoardDetailController;
import kt.c.control.BoardListController;
import kt.c.control.BoardUpdateController;
import kt.c.control.BoardWriteController;
import kt.c.control.LoginController;
import kt.c.control.LogoutController;

public class ContextLoaderListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("ContextLoaderListener.contextInitialized()");
		ServletContext ctx = sce.getServletContext();
		ctx.setAttribute("contextRoot", ctx.getContextPath());

		ctx.setAttribute("/auth/login.do", new LoginController());
		ctx.setAttribute("/auth/logout.do", new LogoutController());
		ctx.setAttribute("/board/list.do", new BoardListController());
		ctx.setAttribute("/board/detail.do", new BoardDetailController());
		ctx.setAttribute("/board/detail.do", new BoardDetailController());
		ctx.setAttribute("/board/delete.do", new BoardDeleteController());
		ctx.setAttribute("/board/update.do", new BoardUpdateController());
		ctx.setAttribute("/board/write.do", new BoardWriteController());
		//객체를 리스너에 저장 ==> 스프링 특징!!!
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("ContextLoaderListener.contextDestroyed()");

	}

}
