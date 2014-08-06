package kt.c.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kt.board.db.BoardDAO;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	    throws ServletException, IOException {
		
		// 1. BoardDAO 도구를 준비
		BoardDAO dao = new BoardDAO();
		
		// 2. BoardDAO 도구를 사용해서 게시물 목록을 가져옴.
		req.setAttribute("list", dao.selectAll());
		
		// 3. JSP로 화면 처리를 위임하기 위해 요청 배달자를 준비
		RequestDispatcher rd = req.getRequestDispatcher("/view/board/list.jsp");
		
		// 4. 요청 배달자에게 요청 배달을 요구함.
		rd.forward(req, resp);
		
		
	}
}













