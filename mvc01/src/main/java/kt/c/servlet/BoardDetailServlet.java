package kt.c.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.dao.BoardDAO;

@WebServlet("/board/detail")
public class BoardDetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		int no = Integer.parseInt(request.getParameter("no"));

		BoardDAO dao = new BoardDAO();
		if (type != null && type.equals("list")) {
			dao.updateViewCnt(no);
		}
		
		request.setAttribute("board", dao.selectByNo(no));
		request.setAttribute("fileList", dao.selectFileBoard(no));
		RequestDispatcher rd = request
				.getRequestDispatcher("/view/board/detail.jsp");

		rd.forward(request, response);

	}

}
