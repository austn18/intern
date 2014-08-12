package ex01;

public class Test01 {
	public static void main(String[] args) {
		Car c = new Car();
		c.setModel("tico");
		c.setCc(800);

		System.out.println(c.getModel());
		System.out.println(c.getCc());
	}
}
