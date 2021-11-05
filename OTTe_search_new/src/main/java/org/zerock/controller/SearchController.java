package org.zerock.controller;

import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String gosearch(Locale locale, Model model) {
		
		return "/search/searchform";
	}
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String gosearchresult(Locale locale, Model model) {
		
		return "/search/result";
	}
	
}
