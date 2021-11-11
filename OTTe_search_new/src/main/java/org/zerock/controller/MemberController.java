package org.zerock.controller;

import java.util.Date;
import java.util.List;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.FavoriteVO;
import org.zerock.domain.GenreVO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.FavoriteService;
import org.zerock.service.MemberService;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	SqlSession sql;
	
	@Inject
	MemberService service;

	@Inject
	private UserService uservice;

	@Inject
	private FavoriteService fservice;
	
	@Inject
	private MemberService mservice;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	JavaMailSender mailSender;



	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}


	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		logger.info("post register");
		int result = service.emailChk(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {

				String inputPass = vo.getUserpassword();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserpassword(pwd);
				logger.info(pwd);

				service.register(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "member/registPost";
	}
	
	
	// 레지스트 post
	@RequestMapping(value = "/registpost", method = RequestMethod.POST)
	public String postRegistersiginin(UserVO vo,LoginDTO voo, HttpSession session, Model model) throws Exception {
		logger.info("post register");
		int result = service.emailChk(vo);
		try {
			if (result == 1) {
				return "/member/register";
			} else if (result == 0) {

				String inputPass = vo.getUserpassword();
				String pwd = pwdEncoder.encode(inputPass);
				vo.setUserpassword(pwd);
				logger.info(pwd);

				service.register(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}

		session.getAttribute("login");
		UserVO login = uservice.login(voo);
		session.setAttribute("login", login);
		if (voo.isUseCookie()) {

			int amount = 60 * 60 * 24 * 7;

			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			
			
			
		}
		return "member/registPost";
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
	public boolean passChk(LoginDTO vo) throws Exception {

		UserVO login = uservice.login(vo);
		boolean pwdChk = pwdEncoder.matches(vo.getUserpassword(), login.getUserpassword());
		return pwdChk;
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

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String goprofile(LoginDTO userid, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		UserVO userVo = (UserVO) session.getAttribute("login");

		logger.info("/* userVo=" + userVo.toString());

		/*
		 * List<ContentsVO> wish = contentsService.selectWishlist(userVo);
		 * model.addAttribute("wish", wish);
		 */

		return "/member/profile";
	}

	// 회원정보 수정 post
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String postprofile(LoginDTO dto, HttpSession session) throws Exception {
		logger.info("/* post memberUpdate");

		String inputPass = dto.getUserpassword();
		String pwd = pwdEncoder.encode(inputPass);
		dto.setUserpassword(pwd);

		uservice.memberUpdate(dto);

		session.invalidate();

		return "redirect:/";
	}



	private static String namespace = "org.zerock.mapper.MemberMapper";

	@RequestMapping(value = "/mailForm", method = RequestMethod.GET)
	public String mailFormGet() {
		return "member/mailForm";

	}

	String msgFlag = "";
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

			String inputPass = vo.getUserpassword();
			String pwd = pwdEncoder.encode(inputPass);
			vo.setUserpassword(pwd);

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

	// 선택한 장르,배우,감독을 배열타입으로 받아 db에 등록해주는 컨트롤러
	@ResponseBody
	@RequestMapping(value = "/insertfavorite", method = RequestMethod.POST)
	public int insertgenrefavorite(LoginDTO vo, HttpSession session, @RequestParam("subject") String subject,int usernum,
			@RequestParam(value = "chbox[]") List<String> chArr, FavoriteVO favorite) throws Exception {
		logger.info("insert favorite");
	
		
		
		/* LoginDTO num1 = (LoginDTO) session.getAttribute("login"); */
		
		
		
		int result = 1;
		logger.info("for문 시작");
		favorite.setUsernum(usernum);
		favorite.setFavoritesubject(subject);
		for (String i : chArr) {
			logger.info(i);
			favorite.setFavoritevalue(i);
			mservice.insertfavorite(favorite);
		}

		return result;
	}

	@RequestMapping(value = "/favorite", method = RequestMethod.GET)
	public String getgenre(Model model) throws Exception {
		logger.info("get genre");

		List<GenreVO> genreservice = fservice.selectgenre();
		model.addAttribute("genreservice", genreservice);

		return "/member/favorite";
	}

	@RequestMapping(value = "/favorite2", method = RequestMethod.GET)
	public String getactor(Model model) throws Exception {
		logger.info("get actor");

		List<ActorVO> Favoriteservice = fservice.select();
		model.addAttribute("Favoriteservice", Favoriteservice);

		return "/member/favorite2";
	}

	@RequestMapping(value = "/favorite3", method = RequestMethod.GET)
	public String getdirector(Model model) throws Exception {
		logger.info("get director");

		List<DirectorVO> directorservice = fservice.selectdirector();
		model.addAttribute("directorservice", directorservice);

		return "/member/favorite3";
	}

}
