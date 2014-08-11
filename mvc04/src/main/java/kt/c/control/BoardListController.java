package kt.c.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.annotation.Component;
import kt.c.dao.BoardDAO;
@Component("/board/list.do")
public class BoardListController implements Controller {
	BoardDAO boardDAO;
	
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}//Dependency injection

	@Override 
	public String execute(HttpServletRequest request, HttpServletResponse response)
	    throws Exception{
		request.setAttribute("list", boardDAO.selectAll());
		return "/view/board/list.jsp";
	}
}
