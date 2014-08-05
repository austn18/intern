package kr.co.kt.guest.db;

public class GuestVO {
	int guestbook_id;
	String register;
	String name;
	String email;
	String password;
	String content;
	public GuestVO(int guestbook_id, String register, String name, String email,
			String password, String content) {
		super();
		this.guestbook_id = guestbook_id;
		this.register = register;
		this.name = name;
		this.email = email;
		this.password = password;
		this.content = content;
	}
	public GuestVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TestVO [guestbook_id=" + guestbook_id + ", register="
				+ register + ", name=" + name + ", email=" + email
				+ ", password=" + password + ", content=" + content + "]";
	}
	public int getGuestbook_id() {
		return guestbook_id;
	}
	public void setGuestbook_id(int guestbook_id) {
		this.guestbook_id = guestbook_id;
	}
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
