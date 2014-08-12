package ex03;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test08 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex03/beans.xml");
		//getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
		Car car1 = (Car)ctx.getBean("car1");
		String[] tires = car1.getTires();
		
		for(String tire : tires){
			System.out.println(tire);
		}
	}
}
