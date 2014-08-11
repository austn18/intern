package kt.c.listener;

import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

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
	
	//OracleDataSource dataSource;
	DataSource dataSource;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext ctx = sce.getServletContext();
		ctx.setAttribute("contextRoot", ctx.getContextPath());
		
		try {
			//initialContext : JNDI(Java Naming and Directory Interface) 자원 조회 도구
			//JNDI? DB 커넥션, 스레드등 자바자원에 대해 이름을 부여하고 디렉토리 형식으로 분류 관리하는 서비스
			//유사개념 : 웹 도메인 서비스
			Context initCtx = new InitialContext();
			dataSource = (DataSource)initCtx.lookup("java:/comp/env/jdbc/xe");
			
			BoardDAO boardDAO = new BoardDAO();
			boardDAO.setDataSource(dataSource);
			LoginDAO loginDAO = new LoginDAO();
			loginDAO.setDataSource(dataSource);
			
			ctx.setAttribute("/auth/login.do", new LoginController().setLoginDAO(loginDAO));
			ctx.setAttribute("/auth/logout.do", new LogoutController());
			ctx.setAttribute("/board/list.do", new BoardListController().setBoardDAO(boardDAO));
			ctx.setAttribute("/board/detail.do", new BoardDetailController().setBoardDAO(boardDAO));
			ctx.setAttribute("/board/delete.do", new BoardDeleteController().setBoardDAO(boardDAO));
			ctx.setAttribute("/board/update.do", new BoardUpdateController().setBoardDAO(boardDAO));
			ctx.setAttribute("/board/write.do", new BoardWriteController().setBoardDAO(boardDAO));
			//객체를 리스너에 저장 ==> 스프링 특징!!!
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		//try {dataSource.close();} catch (Throwable e) {}
		//데이터베이스에서 알아서 close 한다.
	}

}
