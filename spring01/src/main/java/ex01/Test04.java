package ex01;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test04 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex01/beans.xml");
		//getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
		Car p1= (Car)ctx.getBean("car1");
		
		Car p2 = (Car)ctx.getBean("car2");
		System.out.println(p2.getModel() + " " + p2.getCc());
		
		Car p3 = (Car)ctx.getBean("car3");
		System.out.println(p3.getModel() + " " + p3.getCc());
		
		Car p4 = (Car)ctx.getBean("car4");
		System.out.println(p4.getModel() + " " + p4.getCc());
		
		Car p5= (Car)ctx.getBean("car5");
		System.out.println(p5.getModel() + " " + p5.getCc());
		
	}
}
