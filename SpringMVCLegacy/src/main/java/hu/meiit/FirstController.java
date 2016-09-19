package hu.meiit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by czinke2 on 2016. 09. 19..
 */
@Controller
public class FirstController {

    @ResponseBody
    @RequestMapping("/")
    public String index(){
        return "Helloasdasd world!";
    }
}
