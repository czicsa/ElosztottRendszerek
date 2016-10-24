package hu.meiit;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hu.meiit.model.ColorData;
import hu.meiit.model.DataPairDTO;
import hu.meiit.model.User;
import hu.meiit.service.UserManager;

@Controller
public class AngularController {

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

	private List<DataPairDTO> schools = generateSchools();
	private List<ColorData> colors = generateColors();
	private List<String> availableGenders = new ArrayList<String>(Arrays.asList("MALE", "FEMALE"));

	@RequestMapping(value = "/angular")
	public ModelAndView generateAngularPageHandler() {
		return new ModelAndView("angular");
	}

	@RequestMapping(value = "/getjson", produces = "application/json")
	@ResponseBody
	public List<String> jsonRequest() {
		String[] tomb = new String[] { "alma", "korte", "fagyi" };
		return Arrays.asList(tomb);
	}

	@RequestMapping(value = "/status")
	public ModelAndView generateWebPage() {
		return new ModelAndView("angularmain");
	}

	@RequestMapping(value = "/registeruserangular", consumes = "application/json")
	@ResponseBody
	public int registerUserAngular(@RequestBody @Valid CreateUserDTO user, BindingResult result) {
		System.out.println("Username: " + user);
		if (result.hasErrors()) {
			return 0;
		}
		userManager.storeUser(user);
		return 1;
	}

	@RequestMapping(value = "/getusers")
	@ResponseBody
	public Collection<User> getUsersHandler() {
		return userManager.getUsers();
	}
	
	@RequestMapping(value = "/getschools")
	@ResponseBody
	public List<DataPairDTO> getElementsHandler() {

		return schools;
	}

	@RequestMapping(value = "/getcolors")
	@ResponseBody
	public List<ColorData> getColorsHandler() {

		return this.colors;
	}

	private List<DataPairDTO> generateSchools() {
		List<DataPairDTO> schools = new ArrayList<DataPairDTO>(3);
		DataPairDTO school = new DataPairDTO("HIGHSCHOOL", "Highschool");
		schools.add(school);
		school = new DataPairDTO("COLLEGE", "College");
		schools.add(school);
		school = new DataPairDTO("UNIVERSITY", "University");
		schools.add(school);
		return schools;
	}

	private List<ColorData> generateColors() {
		List<ColorData> colors = new ArrayList<ColorData>(3);
		ColorData color = new ColorData("red", "red", false);
		colors.add(color);
		color = new ColorData("green", "green", false);
		colors.add(color);
		color = new ColorData("blue", "blue", false);
		colors.add(color);
		return colors;
	}
}
