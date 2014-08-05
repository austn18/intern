//자바빈즈 클래스
package kr.co.kt.board.db; // 패키지를 가진다. 

public class BoardVO { // 클래스명이 public
	//멤버변수 private
	private int no;
	private String title;
	private String wriger;
	private String content;
	private String reg_date;
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", wriger=" + wriger
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}

	public BoardVO(int no, String title, String wriger, String content,
			String reg_date) {
		super();
		this.no = no;
		this.title = title;
		this.wriger = wriger;
		this.content = content;
		this.reg_date = reg_date;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriger() {
		return wriger;
	}
	public void setWriger(String wriger) {
		this.wriger = wriger;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
