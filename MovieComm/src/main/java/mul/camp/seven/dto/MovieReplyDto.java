package mul.camp.seven.dto;

import java.io.Serializable;

public class MovieReplyDto implements Serializable{
	/*CREATE TABLE MOVIEREPLY( 
			REPLY_SEQ NUMBER(4) PRIMARY KEY, -- 영화 댓글 시퀀스
			STAR_COUNT NUMBER(1), -- 별점
			ID VARCHAR2(30) NOT NULL, -- 아이디
			MOVIE_TITLE VARCHAR2(50) NOT NULL, -- 영화 제목
			REPLY_REF NUMBER(4) NOT NULL, -- 댓글 번호
			CONTENT VARCHAR2(3000) NOT NULL, -- 댓글 내용
			WDATE DATE NOT NULL -- 댓글 등록 날짜
		);
	*/
	
	private int seq;
	private int starcount;
	private String id;
	private String movietitle;
	private int ref;
	private String content;
	private String wdate;
	
	public MovieReplyDto() {
		
	}
	
	public MovieReplyDto(int seq, int starcount, String id, String movietitle, int ref, String content, String wdate) {
		super();
		this.seq = seq;
		this.starcount = starcount;
		this.id = id;
		this.movietitle = movietitle;
		this.ref = ref;
		this.content = content;
		this.wdate = wdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getStarcount() {
		return starcount;
	}
	public void setStarcount(int starcount) {
		this.starcount = starcount;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovietitle() {
		return movietitle;
	}
	public void setMovietitle(String movietitle) {
		this.movietitle = movietitle;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	@Override
	public String toString() {
		return "MovieReplyDto [seq=" + seq + ", starcount=" + starcount + ", id=" + id + ", movietitle=" + movietitle
				+ ", ref=" + ref + ", content=" + content + ", wdate=" + wdate + "]";
	}
	
	
	
}
