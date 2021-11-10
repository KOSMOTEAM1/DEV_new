package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ContentsVO;
import org.zerock.domain.UserVO;
import org.zerock.service.ContentsService;
import org.zerock.service.FollowService;

@Controller
@RequestMapping(value = "/contents")
public class ContentsController {

	//private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Inject
	private ContentsService contentsService;
	@Autowired
	private FollowService followService;

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void read(@RequestParam("contentsid") int contentsid, Model model) throws Exception {
		
		ContentsVO view = contentsService.view(contentsid);
		List<ContentsVO> viewReply = contentsService.selectViewReply(contentsid);
		ContentsVO avgScore = contentsService.selectAvgscore(contentsid);
		ContentsVO reviewcnt = contentsService.selectReviewcnt(contentsid);
		
		model.addAttribute("reviewcnt",reviewcnt);
		model.addAttribute("avgScore",avgScore);
		model.addAttribute("viewReply",viewReply);
		model.addAttribute("view",view);
		
	}
	
	@RequestMapping(value = "/follow", method = RequestMethod.POST)
	public ResponseEntity<String> follow(@RequestParam("contentsid") int contentsid, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");

		ResponseEntity<String> entity = null;
		try {
			followService.addFollow(contentsid, userVo.getUsernum());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
