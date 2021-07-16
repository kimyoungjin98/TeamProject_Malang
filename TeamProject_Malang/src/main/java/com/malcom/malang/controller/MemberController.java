package com.malcom.malang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.malcom.malang.model.MemberVO;
import com.malcom.malang.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Controller
public class MemberController {
	
	protected final MemberService mService;

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession hSession) {
		
		hSession.removeAttribute("MEMBER");
		hSession = null;
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String mb_id, String mb_pw, HttpSession httpSession, Model model) {
		
		log.debug(mb_id, mb_pw);
		MemberVO mVO = mService.findByUser(mb_id, mb_pw);
		if(mVO == null) {
			
			model.addAttribute("MSG","아이디/비밀번호를 확인해주세요");
			return "member/login";
		}
		
		
		httpSession.setAttribute("MEMBER", mVO);
		return "redirect:/";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		
		return "member/join";
	}
	
	// String mb_id, String mb_pw, String mb_name
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(MemberVO vo) {
		
		
		mService.insert(vo);
		
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/role_update", method=RequestMethod.GET)
	public String update(@RequestParam(value="id") String id, 
						 @RequestParam(value="role") String role) {
		
		
		
		int mb_role = Integer.valueOf(role);
		int res = mService.roleUpdate(id, mb_role);
		log.debug("RESULT 값 {} ",res);
		
		if(0 == res) {
			return "OK";
		}
		
		return "FAIL";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG", "ADMIT");
		}
		return "member/mypage";
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfo(HttpSession session, Model model) {
		/*MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG", "ADMIT");
		}*/
		return "member/myinfo";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null) {
			model.addAttribute("MSG","REJECT");
		} else {
			model.addAttribute("MSG", "ADMIT");
		}
		return "member/cart";
	}
	
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String adminManage(HttpSession session, Model model) {
		MemberVO membervo = (MemberVO) session.getAttribute("MEMBER");
		if(membervo == null || membervo.getMb_role() < 2) {
			model.addAttribute("MSG","REJECT");
		} else {
			mService.adminManage(model);
		}
		
		return "member/manage";
	}
	
	
}
