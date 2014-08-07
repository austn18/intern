package kt.c.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.dao.BoardDAO;
import kt.c.vo.BoardVO;

@WebServlet("/board/update")
public class BoardUpdateServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		int no = Integer.parseInt(request.getParameter("no"));
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.selectByNo(no);
		request.setAttribute("board", board);
  
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/board/updateForm.jsp");

		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		BoardVO board = new BoardVO();
		board.setNo(no);
		board.setTitle(title);
		board.setContent(content);

		BoardDAO dao = new BoardDAO();
		dao.update(board);
		
		response.sendRedirect("list");


		
	}
}
