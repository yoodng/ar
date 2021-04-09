package com.yd.ar.portal.controller.my;

import com.yd.ar.common.base.BaseController;
import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.portal.service.my.TaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;


@Controller
@RequestMapping("/ta")
public class TaController extends BaseController {

    @Resource
    private TaService taService;

    /**
     * TODO 用户个人主页
     * @param model
     * @param userId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/show")
    public String show(Model model, Integer userId) throws ServiceException {
        // 查询用户及本消息
        model.addAttribute("ta", taService.getUserBasicInfo(userId));

        return "my/ta/ta-index";
    }
}
