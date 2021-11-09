package org.zerock.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.UserVO;

@Controller
@RequestMapping("/mail")
public class MailController {
	String msgFlag = "";

	@Autowired
	JavaMailSender mailSender;
	
	@Inject
	SqlSession sql;
	
	private static String namespace = "org.zerock.mapper.MemberMapper";

	@RequestMapping(value = "/mailForm", method = RequestMethod.GET)
	public String mailFormGet() {
		return "mail/mailForm";
		
	}

	@RequestMapping(value = "/mailForm", method = RequestMethod.POST)
	public String mailFormPost(UserVO vo) {
		String fromMail = "OtteOfficial@gmail.com";
		String useremail = vo.getuseremail();
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





// 메세지 내용과 함께 사진을 전송한다
/*
 * content = content.replace("\n", "<br/>"); content +=
 * "<br><hr><h3>CJ GREEN입니다.<h3><hr><br>"; content += "<p>....</p>"; content +=
 * "<p>오늘도 행복한 시간되세요!! </p>"; content += "<p><a href=''>CJ Green</a></p>";
 * 
 * messageHelper.setText(content, true); FileSystemResource file = new
 * FileSystemResource(new File("경로/파일명.jpg"));
 * messageHelper.addInline("파일명.jpg", file);
 */

// 메일과 함께 첨부파일 전송하기
/*
 * FileSystemResource mfile = new FileSystemResource(new File("경로/파일명.jpg"));
 * messageHelper.addAttachment("파일명.jpg", mfile);
 */

// 메세지 내용과 함께 사진을 전송한다