package com.malcom.malang.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.malcom.malang.model.ItemVO;
import com.malcom.malang.model.OptionVO;
import com.malcom.malang.service.DescriptionService;
import com.malcom.malang.service.ItemService;
import com.malcom.malang.service.OptionService;
import com.malcom.malang.service.insertService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class insertController {
	
	protected final insertService iService;
	
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public String insert() {
		
		
		
		return "/item/insert";
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(ItemVO itVO) { // , @RequestBody Map<String, String> maps) {
		
		
//		log.debug("옵션 {}",opList.toString());
//		log.debug("상품정보 {}", itVO.toString());
		
		iService.insert(itVO);
		
		
		return "/item/insert";
	}

}
