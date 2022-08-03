package com.sos.web;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_location;
import com.sos.domain.tbl_user;
import com.sos.domain.tbl_water;
import com.sos.mapper.SosMapper;

@Controller
public class SosController {
	@Autowired
	SosMapper mapper;
	
	// Index 페이지(초기페이지)로 이동시켜주는 메소드
	@RequestMapping("/intro.do")
	public void intro() {}
	
	// Login 기능을 수행하는 메소드
	@RequestMapping("/login.do")
	public String login(tbl_user user, HttpSession session) {
		tbl_user result = mapper.UserLogin(user);
		
		String moveUrl = "";
		if(result != null) {
			session.setAttribute("user", result);
			if(result.getUser_type().equals("구조대")) {
				moveUrl = "mainPage2";
			}else if(result.getUser_type().equals("관리자")){
				moveUrl = "managerMain";
			}else {
				moveUrl = "memberMain";
			}
		}else {
			moveUrl = "redirect:/intro.do";
		}
		
		return moveUrl;
	}
	
	// 회원가입 기능을 수행하는 메소드
	@RequestMapping("/join.do")
	public String join(tbl_user user) {
		String moveUrl = "";
		int row = mapper.UserJoin(user);
		if(row > 0) {
			moveUrl = "nextPage";
		}else {
			moveUrl = "redirect:/intro.do";
		}
		return moveUrl;
	}
	
	// 사용자가 일반회원이였을 경우 memberMain.jsp로 이동시켜주는 메소드
	@RequestMapping("/memberMain.do")
	public void memberMain() {}
	
	// 구명조끼 등록페이지로 이동시켜주는 메소드
	@RequestMapping("/registjacket.do")
	public void registjacket() {}
	
	// 구명조끼 등록 정보를 받아 DB에 저장하는 메소드
	@RequestMapping("/regist_jacket.do")
	public String registjacket(HttpSession session,tbl_jacket jacket) {
		int row = 0;
		String moveUrl = "";
		if(session.getAttribute("user")==null) {
			moveUrl = "intro";
		}else {
			tbl_user user = (tbl_user)session.getAttribute("user");
			jacket.setUser_id(user.getUser_id());
			row = mapper.registjacket(jacket);
			if(row>0) {
				moveUrl = "memberMain";
			}else {
				moveUrl = "intro";
			}
		}
		return moveUrl;
	}
}
