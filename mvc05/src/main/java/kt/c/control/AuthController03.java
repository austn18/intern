package kt.c.control;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kt.c.dao.LoginDAO;
import kt.c.vo.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//@Controller
@RequestMapping("/auth")//클래스 선언부에서 기본 URL을 지정하고, 요청 핸들러에서 나머지URL 지정
public class AuthController03 {
	@Autowired
	LoginDAO loginDAO;
	//ServletContext 객체는 파라미터로 받을 수 없다.
	//대신, 인스턴스변수를 통해 주입받을 수 있다.
	@Autowired
	ServletContext servletContext;

	// 요청 명령에 따라 호출될 메서드 구분 하는 법(get/post)
	@RequestMapping(value ="/login",method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "/view/auth/login.jsp";
	}

	@RequestMapping(value ="/login", method = RequestMethod.POST)
	public String login(LoginVO loginVO, HttpSession session) throws Exception {
		
		// 서블릿 컨텍스트에서 request 를 가져온다(IoC 컨텍스트가 해줌)
		LoginVO userVO = loginDAO.login(loginVO);

		if (userVO != null) {
			session.setAttribute("userVO", userVO);
			return "/view/auth/loginProcess.jsp";
		} else {
			return "redirect:login.do";
		}
	}
	@RequestMapping(value ="/logout") //메서드 프로퍼티 지정 않으면 모두 허용
	public String logout(HttpSession session) throws ServletException, IOException {
		//세션을 파라메터로 받을수 있지만 ServletContext 는 받을 수 없다
		session.invalidate();
		return "redirect:/"; //스프링에서 redirect url루트는 웹 어플리케이션 루트를 의미한다
	}



}
