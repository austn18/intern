package kt.c.control;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import kt.c.dao.BoardDAO;
import kt.c.vo.BoardFileVO;
import kt.c.vo.BoardVO;
import kt.c.vo.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
@SessionAttributes("userVO")
// 확장자를 주지 않아도 찾는다
public class BoardController {
	@Autowired
	BoardDAO boardDAO;

	@Autowired
	ServletContext servletContext;

	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		model.addAttribute("list", boardDAO.selectAll());
		return "/view/board/list.jsp";
	}

	@RequestMapping("/detail")
	public String detail(String type, int no, Model model) throws Exception {

		if (type != null && type.equals("list")) {
			boardDAO.updateViewCnt(no);
		}

		model.addAttribute("board", boardDAO.selectByNo(no));
		model.addAttribute("fileList", boardDAO.selectFileBoard(no));

		return "/view/board/detail.jsp";
	}

	@RequestMapping("/delete")
	public String detele(int no) throws Exception {

		boardDAO.deleteFile(no);
		boardDAO.delete(no);

		return "redirect:list.do";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO board) throws Exception {

		boardDAO.update(board);

		return "redirect:list.do";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateForm(int no, Model model) throws Exception {
		BoardVO board = boardDAO.selectByNo(no);
		model.addAttribute("board", board);

		return "/view/board/updateForm.jsp";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeForm() throws Exception {
		return "/view/board/writeForm.jsp";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute("userVO") LoginVO userVO,
			BoardVO board, MultipartFile attachFile1,
			MultipartFile attachFile2, // 업로드 파일 데이터 받기
			HttpServletRequest request) throws Exception {


		board.setWriter(userVO.getId());
		board.setNo(boardDAO.selectBoardNo());

		System.out.println(attachFile1.getOriginalFilename());
		System.out.println(attachFile1.getName());

		boardDAO.insert(board);


		saveFile(board.getNo(), attachFile1);
		saveFile(board.getNo(), attachFile2);

		return "redirect:list.do";

	}

	private void insertBoardFile(String oiginFilename, String savedFilename,
			int size, int boardNo) {
		BoardFileVO fileVO = new BoardFileVO();
		fileVO.setFileOriName(oiginFilename);
		fileVO.setFileSaveName(savedFilename);
		fileVO.setFileSize(size);
		fileVO.setBoardNo(boardNo);
	}

	private void saveFile(int boardNo, MultipartFile uploadFile)
			throws Exception {
		if (uploadFile.isEmpty())
			return;
		// 원래 파일명 알아내기
		String originFilename = uploadFile.getOriginalFilename();

		// 마지막 .의 위치 알아내기
		int index = originFilename.lastIndexOf(".");

		// 파일 확장명 알아내기
		String extName = originFilename.substring(index);
		String filename = "file_" + System.currentTimeMillis() + "_"
				+ Math.random() + extName;

		// 저장할 폴더 경로 알아내기
		String saveFolder = servletContext.getRealPath("/upload");

		// 파일정보를 파일객체에담는다
		File savedFile = new File(saveFolder + "/" + filename);

		// 임시 파일을 지정된 경로로 옮긴다.
		uploadFile.transferTo(savedFile);

		insertBoardFile(uploadFile.getOriginalFilename(), filename,
				(int) uploadFile.getSize(), boardNo);

	}
}
