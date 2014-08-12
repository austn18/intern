package ex04;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test11 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"ex04/beans.xml");
		// getBean(���̵�/����) : �����̳ʿ��� �ش� ID �� ������ ���� ��ü�� ã�� ����, ������ ����
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
