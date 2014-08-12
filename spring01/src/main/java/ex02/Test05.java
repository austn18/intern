package ex02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test05 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex02/beans.xml");
		//getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
		Car p1= (Car)ctx.getBean("car1");
		System.out.println(p1.toString());
		
		Car p2 = (Car)ctx.getBean("car2");
		System.out.println(p2.toString());
		
		if(p1.getEngine() == p2.getEngine()){
			System.out.println("p1 p2 같은 엔진");
		}
		Engine engine1 = (Engine)ctx.getBean("engine1");
		if(p1.getEngine() == engine1){
			System.out.println("p1 engine1 같은 엔진");
		}
	}
}
