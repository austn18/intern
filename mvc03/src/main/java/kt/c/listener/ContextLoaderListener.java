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
import kt.c.dao.BoardDAO;
import kt.c.dao.LoginDAO;

public class ContextLoaderListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("ContextLoaderListener.contextInitialized()");
		ServletContext ctx = sce.getServletContext();
		ctx.setAttribute("contextRoot", ctx.getContextPath());
		
		BoardDAO boardDAO = new BoardDAO();
		LoginDAO loginDAO = new LoginDAO();

		ctx.setAttribute("/auth/login.do", new LoginController().setLoginDAO(loginDAO));
		ctx.setAttribute("/auth/logout.do", new LogoutController());
		ctx.setAttribute("/board/list.do", new BoardListController().setBoardDAO(boardDAO));
		ctx.setAttribute("/board/detail.do", new BoardDetailController().setBoardDAO(boardDAO));
		ctx.setAttribute("/board/delete.do", new BoardDeleteController().setBoardDAO(boardDAO));
		ctx.setAttribute("/board/update.do", new BoardUpdateController().setBoardDAO(boardDAO));
		ctx.setAttribute("/board/write.do", new BoardWriteController().setBoardDAO(boardDAO));
		//��ü�� �����ʿ� ���� ==> ������ Ư¡!!!
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		System.out.println("ContextLoaderListener.contextDestroyed()");

	}

}
