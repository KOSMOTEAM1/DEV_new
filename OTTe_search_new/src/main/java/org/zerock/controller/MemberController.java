package org.zerock.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	 * String postRegister(UserVO vo) throws Exception {
	 * 
	 * logger.info("post register");
	 * 
	 * service.register(vo);
	 * 
	 * return null; }
	 */

	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
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

	
	// 회원 탈퇴 post

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(UserVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		service.memberDelete(vo);
		session.invalidate();

		return "user/login";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/passChk", method = RequestMethod.POST)
	public int passChk(UserVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailChk", method = RequestMethod.POST)
	public int emailChk(UserVO vo) throws Exception {
		int result = service.emailChk(vo);
		return result;
	}
	
	// 이메일 중복 체크
		@ResponseBody
		@RequestMapping(value = "/memChk", method = RequestMethod.POST)
		public int memChk(UserVO vo) throws Exception {
			int result = service.memChk(vo);
			return result;
		}
		
	
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
	public String postprofile(UserVO vo) throws Exception {
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
	
	
	
	String msgFlag = "";

	@Autowired
	JavaMailSender mailSender;
	
	@Inject
	SqlSession sql;
	
	private static String namespace = "org.zerock.mapper.MemberMapper";

	@RequestMapping(value = "/mailForm", method = RequestMethod.GET)
	public String mailFormGet() {
		return "member/mailForm";
		
	}

	@RequestMapping(value = "/mailForm", method = RequestMethod.POST)
	public String mailFormPost(UserVO vo) {
		String fromMail = "OtteOfficial@gmail.com";
		String useremail = vo.getUseremail();
		String title = vo.getTitle();
		String content = vo.getContent();

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			// 인증 번호 생성기
			StringBuffer temp = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 7; i++) {
				int rIndex = rnd.nextInt(3);
				switch (rIndex) {
				case 0:
					// a-z
					temp.append((char) ((int) (rnd.nextInt(26)) + 97));
					break;
				case 1:
					// A-Z
					temp.append((char) ((int) (rnd.nextInt(26)) + 65));
					break;
				case 2:
					// 0-9
					temp.append((rnd.nextInt(10)));
					break;
				}
			}
			
			vo.setUserpassword(temp.toString());
			
			
			sql.update(namespace + ".randomPw", vo);
			
			
			title = "Otte 임시 비밀번호 입니다.";
			
			
			content = temp.toString();
			

			
			// 메일 보관함에 저장
			messageHelper.setFrom(fromMail);
			messageHelper.setTo(useremail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			
			
			mailSender.send(message); // 실제 메일 전송
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		msgFlag = "mailSendOk";

		return "/user/login";
		

	}
	
}
