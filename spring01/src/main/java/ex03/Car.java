package ex03;

import java.util.List;

public class Car {
	String model;
	int cc;
	Engine engine;
	String[] tires;
	List<Object> cdBox;


	public List<Object> getCdBox() {
		return cdBox;
	}

	public void setCdBox(List<Object> cdBox) {
		this.cdBox = cdBox;
	}

	public String[] getTires() {
		return tires;
	}

	public void setTires(String[] tires) {
		this.tires = tires;
	}

	public Car() {
	}

	public Car(String model, int cc) {
		this.model = model;
		this.cc = cc;
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
		this.engine = engine;
	}

	@Override
	public String toString() {
		return "Car [model=" + model + ", cc=" + cc + ", engine=" + engine
				+ "]";
	}
	
}
