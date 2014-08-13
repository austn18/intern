package kt.c.control;

import java.util.Map;

import kt.c.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller("/board/list")
//확장자를 주지 않아도 찾는다
public class BoardListController{
	@Autowired
	BoardDAO boardDAO;
	
	//요청 핸들러 작성 규칙 예1
	// 리턴타입 : ModelAndView
	// ==> 페이지컨트롤러가 작업한 결과를 보관하고 뷰 컴포넌트(JSP)의 URL을 저장하는 객체
//	// ==> 프론트 컨트롤러에게 리턴하면, 프롤트 컨트롤러가 이 객체에서 값을 꺼내 처리한다.
//	@RequestMapping 
//	public ModelAndView execute() throws Exception{
//		ModelAndView mv = new M odelAndView();
//		mv.addObject("list", boardDAO.selectAll());
//		mv.setViewName("/view/board/list.jsp");
//		return mv;
//	}
	
//	//요청 핸들러 작성 규칙 예2
//	//리턴타입 : String
//	@RequestMapping 
//	public String execute(Model model) throws Exception{
//		model.addAttribute("list", boardDAO.selectAll());
//		return "/view/board/list.jsp";
//	}
	//요청 핸들러 작성 규칙 예3
	//리턴타입 : String
	//파라미터 Map
	@RequestMapping 
	public String execute(Map<String, Object> model) throws Exception{
		model.put("list", boardDAO.selectAll());
		return "/view/board/list.jsp";
	}
}
