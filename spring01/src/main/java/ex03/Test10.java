package ex03;

import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test10 {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex03/beans.xml");
		//getBean(아이디/별명) : 컨테이너에서 해당 ID 나 별명을 갖는 객체를 찾아 리턴, 없으면 예외
	Car car3 = (Car)ctx.getBean("car3");
	Map<String,Object> options = car3.getOptions();
	Set<Entry<String, Object>> entrySet = options.entrySet();
	
	for(Entry<String, Object> entry:entrySet){
		System.out.println(entry.getKey() +" "+entry.getValue());
	}
	}
}
