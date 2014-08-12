package ex05;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test12 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex05/beans.xml");

		Car car = (Car)ctx.getBean("car");
		System.out.println(car.toString());
		
		Engine engin1 = (Engine)ctx.getBean("engine1");
		System.out.println(engin1.toString());
		
	}
}
