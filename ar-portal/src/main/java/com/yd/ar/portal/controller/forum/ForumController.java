package com.yd.ar.portal.controller.forum;

import com.yd.ar.common.base.BaseController;
import com.yd.ar.common.exception.ServiceException;
import com.yd.ar.common.page.Page;
import com.yd.ar.portal.service.forum.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

@Controller
@RequestMapping("/forum")
public class ForumController extends BaseController {

    @Resource
    PostService postService;

    @RequestMapping("")
    public String index(Model model) throws ServiceException {
        // 构造 page 对象
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        // 查询数据
        postService.queryPosts(page, getQueryStr());
        // 传向页面
        model.addAttribute("page", page);
        setQuery();

        return "forum/forum-index";
    }
}
