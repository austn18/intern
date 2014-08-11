package kt.c.annotation.ex;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface SearchInfo {
	String value();
	int level() default 1; //������Ƽ�� �������� �ʾƵ� �ȴ�.
	String[] author() default {""};
}
