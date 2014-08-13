package kt.c.control;

import javax.servlet.http.HttpServletRequest;

import kt.c.dao.LoginDAO;
import kt.c.vo.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
@RequestMapping("/auth/login.do")
public class LoginController01 {
	@Autowired
	LoginDAO loginDAO;

	// 요청 명령에 따라 호출될 메서드 구분 하는 법(get/post)
	@RequestMapping(method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "/view/auth/login.jsp";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String login(HttpServletRequest request) throws Exception {
		// 서블릿 컨텍스트에서 request 를 가져온다(IoC 컨텍스트가 해줌)
		LoginVO userVO = loginDAO.login(new LoginVO().setId(
				request.getParameter("id")).setPassword(
				request.getParameter("password")));

		if (userVO != null) {
			request.getSession().setAttribute("userVO", userVO);
			return "/view/auth/loginProcess.jsp";
		} else {
			return "redirect:login.do";
		}
	}

	/*
	 * @RequestMapping public String execute(HttpServletRequest request) throws
	 * Exception { //서블릿 컨텍스트에서 request 를 가져온다(IoC 컨텍스트가 해줌)
	 * if(request.getMethod().equals("GET")){ return "/view/auth/login.jsp";
	 * }else{ // POST LoginVO userVO = loginDAO.login(new LoginVO()
	 * .setId(request.getParameter("id"))
	 * .setPassword(request.getParameter("password")));
	 * 
	 * if(userVO != null){ request.getSession().setAttribute("userVO", userVO);
	 * return "/view/auth/loginProcess.jsp"; }else{ return "redirect:login.do";
	 * } }
	 * 
	 * }
	 */

}
