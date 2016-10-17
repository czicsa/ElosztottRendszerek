package hu.meiit;

import java.util.*;

import javax.validation.Valid;

import hu.meiit.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hu.meiit.model.UserModelData;
import hu.meiit.service.UserManager;

@Controller
@RequestMapping(value = "/admin")
public class UjController {

	@Autowired
	private UserManager userManager;

	private List<String> availableColors = new ArrayList<String>(Arrays.asList("red", "green", "blue"));
	private Map<String, String> availableSchools = new HashMap<String, String>() {
		{
			put("HIGHSCHOOL", "Highschool");
			put("COLLEGE", "College");
			put("UNIVERSITY", "University");
		}
	};
	private List<String> availableGenders = new ArrayList<String>(Arrays.asList("MALE", "FEMALE"));
	private String[] availableFields = new String[] { "username", "credit", "school", "favcol", "gend" };

	@RequestMapping(value = "/status")
	public String generateStatusPage() {
		return "status";
	}

	@RequestMapping(value = "/getUsers", method = { RequestMethod.GET }, produces= MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Collection<User> getUsers(){
		return userManager.getUsers();
	}

	@RequestMapping(value = "/getColors", method = { RequestMethod.GET }, produces= MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<String> getColors(){
		return availableColors;
	}

	@RequestMapping(value = "/getGenders", method = { RequestMethod.GET }, produces= MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<String> getGenders(){
		return availableGenders;
	}

	@RequestMapping(value = "/getSchools", method = { RequestMethod.GET }, produces= MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Collection<String> getSchools(){
		return availableSchools.values();
	}

	@RequestMapping(value = "/get-balance")
	public ModelAndView generateBalancePage() {
		ModelAndView mav = new ModelAndView("balance");

		return mav;
	}

	@RequestMapping(value = "/newuser", method = { RequestMethod.GET })
	public ModelAndView generateNewUserPage() {
		ModelAndView mav = new ModelAndView("newuser");
		UserModelData data = new UserModelData();
		data.setUsername("");
		data.setCredit("");
		data.getSchool().add("HIGHSCHOOL");
		mav.addObject("pageData", data);
		mav.addObject("schools", availableSchools);
		mav.addObject("colors", availableColors);
		mav.addObject("genders", availableGenders);
		return mav;
	}

	@RequestMapping(value = "/newuser", method = { RequestMethod.POST })
	public void generateCreateUserHandler(@ModelAttribute() CreateUserDTO dto) {
		if(dto != null) userManager.storeUser(dto);
	}

	private UserModelData generateDefaultModelData() {
		UserModelData data = new UserModelData();
		data.setUsername("");
		data.setCredit("");
		data.getSchool().add("HIGHSCHOOL");

		return data;
	}

	private void manageErrors(List<String> result, String[] fields, BindingResult validationResult) {
		int length = fields.length;
		List<FieldError> fieldErrors = null;
		for (int i = 0; i < length; i++) {
			fieldErrors = validationResult.getFieldErrors(fields[i]);
			for (FieldError fe : fieldErrors) {
				result.add(fields[i] + ": " + fe.getDefaultMessage());
			}
		}
	}
}
