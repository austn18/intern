package kt.c.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kt.c.dao.LoginDAO;
import kt.c.vo.LoginVO;

@WebServlet("/auth/login")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginServlet.doGet()...");
		RequestDispatcher rd = request.getRequestDispatcher("/view/auth/login.jsp");
		rd.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("LoginServlet.doPost()...");
		

		LoginVO userVO = new LoginDAO().login(new LoginVO()
							.setId(request.getParameter("id"))
							.setPassword(request.getParameter("password")));
		
		if(userVO != null){
			request.getSession().setAttribute("userVO", userVO);
			RequestDispatcher rd = request.getRequestDispatcher(
					"/view/auth/loginProcess.jsp");
			rd.forward(request, response);
			
		}else{
			response.sendRedirect("login");
			
		}

	}
	
	
}
