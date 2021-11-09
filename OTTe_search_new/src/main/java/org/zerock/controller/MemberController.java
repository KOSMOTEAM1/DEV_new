package org.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}

	// 회원가입 post 심플.ver
	/*
	 * @RequestMapping(value = "/register", method = RequestMethod.POST) public
	 * String postRegister(MemberVO vo) throws Exception {
	 * 
	 * logger.info("post register");
	 * 
	 * service.register(vo);
	 * 
	 * return null; }
	 */

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		int result = service.idChk(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {

				service.register(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	/*
	 * // 로그인 post
	 * 
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws
	 * Exception{ logger.info("post login");
	 * 
	 * session.getAttribute("member"); MemberVO login = service.login(vo); boolean
	 * pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
	 * 
	 * if(login != null && pwdMatch == true) { session.setAttribute("member",
	 * login); } else { session.setAttribute("member", null);
	 * rttr.addFlashAttribute("msg", false); }
	 * 
	 * 
	 * return "redirect:/"; }
	 */
	/*
	 * // 회원정보 수정 get
	 * 
	 * @RequestMapping(value="/memberUpdateView", method = RequestMethod.GET) public
	 * String registerUpdateView() throws Exception{ return
	 * "member/memberUpdateView"; }
	 * 
	 * // 회원정보 수정 post
	 * 
	 * @RequestMapping(value="/memberUpdate", method = RequestMethod.POST) public
	 * String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
	 * 
	 * MemberVO login = service.login(vo);
	 * 
	 * boolean pwdMatch = pwdEncoder.matches(vo.getUserPass(), login.getUserPass());
	 * if(pwdMatch) { service.memberUpdate(vo); session.invalidate(); }else { return
	 * "member/memberUpdateView"; } service.memberUpdate(vo); session.invalidate();
	 * return "redirect:/"; }
	 * 
	 * // 회원 탈퇴 get
	 * 
	 * @RequestMapping(value="/memberDeleteView", method = RequestMethod.GET) public
	 * String memberDeleteView() throws Exception{ return "member/memberDeleteView";
	 * }
	 */
	// 회원 탈퇴 post

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		service.memberDelete(vo);
		session.invalidate();

		return "user/login";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	public int emailChk(MemberVO vo) throws Exception {
		int result = service.emailChk(vo);
		return result;
	}
	
	// 이메일 중복 체크
		@ResponseBody
		@RequestMapping(value = "/memChk", method = RequestMethod.POST)
		public int memChk(MemberVO vo) throws Exception {
			int result = service.memChk(vo);
			return result;
		}
		
	

	
	/*
	 * @RequestMapping(value = "/profile", method = RequestMethod.GET) public String
	 * goprofile(Locale locale, Model model) {
	 * logger.info("Welcome signup! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate);
	 * 
	 * return "/member/profile"; }
	 */
	 
	
	  @RequestMapping(value = "/profile", method = RequestMethod.GET) public String
	  goprofile(LoginDTO userid, Model model, HttpServletRequest request) throws
	  Exception {
	  
	  HttpSession session = request.getSession();
	  
	  UserVO userVo = (UserVO) session.getAttribute("login");
	  
	  logger.info("/* userVo="+userVo.toString());
	  
		/*
		 * List<ContentsVO> wish = contentsService.selectWishlist(userVo);
		 * model.addAttribute("wish", wish);
		 */
	  
	  return "/member/profile"; 
	  }
	

	// 회원정보 수정 post
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
	public String postprofile(MemberVO vo) throws Exception {
		logger.info("/* post profile");
		/*
		 * int result = service.passChk(vo); try { if (result == 1) { return
		 * "/member/profile"; } else if (result == 0) { service.memberUpdate(vo); }
		 * 
		 * } catch (Exception e) { throw new RuntimeException(); }
		 */
		service.memberUpdate(vo);

		return "redirect:/";
	}
	
	
	
	
	// 비밀번호 분실 메일전송 
	
	/*
	 * @RequestMapping(value="/mPwdSearch", method=RequestMethod.GET) public String
	 * mPwdSearchGet() { return "member/mPwdSearch"; }
	 * 
	 * 
	 * @RequestMapping(value="/mPwdSearch", method=RequestMethod.POST) public String
	 * mPwdSearchPost(String useremail, String userid) { String pwd = "";
	 * 
	 * //기존 db에 아이디와 이메일이 일치하는지 확인하기 MemberVO vo =
	 * service.getPwdSearch(useremail,userid);
	 * 
	 * if(vo != null) { //임시비밀번호를 발급한다 UUID uid = UUID.randomUUID(); pwd =
	 * uid.toString().substring(0,6); service.setPwdChange(useremail,
	 * passwordEncoder.encode(pwd)); //암호화 시킨 비밀번호를 저장 String toMail = userid;
	 * String content = pwd; return
	 * "redirect:/mail/pwdConfirmMailForm/"+toMail+"/"+content+"/"; } else { msgFlag
	 * = "pwdConfirmNo"; return "redirect:/msg/"+msgFlag; } }
	 */
	
	
	
	
}