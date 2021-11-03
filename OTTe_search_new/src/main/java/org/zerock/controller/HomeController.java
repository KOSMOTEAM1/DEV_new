package org.zerock.controller;

import java.util.List;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.ContentsVO;
import org.zerock.service.ContentsService;

/**
 * Handles requests for the application home page.
 */
@Controller


@RequestMapping(value = "/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private ContentsService contentsService;
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String gohomepage(Model model) throws Exception {
		List<ContentsVO> top = contentsService.selectContentsAll();
	    model.addAttribute("top", top );
		
		return "/main/home";
	}
	
	@RequestMapping(value = "main/home", method = RequestMethod.GET)
	public String gohome(Model model) throws Exception {
		List<ContentsVO> top = contentsService.selectContentsAll();
	    model.addAttribute("top", top );
		
		return "/main/home";
	}
	@RequestMapping(value = "main/latest", method = RequestMethod.GET)
	public String golastest(Model model) {
		
		
		return "/main/latest";
	}
	@RequestMapping(value = "main/recommend", method = RequestMethod.GET)
	public String gorecommend(Model model) {
		
		
		return "/main/recommend";
	}
	@RequestMapping(value = "main/wishlist", method = RequestMethod.GET)
	public String gowishlist(Model model) {
		
		return "/main/wishlist";
	}
	@RequestMapping(value = "main/korean", method = RequestMethod.GET)
	public String gokorean(Model model) {
		
		return "/main/korean";
	}
	@RequestMapping(value = "main/top", method = RequestMethod.GET)
	   public String gotop(Model model) throws Exception {
	    
	      List<ContentsVO> top = contentsService.selectContentsAll();
	      model.addAttribute("top", top );
	            
	      return"/main/top";
	}
}


