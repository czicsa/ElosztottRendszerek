package hu.meiit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MessageHandler {

    @RequestMapping(value = "/message", method = { RequestMethod.GET })
    public String messagePage() {
        return "message";
    }


}
