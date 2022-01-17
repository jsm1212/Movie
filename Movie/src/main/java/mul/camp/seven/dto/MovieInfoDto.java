package mul.camp.seven.dto;

/* -- 영화정보
CREATE TABLE MOVIEINFO( 
	MOVIE_TITLE VARCHAR2(50) PRIMARY KEY, -- 영화제목
	MOVIE_RANK NUMBER(1) NOT NULL, -- 영화 평점으로 매긴 순위
	MOVIE_STAR_COUNT NUMBER(1) NOT NULL, -- 별점으로 합산한 평점
	MOVIE_CONTENT VARCHAR2(3000) NOT NULL, -- 영화 내용 설명
	MOVIE_DIRECTOR VARCHAR2(30) NOT NULL, -- 감독 이름
	RELEASE_DATE VARCHAR2(30) NOT NULL, -- 개봉 날짜
	WDATE DATE NOT NULL -- 글 등록 날짜
); */
public class MovieInfoDto {
	private String title;
	private int rank;
	
	public MovieInfoDto() {
		
	}
	public MovieInfoDto(int rank, String title) {
		super();
		this.title = title;
		this.rank = rank;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "MovieInfoDto [title=" + title + ", rank=" + rank + "]";
	}
	
}
