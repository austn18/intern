package ex07;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test15 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex07/beans.xml");

		Car car = (Car)ctx.getBean("car1");
		System.out.println(car.toString());
		
//		Engine engin1 = (Engine)ctx.getBean("engine1");
//		System.out.println(engin1.toString());
		
	}
}
