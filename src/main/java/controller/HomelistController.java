package controller;

import model.MyRunnable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/homelist")
public class HomelistController {

//    private static final Logger logger = (Logger) LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/BTC")
    @ResponseBody
    public Map<String,Object> login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(request.getParameter("name"));
        Map<String,Object> map = new HashMap<String,Object>();

//        if(request.getParameter("name").equals("123")){
//            System.out.println("城东");
//            map.put("msg", "成功");
//        }else{
            System.out.println("失败");
            map.put("msg", "失败");
//        }
        return map;
    }


}
