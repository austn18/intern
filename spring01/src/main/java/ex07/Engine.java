package ex07;



public class Engine {
	String maker;
	int horsePower;
	public Engine() {
		System.out.println("Engine() ������...");
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
		System.out.println("setMaker() ȣ���");
		this.maker = maker;
	}
	public int getHorsePower() {
		return horsePower;
	}
	public void setHorsePower(int horsePower) {
		System.out.println("setHorsePower() ȣ���");
		this.horsePower = horsePower;
	}
	@Override
	public String toString() {
		return "Engine [maker=" + maker + ", horsePower=" + horsePower + "]";
	}
	
}
