package ex04;

public class CarFactory2 {
	public Car createCar(String model){
		Car car = new Car();
		
		if(model.equals("tico")){
			car.setModel("Ƽ��");
			car.setCc(500);
			Engine e = new Engine();
			e.setMaker("����ڵ���");
			e.setHorsePower(120);
			car.setEngine(e);
			return car;
		}else if(model.equals("sonata")){
			car.setModel("�ҳ�Ÿ");
			car.setCc(1998);
			Engine e = new Engine();
			e.setMaker("�����ڵ���");
			e.setHorsePower(275);
			car.setEngine(e);
			return car;
		}else {
			return null;
		}
	}
}
