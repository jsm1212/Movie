package mul.camp.seven.dao;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import mul.camp.seven.dto.MovieInfoDto;


public class CrawlingDao {
	
	static void Crawling(ArrayList<MovieInfoDto> ML) {
		String url = "https://movie.naver.com/movie/sdb/rank/rmovie.naver";
		Document doc = null;
		Elements tmp;
		String title_temp = null;
		int rank = 0;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		Elements element = doc.select("table.list_ranking").select("div.tit3");
		
		for (int i =0; i<5; i++) {
			tmp = element.select("a");
			title_temp = tmp.get(i).text();
		ML.add(new MovieInfoDto(rank, title_temp));
		}
	}
}
