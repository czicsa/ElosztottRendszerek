package hu.meiit.model;

import java.util.ArrayList;
import java.util.List;

public class UserModelData {

	private String username;
	private String credit;
	private List<String> school = new ArrayList<String>();
	private List<String> favcol = new ArrayList<String>();
	private String gend;

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

	public List<String> getSchool() {
		return school;
	}

	public void setSchool(List<String> school) {
		this.school = school;
	}

	public List<String> getFavcol() {
		return favcol;
	}

	public void setFavcol(List<String> favcol) {
		this.favcol = favcol;
	}

	public String getGend() {
		return gend;
	}

	public void setGend(String gend) {
		this.gend = gend;
	}

}
