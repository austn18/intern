package ex01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test02 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex01/beans.xml");
		//getBean(���̵�/����) : �����̳ʿ��� �ش� ID �� ������ ���� ��ü�� ã�� ����, ������ ����
		Car p = (Car)ctx.getBean("car1");
	}
}
