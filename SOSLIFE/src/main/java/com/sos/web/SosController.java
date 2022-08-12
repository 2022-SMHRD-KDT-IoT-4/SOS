package com.sos.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sos.domain.tbl_as;
import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_location;
import com.sos.domain.tbl_notice;
import com.sos.domain.tbl_question;
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
		System.out.println(user.getUser_id());
		String moveUrl = "";
		if(result != null) {
			session.setAttribute("user", result);
			if(result.getUser_type().equals("구조대")) {
				moveUrl = "rescueMain";
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
		int row = mapper.UserJoin(user);
		return "redirect:/intro.do";
	}
	
	// 로그아웃 기능을 수행하는 메소드
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/intro.do";
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
	
	// 관리자 공지사항의 세부사항 데이터를 가져와 세부사항 페이지로 이동시켜주는 메소드
	@RequestMapping("/managerNoticeView.do")
	public void managerNoticeView(int notice_seq, Model model) {
		tbl_notice notice = mapper.OneNotice(notice_seq);
		mapper.noticeCount(notice_seq);
		model.addAttribute("noticeone", notice);
	}
	
	// 공지사항 세부사항 데이터를 가져와 수정 페이지로 이동시켜주는 메소드
	@RequestMapping("/managerNoticeEdit.do")
	public void managerNoticeEdit(int notice_seq, Model model) {
		tbl_notice notice = mapper.OneNotice(notice_seq);
		model.addAttribute("noticeedit", notice);
	}
	
	// 관리자 공지사항 리스트 페이지로 이동시켜주는 메소드
	@RequestMapping("/managerNoticeList.do")
	public void managerNoticeList() {}
	
	// 관리자 공지사항 등록 페이지로 이동시켜주는 메소드
	@RequestMapping("/managerNoticeWrite.do")
	public void managerNoticeWrite() {}
	
	// 관리자 공지사항 등록 정보를 받아 DB에 저장하는 메소드
	@RequestMapping("/managerNoticeInsert.do")
	public String managerNoticeInsert(@RequestParam("notice_file") MultipartFile file, HttpServletRequest request, @RequestParam("notice_subject") String notice_subject, @RequestParam("notice_content") String notice_content, HttpSession session) {
		String originalFile = file.getOriginalFilename();
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		String path = "C:\\eGovFrame-3.10.0\\workspace.edu\\SOSLIFEBACKUP\\src\\main\\webapp\\file\\";
		File files = new File(path + storedFileName);
		String notice_file = path + storedFileName;
		String notice_id = "";
		String moveUrl = "";
		if(session.getAttribute("user")!=null) {
			tbl_user user = (tbl_user)session.getAttribute("user");
			notice_id = user.getUser_id();
			try {
				file.transferTo(files);
				tbl_notice notice = new tbl_notice(0, notice_subject, notice_content, notice_file, "", notice_id, 0);
				mapper.noticeInsert(notice);
				moveUrl = "redirect:/managerNoticeList.do";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			moveUrl = "redirect:/managerNoticeWrite.do";
		}
		return moveUrl;
	}
	
	// 관리자 공지사항 수정 정보를 받아 DB에 저장하는 메소드
	@RequestMapping("/manageNoticeUpdate.do")
	public String managerNoticeUpdate(@RequestParam("notice_file") MultipartFile file, @RequestParam("notice_subject") String notice_subject, @RequestParam("notice_content") String notice_content, @RequestParam("notice_seq") int notice_seq) {
		String originalFile = file.getOriginalFilename();
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		String path = "C:\\eGovFrame-3.10.0\\workspace.edu\\SOSLIFEBACKUP\\src\\main\\webapp\\file\\";
		File files = new File(path + storedFileName);
		String notice_file = path + storedFileName;
		String notice_id = "";
		String moveUrl = "";
		try {
				file.transferTo(files);
				tbl_notice notice = new tbl_notice(notice_seq, notice_subject, notice_content, notice_file, "", notice_id, 0);
				int row = mapper.noticeUpdate(notice);
				if(row>0) {
					moveUrl = "redirect:/managerNoticeList.do";
				}else {
					moveUrl = "redirect:/managerNoticeWrite.do?notice_seq="+notice.getNotice_seq();
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		return moveUrl;
	}
	
	// 일반회원 공지사항 리스트 페이지로 이동시켜주는 메소드
	@RequestMapping("/memberNoticeList.do")
	public void memberNoticeList() {}
	
	// 일반회원 세부사항 데이터를 가져와 세부사항 페이지로 이동시켜주는 메소드
	@RequestMapping("/memberNoticeView.do")
	public void memberNoticeView(int notice_seq, Model model) {
		tbl_notice notice = mapper.OneNotice(notice_seq);
		mapper.noticeCount(notice_seq);
		model.addAttribute("noticeone", notice);
	}
	
	// 1:1 문의 페이지로 이동시켜주는 메소드
	@RequestMapping("/Question.do")
	public void Question() {}
	
	// 1:1 문의 데이터를 가져와 DB에 저장하는 메소드
	@RequestMapping("/question_insert.do")
	public String question_insert(tbl_question question, HttpSession session) {
		String moveUrl = "";
		if(session.getAttribute("user")!=null) {
			tbl_user user = (tbl_user)session.getAttribute("user");
			question.setUser_id(user.getUser_id());
			int row = mapper.questionInsert(question);
			if(row>0) {
				if(user.getUser_type().equals("구조대")) {
					moveUrl = "redirect:/rescueMain.do";
				}else if(user.getUser_type().equals("일반회원")) {
					moveUrl = "redirect:/memberMain.do";
				}
			}else {
				moveUrl = "redicrect:/Question.do";
			}
		}
		
		return moveUrl;
	}
	
	// 구조대 메인페이지 이동시켜주는 메소드
	@RequestMapping("/rescueMain.do")
	public void rescueMain() {}
	
	// 관리자 메인페이지 이동시켜주는 메소드
	@RequestMapping("/managerMain.do")
	public void managerMain() {}
	
	// 구조대 문의사항 페이지로 이동시켜주는 메소드
	@RequestMapping("/rescuequesiton.do")
	public void rescuequesiton() {}
	
	// 관리자 문의사항 페이지 이동시켜주는 메소드
	@RequestMapping("/managerQuestionList.do")
	public void managerQuestionList() {}
	
	// 관리자 문의사항 세부사항 페이지 이동시켜주는 메소드
	@RequestMapping("/managerQuestionView.do")
	public void managetQuestionView() {}
	
	// 관리자 문의사항 세부 데이터를 가져와 세부사항 페이지로 이동시켜주는 메소드
	@RequestMapping("/managerquestiondetail.do")
	public String managerQuestionDetail(int q_seq, Model model) {
		tbl_question question = mapper.getquestiondetail(q_seq);
		model.addAttribute("questionone", question);
		System.out.println(question);
		return "managerQuestionView";
	}
	
	@RequestMapping("/as_insert.do")
	public String As(@RequestParam("as_file") MultipartFile file, HttpServletRequest request, @RequestParam("as_subject") String as_subject, @RequestParam("as_content") String as_content, HttpSession session) {
		String originalFile = file.getOriginalFilename();
		String originalFileExtension = originalFile.substring(originalFile.lastIndexOf("."));
		String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
		String path = "C:\\eGovFrame-3.10.0\\workspace.edu\\SOSLIFEBACKUP\\src\\main\\webapp\\file\\";
		File files = new File(path + storedFileName);
		String as_file = path + storedFileName;
		String user_id = "";
		String moveUrl = "";
		if(session.getAttribute("user")!=null) {
			tbl_user user = (tbl_user)session.getAttribute("user");
			user_id = user.getUser_id();
			try {
				file.transferTo(files);
				tbl_as as = new tbl_as(0, as_subject, as_content, as_file, "", user_id);
				mapper.asInsert(as);
				moveUrl = "testBoard";
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			moveUrl = "testBoard";
		}
		return moveUrl;
	}
	
}
