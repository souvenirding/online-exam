package com.ssm.crud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssm.crud.bean.manager;
import com.ssm.crud.service.ManagerService;

/**
 *
 * @author 丁
 *
 */

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;

	// 管理员登陆验证
	public String menu = null;
	@RequestMapping("/managerlogin")
	public String mlogin(@RequestParam("username") String username, @RequestParam("password") String password,String yzm,
						 Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
		List<manager> manager = managerService.getManager(username.trim(), password.trim());
		if (manager.size()>0 && yzm.trim().equalsIgnoreCase(sessionVerifyCode)) {
			menu = "managermenu.jsp";
			session.setAttribute("loginuse", manager);
			model.addAttribute("menu", menu);
			return "main";
		}else{
			request.setAttribute("nouser", "账户不存在或验证码错误");
			return "managerlogin";
		}
	}

}
