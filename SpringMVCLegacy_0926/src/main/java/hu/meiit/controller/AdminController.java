package hu.meiit.controller;

import hu.meiit.model.NewUserRequest;
import hu.meiit.service.UserManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by czinke2 on 2016. 09. 26..
 */
@RequestMapping("/admin")
@Controller
public class AdminController {
    @Autowired
    private UserManagementService userManagementService;

    @ModelAttribute("userList")
    List<NewUserRequest> getUsers(){
        return userManagementService.getUsers();
    }

    @RequestMapping(value = "/status", method= RequestMethod.GET)
    public String status(){ return "status"; }

    @RequestMapping(value = "/get-balance", method= RequestMethod.GET)
    public String getBalance(){
        return "getbalance";
    }

    @RequestMapping(value = "/new-user", method= RequestMethod.GET)
    public String newUserGet(){ return "newuser"; }

    @RequestMapping(value = "/new-user", method= RequestMethod.POST)
    public String newUserPost(@ModelAttribute NewUserRequest newUserRequest){
        if(newUserRequest.getUserName() == null || newUserRequest.getUserName().equals("")){
            return "newuser";
        }else{
            this.userManagementService.AddUser(new NewUserRequest(newUserRequest.getUserName(), newUserRequest.getCredit()));
            return "redirect:status";
        }
    }

}
