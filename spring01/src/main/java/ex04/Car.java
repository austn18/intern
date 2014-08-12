package ex04;

import java.util.List;
import java.util.Map;

public class Car {
	String model;
	int cc;
	Engine engine;
	String[] tires;

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

	public String[] getTires() {
		return tires;
	}

	public void setTires(String[] tires) {
		this.tires = tires;
	}

	@Override
	public String toString() {
		return "Car [model=" + model + ", cc=" + cc + ", engine=" + engine
				+ "]";
	}
	
}
