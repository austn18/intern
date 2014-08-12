package ex02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test06 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex02/beans.xml");
		//getBean(���̵�/����) : �����̳ʿ��� �ش� ID �� ������ ���� ��ü�� ã�� ����, ������ ����
		Car p3= (Car)ctx.getBean("car3");
		System.out.println(p3.toString());
		
		Car p4 = (Car)ctx.getBean("car4");
		System.out.println(p4.toString());
		
		if(p3.getEngine() == p4.getEngine()){
			System.out.println("p1 p2 ���� ����");
		}
		Engine engine1 = (Engine)ctx.getBean("engine1");
		if(p3.getEngine() == engine1){
			System.out.println("p1 engine1 ���� ����");
		}
	}
}
