package kr.co.kt.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doGet 메소드 호출");
		/*
		 * 1.요청객체에서 넘겨준 데이터를 추출
		 */
		String method = req.getMethod();
		String uri = req.getRequestURI(); //요청객체의 uri 를 가져옴
		String id = req.getParameter("title");
		/*
		 * 2-1. 콘솔창에 출력
		 */
		System.out.println(method);
		System.out.println(uri);
		System.out.println(id);
		/*
		 * 2-2. 서버에서 클라이언트에게 정보 전달
		 * 		서버가 html 전달 -> 클라이언트 출력
		 * 		일반 텍스트 : getWriter()
		 * 		이미지 	  : getOutputStream()
		 */
		resp.setContentType("text/html;charset=euc-kr"); //받는 내용의 타입을 설정
		PrintWriter out = resp.getWriter(); // writer을 이용하여 내용을 수신
		//뿌려주는 부분(html태그)
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>메소드 호출 방식</title>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("요청방식 : " + method + "<br/>");
		sb.append("요청 URI : " + uri + "<br/>");
		sb.append("파라미터(id) : " + id + "<br/>");
		sb.append("</body>");
		out.println(sb.toString());
		out.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doPost 메소드 호출");
		//수신시 수신된 정보를 인코딩!!, 포스트방식만 지원
		//서블릿 2.3 이후
		req.setCharacterEncoding("euc-kr");
		
		
		String method = req.getMethod();
		String uri = req.getRequestURI();
		
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String contents = req.getParameter("contents");
		System.out.println("method : " + method);
		System.out.println("uri : " + uri);
		System.out.println("title : " + title);
		System.out.println("writer : " + writer);
		System.out.println("contents : " + contents);
		
		resp.setContentType("text/html;charset=euc-kr"); 
		PrintWriter out = resp.getWriter(); 

		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>메소드 호출 방식</title>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("요청방식 : " + method + "<br/>");
		sb.append("요청 URI : " + uri + "<br/>");
		sb.append("파라미터(title) : " + title + "<br/>");
		sb.append("파라미터(writer) : " + writer + "<br/>");
		sb.append("파라미터(contents) : " + contents + "<br/>");
		sb.append("</body>");
		out.println(sb.toString());
		out.close();
	
		
		
	}
	

}
