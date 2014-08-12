package ex03;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test09 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex03/beans.xml");
		//getBean(���̵�/����) : �����̳ʿ��� �ش� ID �� ������ ���� ��ü�� ã�� ����, ������ ����
		Car car2 = (Car)ctx.getBean("car2");
		List<Object> cdBox= car2.cdBox;
		
		for(Object item : cdBox){
			System.out.println(item + " : " + item.getClass().getSimpleName());
		}
	}
}
