package ex05;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test13 {
	public static void main(String[] args) {
		
		@SuppressWarnings("resource")
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex05/beans.xml");

		Car car1 = (Car)ctx.getBean("car1");
		System.out.println("car1 : " + car1.hashCode());
		
		Car car2 = (Car)ctx.getBean("car2");
		System.out.println("car2 : " + car2.hashCode());
		
		Car car3 = (Car)ctx.getBean("car3");
		System.out.println("car3 : " + car3.hashCode());
		Car car31 = (Car)ctx.getBean("car3-1");
		System.out.println("car3-1 : " + car3.hashCode());
		Car car32 = (Car)ctx.getBean("car3-2");
		System.out.println("car3-2 : " + car3.hashCode());
		Car car33 = (Car)ctx.getBean("car3-3");
		System.out.println("car3-3 : " + car3.hashCode());
		
		Car car4 = (Car)ctx.getBean("car4");
		System.out.println("car4 : " + car4.hashCode());
		Car car42 = (Car)ctx.getBean("car4-2");
		System.out.println("car4-2 : " + car4.hashCode());
		Car car43 = (Car)ctx.getBean("car4-3");
		System.out.println("car4-3 : " + car4.hashCode());
		
		//getAliases() 객체에 부여된 나머지 이름을 보여준다.
		String[] car3Alias = ctx.getAliases("car3-1");
		for(String alias : car3Alias){
			System.out.println(alias);
		}

		
	}
}
