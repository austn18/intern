package kt.c.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.dao.BoardDAO;

public class BoardListController implements Controller {
	BoardDAO boardDAO;
	
	public Controller setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
		return this;
	}//Dependency injection

	@Override 
	public String execute(HttpServletRequest request, HttpServletResponse response)
	    throws Exception{
		request.setAttribute("list", boardDAO.selectAll());
		return "/view/board/list.jsp";
	}
}
