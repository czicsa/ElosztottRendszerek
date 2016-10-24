package hu.meiit.model;

import java.util.ArrayList;
import java.util.List;

public class User {

	private String username;
	private String credit;
	private String school;
	private List<String> favcols = new ArrayList<String>();
	private String gend;

	public User() {

	}

	public User(String username, String credit, String school, List<String> favcols, String gend) {
		super();
		this.username = username;
		this.credit = credit;
		this.school = school;
		this.favcols = favcols;
		this.gend = gend;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCredit() {
		return credit;
	}

	public void setCredit(String credit) {
		this.credit = credit;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public List<String> getFavcols() {
		return favcols;
	}

	public void setFavcols(List<String> favcols) {
		this.favcols = favcols;
	}

	public String getGend() {
		return gend;
	}

	public void setGend(String gend) {
		this.gend = gend;
	}

}
