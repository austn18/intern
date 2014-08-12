package ex02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test06 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex02/beans.xml");
		//getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
		Car p3= (Car)ctx.getBean("car3");
		System.out.println(p3.toString());
		
		Car p4 = (Car)ctx.getBean("car4");
		System.out.println(p4.toString());
		
		if(p3.getEngine() == p4.getEngine()){
			System.out.println("p1 p2 같은 엔진");
		}
		Engine engine1 = (Engine)ctx.getBean("engine1");
		if(p3.getEngine() == engine1){
			System.out.println("p1 engine1 같은 엔진");
		}
	}
}
