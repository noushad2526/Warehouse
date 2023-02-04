package com.warehouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	//home page
	@RequestMapping("/")
	public String homePage(Model m) {
		return "home";
	}	
}
