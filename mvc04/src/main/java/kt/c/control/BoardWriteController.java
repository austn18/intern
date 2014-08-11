package kt.c.control;

import java.io.File;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.annotation.Component;
import kt.c.dao.BoardDAO;
import kt.c.util.BitFileNamePolicy;
import kt.c.vo.BoardFileVO;
import kt.c.vo.BoardVO;
import kt.c.vo.LoginVO;

import com.oreilly.servlet.MultipartRequest;
@Component("/board/write.do")
public class BoardWriteController implements Controller{
	BoardDAO boardDAO;
	
	public void setBoardDAO(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if(request.getMethod().equals("GET")){
			return "/view/board/writeForm.jsp";
		}else{ // POST
			String saveFolder = request.getServletContext().getRealPath("/upload"); 

			MultipartRequest multi = new MultipartRequest(
					request
					, saveFolder			// ����� ���
					, 1024 * 1024 * 3 		// ���Ͽ� �ø� �ִ�ũ�� : 3MB
					, "utf-8"				// ���ڵ� Ÿ��
					, new BitFileNamePolicy()
					);

			// �Է��� ������ DB�� ����
			// 1. �Խù� ����
			String title = multi.getParameter("title");
			LoginVO loginVO = (LoginVO)(request.getSession().getAttribute("userVO"));
			String writer = loginVO.getId();
			String content = multi.getParameter("content");


			int boardNo = boardDAO.selectBoardNo();

			BoardVO board = new BoardVO();
			
			board.setTitle(title);
			board.setWriter(writer);
			board.setContent(content);
			board.setNo(boardNo);

			boardDAO.insert(board);

			// 2. �Խù��� ÷������ ����
			Enumeration<?> files =  multi.getFileNames();

			while(files.hasMoreElements()) {
				
				String fileName = (String)files.nextElement();
				File f = multi.getFile(fileName);
				if(f != null) {
					
					String fileOriName = multi.getOriginalFileName(fileName);
					String fileSaveName = multi.getFilesystemName(fileName);
					
					BoardFileVO fileVO = new BoardFileVO();
					fileVO.setFileOriName(fileOriName);
					fileVO.setFileSaveName(fileSaveName);
					fileVO.setFileSize((int)f.length());
					fileVO.setBoardNo(boardNo);
					
					boardDAO.insertFile(fileVO);
				}
			}
			
			return "redirect:list.do";
		}
	}

}
