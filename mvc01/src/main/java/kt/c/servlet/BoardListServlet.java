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
		
		BoardDAO dao = new BoardDAO();
		
		req.setAttribute("list", dao.selectAll());
		
		RequestDispatcher rd = req.getRequestDispatcher("/view/board/list.jsp");
		
		rd.forward(req, resp);
		
		
	}
}













