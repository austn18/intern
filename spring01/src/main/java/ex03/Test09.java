package ex03;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test09 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex03/beans.xml");
		//getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
		Car car2 = (Car)ctx.getBean("car2");
		List<Object> cdBox= car2.cdBox;
		
		for(Object item : cdBox){
			System.out.println(item + " : " + item.getClass().getSimpleName());
		}
	}
}
