package hu.meiit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by czinke2 on 2016. 09. 19..
 */
@Controller
public class FirstController {

    @RequestMapping(value = "/", method= RequestMethod.GET)
    public String index(){
        return "index";
    }
}
