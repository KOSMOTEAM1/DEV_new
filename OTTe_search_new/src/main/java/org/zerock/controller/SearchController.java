package org.zerock.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;
import org.zerock.service.ContentsService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/search/result/*")
//@RequestMapping(value = "/search")
public class SearchController {
	
	  private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
		@Inject
		private ContentsService contentsService;
	
	  @RequestMapping(value = "/list", method = RequestMethod.GET)
	  public void S(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

	    logger.info(cri.toString());

	    // model.addAttribute("list", service.listCriteria(cri));
	    model.addAttribute("list", contentsService.selectSearch(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    model.addAttribute("pageMaker", pageMaker);
	  }
	
}
