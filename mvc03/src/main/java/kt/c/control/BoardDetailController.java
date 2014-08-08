package kt.c.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.dao.BoardDAO;

public class BoardDetailController implements Controller {

	BoardDAO boardDAO;
	
	public Controller setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
		return this;
	}
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String type = request.getParameter("type");
		int no = Integer.parseInt(request.getParameter("no"));

		if (type != null && type.equals("list")) {
			boardDAO.updateViewCnt(no);
		}
		
		request.setAttribute("board", boardDAO.selectByNo(no));
		request.setAttribute("fileList", boardDAO.selectFileBoard(no));
		
		return "/view/board/detail.jsp";
	}

}
