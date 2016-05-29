package cn.edu.tju.scs.resource.tv.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by jack on 2016/5/28.
 */

@Controller
@RequestMapping("/admin")
public class VideoAdminController {

    @RequestMapping(method = RequestMethod.GET)
    public String adminIndex(){
        return "/admin/admin-videos";
    }
}
