package hu.meiit;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import hu.meiit.model.NEM;
import hu.meiit.model.School;

public class CreateUserDTO {

	@NotBlank
	@Length(min = 1, max = 10)
	private String username;

	@NotEmpty
	@NotBlank
	@Pattern(regexp = "[0-9]{1,10}")
	private String credit;

	@NotNull
	private School school;

	@NotEmpty
	private List<String> favcol;

	@NotNull
	private NEM gend;

	public CreateUserDTO() {

	}

	public CreateUserDTO(String username, String credit) {
		super();
		this.username = username;
		this.credit = credit;
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

	public School getSchool() {
		return school;
	}

	public void setSchool(School school) {
		this.school = school;
	}

	public List<String> getFavcol() {
		return favcol;
	}

	public void setFavcol(List<String> favcol) {
		this.favcol = favcol;
	}

	public NEM getGend() {
		return gend;
	}

	public void setGend(NEM gend) {
		this.gend = gend;
	}

	@Override
	public String toString() {
		return "CreateUserDTO [username=" + username + ", credit=" + credit + ", school=" + school + ", favcol="
				+ favcol + ", gend=" + gend + "]";
	}

}
