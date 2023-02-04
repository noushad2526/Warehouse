package com.warehouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.warehouse.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	StoreService storeService;

	//checking for duplicate store name
		@RequestMapping("/duplicateStore")
		public ResponseEntity<Object> checkDuplicateStore() {
			String[] storeNames = storeService.getStoreNames();
			Gson gson = new Gson(); 
			String jsonStoreName = gson.toJson(storeNames); 
			return new ResponseEntity<Object>(jsonStoreName, HttpStatus.OK); 
		} 
}
