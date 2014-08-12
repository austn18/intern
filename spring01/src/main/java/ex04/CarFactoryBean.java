package ex04;

import org.springframework.beans.factory.config.AbstractFactoryBean;

public class CarFactoryBean extends AbstractFactoryBean<Car>{
	String model;

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	@Override
	protected Car createInstance() throws Exception {
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

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return Car.class;
	}
}
