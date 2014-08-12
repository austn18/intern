package ex02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test07 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex02/beans.xml");
		//getBean(���̵�/����) : �����̳ʿ��� �ش� ID �� ������ ���� ��ü�� ã�� ����, ������ ����
		Car p5= (Car)ctx.getBean("car5");
		System.out.println(p5.toString());
		
		Car p6 = (Car)ctx.getBean("car6");
		System.out.println(p6.toString());
		
		Engine engine2 = (Engine)ctx.getBean("engine2");
		Engine engine3 = (Engine)ctx.getBean("engine2");
		
		// Object Ŭ�����κ��� ��ӹ��� HashCode()��
		// �⺻���� �ν��Ͻ����� ������ 4����Ʈ ���� �ĺ��ڸ� �����Ѵ�.
		
		//����!
		//String Ŭ������ �ν��Ͻ��� �޶� ���� ���ڿ��̸� ���� HashCode()�� ����
		//��? ������ �Ͽ���.
		
		System.out.println("p5 = " + p5.getEngine().hashCode());
		System.out.println("p6 = " + p6.getEngine().hashCode());
		System.out.println("engine2 = " + engine2.hashCode());
		System.out.println("engine3 = " + engine3.hashCode());
	}
}
