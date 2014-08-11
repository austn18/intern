package kt.c.annotation.ex;

import java.lang.annotation.Annotation;

import kt.c.annotation.Component;

public class Test01 {
	public static void main(String[] args) {
		Car c = new Car();

		Class clazz = c.getClass();
		Annotation[] annos = clazz.getAnnotations();
	
		for(Annotation anno : annos){
			System.out.println(anno.toString());
		}
		Component comp = (Component)clazz.getAnnotation(Component.class);
		System.out.println(comp.value());
	}
}
 