package com.sos.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sos.domain.android_jacketinfo;
import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_location;
import com.sos.domain.tbl_notice;
import com.sos.domain.tbl_question;
import com.sos.domain.tbl_user;
import com.sos.domain.tbl_water;
import com.sos.mapper.SosMapper;

@RestController
public class SosRestController {
	@Autowired
	SosMapper mapper;
	
	// GPS센서의 정보를 받아 DB에 저장하는 메소드
	@RequestMapping("/gpstest.do")
	public void gpstest(String data) {
		String lat_pre[] = data.split("lat\": ");
		String lat_result[] = lat_pre[1].split(",");
		String long_pre[] = lat_result[1].split("log\": ");
		String long_pre_re[] = long_pre[1].split("}");
		String long_result = long_pre_re[0];
		tbl_location vo = new tbl_location(0, 0, Double.parseDouble(lat_result[0]), Double.parseDouble(long_result));
		int row = mapper.gpstest(vo);
	}
	
	// Water센서의 정보를 받아 DB에 저장하는 메소드
	@RequestMapping("/watertest.do")
	public void watertest(String resultwater, String resultgps) {
		System.out.println(resultwater);
		System.out.println(resultgps);
		/*String water_pre[] = data.split("r\": \"");
		String water_result[] = water_pre[1].split("\",");
		String pres_pre[] = water_result[1].split("es\": \"");
		String pres_result[] = pres_pre[1].split("\", ");
		String temp_pre[] = water_result[2].split("p\": \"");
		String temp_result[] = temp_pre[1].split("\"}");
		tbl_water vo = new tbl_water(0,4,Double.parseDouble(pres_result[0]),"",Double.parseDouble(temp_result[0]),Double.parseDouble(water_result[0]));
		int row = mapper.watertest(vo);	
		System.out.println(row);*/
	}
	
	// Water센서의 정보를 가져와 전달하는 메소드
	@RequestMapping("/getdate.do")
	public tbl_water MainChart(String jacket_seq) {
		tbl_water vo = mapper.getdate(jacket_seq);
		return vo;
	}
	
	// Jacket 사용자 정보(중복제거)를 가져와 전달하는 메소드
	@RequestMapping("/getjacketuseuser.do")
	public ArrayList<tbl_jacket> GetJacketUseUser(){
		ArrayList<tbl_jacket> vo = mapper.getjacketuseuser();
		return vo;
	}
	
	// 해당 사용자 Jacket 정보를 가져와 전달하는 메소드
	@RequestMapping("/getjacketinfodetail.do")
	public ArrayList<tbl_jacket> GetJacketInfoDetail(String user_id){
		ArrayList<tbl_jacket> vo = mapper.getjacketinfodetail(user_id);
		return vo;
	}
	// Jacket의 정보를 가져와 전달하는 메소드
	@RequestMapping("/getjacketinfo.do")
	public ArrayList<tbl_jacket> GetJacketInfo(String user_id){
		ArrayList<tbl_jacket> vo = mapper.getjacketinfo(user_id);
		return vo;
	}
	
	// 문의사항 정보를 가져와 전달하는 메소드
	@RequestMapping("/getquestioninfo.do")
	public ArrayList<tbl_question> GetQuestionInfo(){
		ArrayList<tbl_question> vo = mapper.getquestioninfo();
		return vo;
	}
	
	// 공지사항 정보 
	
	// 공지사항 정보를 받아 전달하는 메소드
	@RequestMapping("/getnoticelist.do")
	public ArrayList<tbl_notice> GetNoticeList(){
		ArrayList<tbl_notice> vo = mapper.noticelist();
		System.out.println(vo);
		return vo;
	}
	
	// 안드로이드 로그인 정보를 받아 로그인 기능을 하는 메소드
	@RequestMapping("/applogin.do")
	public JSONObject AppLogin(tbl_user user, HttpSession session){
		JSONObject result = new JSONObject();
		JSONArray jarray = new JSONArray();
		tbl_user vo = mapper.UserLogin(user);
		if(vo!=null) {
			JSONObject row = new JSONObject();
			row.put("user_id", vo.getUser_id());
			row.put("user_pw", vo.getUser_pw());
			row.put("user_nick", vo.getUser_nick());
			row.put("user_type", vo.getUser_type());
			row.put("user_joindate", vo.getUser_joindate());
			System.out.println(row);
			jarray.add(0,row);
			result.put("userInfo", jarray);
		}else {
			result=null;
		}
		return result;
	}
	
	// 안드로이드 회원가입 진행 후 결과 상황 반환 메소드
	@RequestMapping("/appregist.do")
	public int AppRegist(tbl_user user) {
		int row = mapper.UserJoin(user);
		return row;
	}
	
	// 공지사항 정보를 가져와 전달하는 메소드
	@RequestMapping("/noticelist.do")
	public ArrayList<tbl_notice> NoticeList(){
		ArrayList<tbl_notice> list = mapper.noticelist();
		return list;
	}
	
	// 안드로이드 관리자 메인페이지 관련 정보 전달 메소드
	@RequestMapping("/managermainlist.do")
	public JSONObject ManagerMainList() {
		JSONObject result = new JSONObject();
		JSONArray jarray = new JSONArray();
		ArrayList<tbl_question> list = mapper.managerMainList();
		for(int i=0; i<list.size(); i++) {
			JSONObject row = new JSONObject();
			tbl_question vo = list.get(i);
			row.put("q_name", vo.getQ_name());
			row.put("q_email", vo.getQ_email());
			row.put("q_phone", vo.getQ_phone());
			row.put("q_type", vo.getQ_type());
			row.put("q_content", vo.getQ_content());
			row.put("q_date", vo.getQ_date());
			row.put("q_user_id", vo.getUser_id());
			row.put("q_seq", vo.getQ_seq());
			System.out.println(row);
			jarray.add(i,row);
		}
		result.put("questionlist", jarray);
		return result;
	}
	
	// 안드로이드 일반회원 메인페이지 관련 정보 전달 메소드
	@RequestMapping("/memberjacketlist.do")
	public JSONObject MemberJacketList(String user_id) {
		JSONObject result = new JSONObject();
		JSONArray jarray = new JSONArray();
		ArrayList<android_jacketinfo> list = mapper.androidJacketInfo(user_id);
		Random rd = new Random();
		int value = rd.nextInt(100)+1;
		String bat = value+"";
		String[] con = {"정상", "불량"};
		for(int i=0; i<list.size(); i++) {
			JSONObject row = new JSONObject();
			android_jacketinfo vo = list.get(i);
			row.put("batterystatus", bat);
			row.put("connectstatus", con[0]);
			row.put("product_id", vo.getProduct_id());
			row.put("waterpressure", vo.getWater_pressure());
			row.put("watertemperature", vo.getWater_temperature());
			row.put("waterdetect", vo.getWater_detect());
			System.out.println(row);
			jarray.add(i,row);
		}
		result.put("androidjacketlist", jarray);
		return result;
	}
}
