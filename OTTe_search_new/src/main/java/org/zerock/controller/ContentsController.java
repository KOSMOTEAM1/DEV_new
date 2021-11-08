package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ContentsVO;
import org.zerock.service.ContentsService;

@Controller
@RequestMapping(value = "/contents")
public class ContentsController {

	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Inject
	private ContentsService contentsService;

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void read(@RequestParam("contentsid") int contentsid, Model model) throws Exception {
		
		ContentsVO view = contentsService.view(contentsid);
		List<ContentsVO> viewReply = contentsService.selectViewReply(contentsid);
		List<ContentsVO> insertReply = contentsService.insertReply(contentsid);
		model.addAttribute("insertReply",insertReply);
		model.addAttribute("viewReply",viewReply);
		model.addAttribute("view",view);
		
	}
	
	

}
