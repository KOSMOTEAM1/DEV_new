package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;


@Controller
@RequestMapping("/user")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	private UserService service;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}

	// @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	// public void loginPOST(LoginDTO dto, HttpSession session, Model model)
	// throws Exception {
	//
	// UserVO vo = service.login(dto);
	//
	// if (vo == null) {
	// return;
	// }
	//
	// model.addAttribute("userVO", vo);
	//
	// }

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.GET) public String
	 * gologin(Locale locale, Model model) {
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "/user/login"; }
	 * 
	 */

	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {

		UserVO vo = service.login(dto);

		if (vo == null) {
			return;
		}

		model.addAttribute("userVO", vo);

		if (dto.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

			//service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");
		// System.out.println("/* obj="+obj);

		if (obj != null) {
			UserVO vo = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUserid(), session.getId(), new Date());
			}
		}

		return "user/logout";
	}

	/* @RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goregister(Locale locale, Model model) {
		logger.info("Welcome signup! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/user/register";
	}   */
	
	
/*
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");

		service.register(vo);

		return "/user/register";
	}
*/


	@RequestMapping(value = "/favorite", method = RequestMethod.GET)
	public String gofavorite(Locale locale, Model model) {
		logger.info("Welcome favorite! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/user/favorite";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String goprofile(Locale locale, Model model) {
		logger.info("Welcome signup! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "/user/profile";
	}
}
