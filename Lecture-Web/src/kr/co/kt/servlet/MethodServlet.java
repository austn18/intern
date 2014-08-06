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
		System.out.println("doGet �޼ҵ� ȣ��");
		/*
		 * 1.��û��ü���� �Ѱ��� �����͸� ����
		 */
		String method = req.getMethod();
		String uri = req.getRequestURI(); //��û��ü�� uri �� ������
		String id = req.getParameter("title");
		/*
		 * 2-1. �ܼ�â�� ���
		 */
		System.out.println(method);
		System.out.println(uri);
		System.out.println(id);
		/*
		 * 2-2. �������� Ŭ���̾�Ʈ���� ���� ����
		 * 		������ html ���� -> Ŭ���̾�Ʈ ���
		 * 		�Ϲ� �ؽ�Ʈ : getWriter()
		 * 		�̹��� 	  : getOutputStream()
		 */
		resp.setContentType("text/html;charset=euc-kr"); //�޴� ������ Ÿ���� ����
		PrintWriter out = resp.getWriter(); // writer�� �̿��Ͽ� ������ ����
		//�ѷ��ִ� �κ�(html�±�)
		StringBuilder sb = new StringBuilder();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>�޼ҵ� ȣ�� ���</title>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("��û��� : " + method + "<br/>");
		sb.append("��û URI : " + uri + "<br/>");
		sb.append("�Ķ����(id) : " + id + "<br/>");
		sb.append("</body>");
		out.println(sb.toString());
		out.close();
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("doPost �޼ҵ� ȣ��");
		//���Ž� ���ŵ� ������ ���ڵ�!!, ����Ʈ��ĸ� ����
		//���� 2.3 ����
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
		sb.append("<title>�޼ҵ� ȣ�� ���</title>");
		sb.append("</head>");
		sb.append("<body>");
		sb.append("��û��� : " + method + "<br/>");
		sb.append("��û URI : " + uri + "<br/>");
		sb.append("�Ķ����(title) : " + title + "<br/>");
		sb.append("�Ķ����(writer) : " + writer + "<br/>");
		sb.append("�Ķ����(contents) : " + contents + "<br/>");
		sb.append("</body>");
		out.println(sb.toString());
		out.close();
	
		
		
	}
	

}
