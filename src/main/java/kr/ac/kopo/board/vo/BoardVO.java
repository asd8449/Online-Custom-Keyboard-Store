package kr.ac.kopo.board.vo;

public class BoardVO {
	private int 	no;
	private int 	num;
	private int 	viewCnt;
	private String 	title;
	private String 	writer;
	private String 	content;
	private String 	regDate;
	private String  type;
	
	public BoardVO() {
		
	}

	public BoardVO(int no, String title, String writer, String regDate, String type) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.regDate = regDate;
		this.type = type;
	}
	//게시글 상세보기 및 전체 데이터 조회
	public BoardVO(int no, String title, String writer, String content, int viewCnt, String regDate, String type) {
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.type = type;
	}
	public BoardVO(int no, int num, String title, String writer, String content, int viewCnt, String regDate, String type) {
		this.no = no;
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.type = type;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", num=" + num + ", viewCnt=" + viewCnt + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", regDate=" + regDate + ", type=" + type + "]";
	}


	
}
