package com.yd.ar.portal.controller.my;

import com.yd.ar.common.base.BaseController;
import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.portal.service.information.InformationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;


@Controller
@RequestMapping("/my/forum")
public class MyForumController extends BaseController {

    @Resource
    private InformationService informationService;

    /**
     * TODO 加载我的帖子
     *
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("")
    public String index(Model model) throws ServiceException {
        // 查询用户发布的消息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        informationService.getInfoByUserIdAndInfoType(page, getCurrentUserId(), "BBS");
        model.addAttribute("page", page);

        return "my/forum/forum-index";
    }

    /**
     * TODO 删除帖子
     * @param postId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/delete")
    public String delete(Integer postId) throws ServiceException {
        informationService.deleteInfo(postId, getCurrentUserId());

        return "redirect:/my/info.action";
    }
}
