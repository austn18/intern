package ex02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test05 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex02/beans.xml");
		//getBean(���̵�/����) : �����̳ʿ��� �ش� ID �� ������ ���� ��ü�� ã�� ����, ������ ����
		Car p1= (Car)ctx.getBean("car1");
		System.out.println(p1.toString());
		
		Car p2 = (Car)ctx.getBean("car2");
		System.out.println(p2.toString());
		
		if(p1.getEngine() == p2.getEngine()){
			System.out.println("p1 p2 ���� ����");
		}
		Engine engine1 = (Engine)ctx.getBean("engine1");
		if(p1.getEngine() == engine1){
			System.out.println("p1 engine1 ���� ����");
		}
	}
}
