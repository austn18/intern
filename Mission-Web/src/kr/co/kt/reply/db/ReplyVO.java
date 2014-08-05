package kr.co.kt.reply.db;

public class ReplyVO {
    
    int no;
	int link_no;
	int board_no;
	int deps;
	String writer;
	String content;
	String reg_date;
	public ReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReplyVO(int no, int link_no, int board_no, int deps, String writer,
			String content, String reg_date) {
		super();
		this.no = no;
		this.link_no = link_no;
		this.board_no = board_no;
		this.deps = deps;
		this.writer = writer;
		this.content = content;
		this.reg_date = reg_date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLink_no() {
		return link_no;
	}
	public void setLink_no(int link_no) {
		this.link_no = link_no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getDeps() {
		return deps;
	}
	public void setDeps(int deps) {
		this.deps = deps;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	@Override
	public String toString() {
		return "ReplyVO [no=" + no + ", link_no=" + link_no + ", board_no="
				+ board_no + ", deps=" + deps + ", writer=" + writer
				+ ", content=" + content + ", reg_date=" + reg_date + "]";
	}
	
	
}
