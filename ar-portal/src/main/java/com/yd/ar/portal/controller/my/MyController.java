/**  
 * @Title: MyController.java
 * @Package com.yd.ar.portal.controller.my
 * @Description: TODO
 * @author QinChong
 * @date 2016年1月24日 下午1:01:58
 * @version V1.0  
 */
package com.yd.ar.portal.controller.my;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yd.ar.common.base.BaseController;


@Controller
@RequestMapping("/my")
public class MyController extends BaseController {

	@RequestMapping("")
	public String my() {
		return "my/my-index";
	}

}
