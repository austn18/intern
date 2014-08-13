package kt.c.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.dao.LoginDAO;
import kt.c.vo.LoginVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@Controller
//@RequestMapping("/auth/login") //각 요청 핸들러에서 URL을 매핑할 수 있다.
public class LoginController02 {
	@Autowired
	LoginDAO loginDAO;

	// 요청 명령에 따라 호출될 메서드 구분 하는 법(get/post)
	@RequestMapping(value ="/auth/login",method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "/view/auth/login.jsp";
	}

	@RequestMapping(value ="/auth/login", method = RequestMethod.POST)
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



}
