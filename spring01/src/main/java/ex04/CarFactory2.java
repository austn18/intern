package ex04;

public class CarFactory2 {
	public Car createCar(String model){
		Car car = new Car();
		
		if(model.equals("tico")){
			car.setModel("티코");
			car.setCc(500);
			Engine e = new Engine();
			e.setMaker("대우자동차");
			e.setHorsePower(120);
			car.setEngine(e);
			return car;
		}else if(model.equals("sonata")){
			car.setModel("소나타");
			car.setCc(1998);
			Engine e = new Engine();
			e.setMaker("현대자동차");
			e.setHorsePower(275);
			car.setEngine(e);
			return car;
		}else {
			return null;
		}
	}
}
