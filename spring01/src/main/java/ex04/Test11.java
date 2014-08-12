package ex04;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test11 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"ex04/beans.xml");
		// getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
		Object bean1 = ctx.getBean("car1");
		System.out.println(bean1);
		
		Object bean2 = ctx.getBean("car2");
		System.out.println(bean2);
		
		Object bean3 = ctx.getBean("car3");
		System.out.println(bean3);

		Object bean4 = ctx.getBean("car4");
		System.out.println(bean4);
		
	}
}
