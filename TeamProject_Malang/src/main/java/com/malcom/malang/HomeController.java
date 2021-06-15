package com.malcom.malang;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		
		return "notice";
	}
	
	@RequestMapping(value = "/advice", method = RequestMethod.GET)
	public String advice() {
		
		return "advice";
	}

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "join";
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info() {
		return "info";
	}
	
	@RequestMapping(value = "/buy", method = RequestMethod.GET)
	public String buy() {
		return "buy";
	}	
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write() {
		
		return "write";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String review() {
		return "review";
	}
}
