package hu.meiit;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView generateStatusPage() {
		ModelAndView mav = new ModelAndView("status");
		mav.addObject("users", userManager.getUsers());
		return mav;
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
	public ModelAndView generateCreateUserHandler(@ModelAttribute() @Valid CreateUserDTO dto, BindingResult result) {

		ModelAndView mav = new ModelAndView("newuser");
		System.out.println(dto);
		List<String> errors = new ArrayList<String>();
		if (result.hasErrors()) {
			manageErrors(errors, availableFields, result);

			UserModelData data = new UserModelData();
			data.setUsername(dto.getUsername());
			data.setCredit(dto.getCredit());
			if (dto.getSchool() != null) {
				data.getSchool().add(dto.getSchool().name());
			}

			if (dto.getFavcol() != null) {
				data.setFavcol(dto.getFavcol());
			}

			if (dto.getGend() != null) {
				data.setGend(dto.getGend().name());
			}

			mav.addObject("pageData", data);
			mav.addObject("schools", availableSchools);
			mav.addObject("colors", availableColors);
			mav.addObject("genders", availableGenders);
			mav.addObject("status", errors);
			return mav;
		}

		userManager.storeUser(dto);

		mav.setViewName("redirect:/admin/status");
		return mav;
	}

	@RequestMapping(value = "deleteuser")
	public ModelAndView loadDeleteuserPageHandler() {
		ModelAndView mav = new ModelAndView("deleteuser");

		return mav;
	}

	@RequestMapping(value = "deleteselecteduser")
	public ModelAndView deleteuserActionHandler(@RequestParam("userid") String userid) {
		ModelAndView mav = new ModelAndView();
		userManager.deleteuser(userid);

		mav.setViewName("redirect:/admin/status");
		return mav;
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
