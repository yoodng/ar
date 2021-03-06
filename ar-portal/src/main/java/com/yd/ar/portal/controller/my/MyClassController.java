package com.yd.ar.portal.controller.my;

import com.yd.ar.common.base.BaseController;
import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.portal.service.classes.ClassService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/my/class")
public class MyClassController extends BaseController {

    @Resource
    private ClassService classService;

    /**
     * TODO 加载我的班级
     * @param model
     * @return
     */
    @RequestMapping("")
    public String index(Model model) throws ServiceException {

        model.addAttribute("classes", classService.loadMyClass(getCurrentUserId()));

        return "my/class/class-index";
    }
}
