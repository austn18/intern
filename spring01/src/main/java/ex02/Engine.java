package ex02;

public class Engine {
	String maker;
	int horsePower;
	public Engine() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Engine(String maker, int horsePower) {
		super();
		this.maker = maker;
		this.horsePower = horsePower;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getHorsePower() {
		return horsePower;
	}
	public void setHorsePower(int horsePower) {
		this.horsePower = horsePower;
	}
	@Override
	public String toString() {
		return "Engine [maker=" + maker + ", horsePower=" + horsePower + "]";
	}
	
}
