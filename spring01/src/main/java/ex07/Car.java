package ex07;

public class Car {
	String model;
	int cc;
	Engine engine;

	public Car() {
		System.out.println("Car() »ý¼ºµÊ...");
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getCc() {
		return cc;
	}

	public void setCc(int cc) {
		this.cc = cc;
	}

	public Engine getEngine() {
		return engine;
	}

	public void setEngine(Engine engine) {
		System.out.println("setEngine() È£ÃâµÊ...");
		this.engine = engine;
	}

	@Override
	public String toString() {
		return "Car [model=" + model + ", cc=" + cc + ", engine=" + engine
				+ "]";
	}

}
