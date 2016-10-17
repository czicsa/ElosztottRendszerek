package hu.meiit;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class AngularHandler {

    @RequestMapping(value = "/angular", method = { RequestMethod.GET })
    public String messagePage() {
        return "angular";
    }

    @RequestMapping(value = "/getJson", method = { RequestMethod.GET }, produces= MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<String> getJson() {
        return Arrays.asList("a", "b", "c");
    }


}
