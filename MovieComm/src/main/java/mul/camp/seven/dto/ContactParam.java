package mul.camp.seven.dto;

import java.io.Serializable;

public class ContactParam implements Serializable{
	private String choice;
	private String search;
	
	public ContactParam() {
		
	}
	public ContactParam(String choice, String search) {
		super();
		this.choice = choice;
		this.search = search;
	}
	public String getChoice() {
		return choice;
	}
	public void setChoice(String choice) {
		this.choice = choice;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "ContactParam [choice=" + choice + ", search=" + search + "]";
	}
	
	
}
