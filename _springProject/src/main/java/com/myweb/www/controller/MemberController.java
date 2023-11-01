package com.myweb.www.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.security.MemberVO;
import com.myweb.www.service.MemberService;

import ch.qos.logback.core.encoder.Encoder;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member/**")
@Controller
public class MemberController {
	
	@Inject
	private BCryptPasswordEncoder bcEncoder;
	@Inject
	private MemberService msv;
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(MemberVO mvo){
		log.info(mvo+"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		mvo.setPwd(bcEncoder.encode(mvo.getPwd()));
		int isOk = msv.register(mvo);
		return "index";
	}
	@GetMapping("/login")
	public void login() {
		
	}
	@PostMapping("/login")
	public String login(HttpServletRequest request , 
			RedirectAttributes re) {
		log.info(">>>>>>>>>errMsg"+request.getAttribute("errMsg"));
		re.addAttribute("email",request.getAttribute("email"));
		re.addAttribute("errMsg",request.getAttribute("errMsg"));
		return "redirect:/member/login";
	}
	@GetMapping("/detail")
	public void detail(){
		
	}
	
	@GetMapping("/list")
	public String list(Model m) {
		List<MemberVO> list = msv.getMemberList();
		log.info(list+"<<<<<<<<<<<<<<<list");
		m.addAttribute("list",list);
		return "/member/list";
	}
	@GetMapping("/modipwd")
	public void modipwd() {
		
	}
	@PostMapping("/modipwd")
	public String modipwd(MemberVO mvo) {
		mvo.setPwd(bcEncoder.encode(mvo.getPwd()));
		int isOk = msv.modiPwd(mvo);
		
		return "index";
		
	}
	@GetMapping("/delete") public String delete(String email){
		int isOk =  msv.delete(email);
		return "redirect:/member/logout";
	}
}
