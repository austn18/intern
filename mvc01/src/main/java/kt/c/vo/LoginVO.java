package kt.c.vo;

import java.io.Serializable;

public class LoginVO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String type;	// 관리자('S'), 사용자('U') 구분
	
	public LoginVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LoginVO(String id, String password, String type) {
		super();
		this.id = id;
		this.password = password;
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public LoginVO setId(String id) {
		this.id = id;
		return this;
	}

	public String getPassword() {
		return password;
	}

	public LoginVO setPassword(String password) {
		this.password = password;
		return this;
	}

	public String getType() {
		return type;
	}

	public LoginVO setType(String type) {
		this.type = type;
		return this;
	}

	@Override
	public String toString() {
		return "LoginVO [id=" + id + ", password=" + password + ", type="
				+ type + "]";
	}
}
