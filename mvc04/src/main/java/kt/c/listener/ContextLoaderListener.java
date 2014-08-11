package kt.c.listener;

import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.sql.DataSource;

import kt.c.annotation.Component;

import org.reflections.Reflections;

public class ContextLoaderListener implements ServletContextListener {

	// OracleDataSource dataSource;
	ServletContext ctx;
	DataSource dataSource;

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ctx = sce.getServletContext();
		ctx.setAttribute("contextRoot", ctx.getContextPath());

		try {
			// initialContext : JNDI(Java Naming and Directory Interface) �ڿ�
			// ��ȸ ����
			// JNDI? DB Ŀ�ؼ�, ������� �ڹ��ڿ� ���� �̸��� �ο��ϰ� ���丮 ������� �з�
			// ���ϴ� ����
			// ���簳�� : �� ������ ����
			Context initCtx = new InitialContext();
			dataSource = (DataSource) initCtx.lookup("java:/comp/env/jdbc/xe");
			ctx.setAttribute("dataSource", dataSource);

			createComponents();
			// ServletContext 저장소에 보관된 객체를 꺼내서 의존객체를 주입한다.
			injectDependencies();

		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void createComponents() throws Exception {
		Reflections reflections = new Reflections("kt.c");
		Component compAnno = null;
		Set<Class<?>> classList = reflections.getTypesAnnotatedWith(Component.class);
		//컴포넌트 어노테이션을 가진 클래스를 kt.c 패키지에서 모두 찾아낸다.
		for (Class<?> clazz : classList) {
			compAnno = (Component) clazz.getAnnotation(Component.class);
			if (compAnno != null) {// 해당클래스의 Component 애노테이션이 있다면
				// System.out.println("***" + compAnno.value());//value 프로퍼티 값을
				// 출력한다.
				// 인스턴스 생성방법
				ctx.setAttribute(compAnno.value(), clazz.newInstance());
				
			}
		}


	}

	private void injectDependencies() throws Exception {
		// ServletContext에 들어있는 객체를 꺼내서 그 객체가 사용하는 의존 객체를 주입한다.

		// 1) ServletContext 저장소에 저장된 객체를 꺼내기 위해 먼저 이름목록을 알아 낸다.
		Enumeration<String> nameList = ctx.getAttributeNames();

		// 2) 이름목록에서 이름을 하나씩 꺼낸다.
		String name = null;
		Object obj = null;
		Class clazz = null;
		Method[] methodList = null;
		Class paramClazz = null;
		Object paramObj = null;

		while (nameList.hasMoreElements()) { // 꺼낼 이름이 있으면?
			name = nameList.nextElement();
			// 3) 이름으로 ServletContext에 저장된 객체를 꺼낸다.
			obj = ctx.getAttribute(name);

			// 4) 꺼낸 객체에 대해 클래스 정보를 알아낸다.
			clazz = obj.getClass();

			// 5) 클래스 정보관리 객체로 부터 그 클래스가 갖고 있는 메서드 목록을 꺼낸다.
			methodList = clazz.getMethods();

			// 6) 메서드 목록에서 setter 메서드를 찾는다.
			for (Method method : methodList) {
				if (method.getName().startsWith("set")// 메서드 이름이 set 일때
						&& method.getParameterTypes().length == 1 // 파라미터가 한개일때
						&& method.getParameterTypes()[0] != String.class) { // 스트링
																			// 파라미터는
																			// 제외
					// 7) setter 메서드가 원하는 파라미터가 어떤 클래스 타입인지 알아낸다.
					// 단, 첫번째파라미터 클래스 타입
					paramClazz = method.getParameterTypes()[0];

					// 8) setter 메서드의 파라미터 정보를 알아냈으면, 그런 타입의 객체를
					// ServletContext에서 찾는다.
					paramObj = findObject(paramClazz);

					// 9) setter 메서드의 파라미터 타입과 일치하는 객체를 ServletContext에 찾았으면
					// setter 메서드 호출
					if (paramObj != null) {
						method.invoke(obj, paramObj);
					}

				}
			}

		}

	}

	private Object findObject(Class<?> clazz) {
		// ServletContext 저장소에서 clazz 의 인스턴스를 찾아 리턴.
		Enumeration<String> nameList = ctx.getAttributeNames();
		String name = null;
		Object obj = null;

		while (nameList.hasMoreElements()) { // 이름 꺼낼 목록이 있으면
			name = nameList.nextElement();// 이름하나 꺼낸다
			obj = ctx.getAttribute(name); // ServletContext에서 name 으로 객체를 찾는다.

			if (clazz.isInstance(obj)) {
				return obj;
			}
		}
		return null;

	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// try {dataSource.close();} catch (Throwable e) {}
		// �����ͺ��̽����� �˾Ƽ� close �Ѵ�.
	}

}
