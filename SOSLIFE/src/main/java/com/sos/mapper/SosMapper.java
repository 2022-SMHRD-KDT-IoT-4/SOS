package com.sos.mapper;

import java.util.ArrayList;

import com.sos.domain.android_jacketinfo;
import com.sos.domain.tbl_as;
import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_jacket_location;
import com.sos.domain.tbl_location;
import com.sos.domain.tbl_notice;
import com.sos.domain.tbl_power;
import com.sos.domain.tbl_question;
import com.sos.domain.tbl_user;
import com.sos.domain.tbl_water;
import com.sos.domain.userJacketUseInfo;

public interface SosMapper {
	// DB에서 ID와 PW를 비교하여 로그인을 진행하는 메소드
	public tbl_user UserLogin(tbl_user user);
	// 회원가입 정보를 받아 DB에 삽입하는 메소드
	public int UserJoin(tbl_user user);
	// GPS센서 값을 받아 DB에 삽입하는 메소드
	public int gpstest(tbl_location vo);
	// Water센서 값을 받아 DB에 삽입하는 메소드
	public int watertest(tbl_water vo);
	// 구명조끼 등록 정보를 받아 DB에 삽입하는 메소드
	public int registjacket(tbl_jacket jacket);
	// Water 센서가 저장되있는 DB에서 정보를 가져오는 메소드
	public tbl_water getdate(String jacket_seq);
	// Jacket의 정보가 저장되있는 DB에서 정보를 가져오는 메소드
	public ArrayList<tbl_jacket> getjacketinfo(String user_id);
	// 공지사항 입력 정보를 받아 DB에 삽입하는 메소드
	public int noticeInsert(tbl_notice notice);
	// 질문사항 입력 정보를 받아 DB에 삽입하는 메소드
	public int questionInsert(tbl_question question);
	// AS 입력 정보를 받아 DB에 삽입하는 메소드
	public int asInsert(tbl_as as);
	// 공지사항 리스트 정보 조회 메소드
	public ArrayList<tbl_notice> noticelist();
	// 공지사항 글 정보 조회 메소드
	public tbl_notice OneNotice(int notice_seq);
	// 공지사항 글 정보 수정 메소드
	public int noticeUpdate(tbl_notice notice);
	// 공지사항 조회수 증가 메소드
	public int noticeCount(int notice_seq);
	// 1:1문의 정보 조회 메소드
	public ArrayList<tbl_question> managerMainList();
	// Jacket 사용하는 유저 정보를 가져오는 메소드
	public ArrayList<tbl_jacket> getjacketuseuser();
	// 안드로이드 구명조끼 정보 조회 메소드
	public ArrayList<android_jacketinfo> androidJacketInfo(String user_id);
	// 해당 사용자의 Jacket 정보를 가져오는 메소드
	public ArrayList<tbl_jacket> getjacketinfodetail(String user_id);
	// 문의사항 정보 조회 메소드
	public ArrayList<tbl_question> getquestioninfo();
	// 문의사항 세부 정보 조회 메소드
	public tbl_question getquestiondetail(int q_seq);
	// 구명조끼 위치 DB에 삽입하는 메소드
	public int jacketLocationInsert(tbl_jacket_location location);
	// 연결상태 DB에 삽입하는 메소드
	public int connectInsert(tbl_power power);
	// 구명조끼 위치 최근 이력 조회 메소드
	public tbl_jacket_location getRecodeLocation(tbl_jacket_location location);
	// 사용자별 구명조끼 수, 문의사항 수 조회 메소드
	public ArrayList<userJacketUseInfo> getUserJacketUseInfo();
	// 사용자 구명조끼(센서값) 상세사항 조회 메소드
	public ArrayList<tbl_water> UserJacketDetailInfo(String user_id);
	// 사용자 구명조끼별 식별번호 조회 메소드
	public ArrayList<tbl_jacket> UserJacketProductId(String user_id);
	// 사용자 구명조끼 상세정보 조회 메소드
	public ArrayList<tbl_water> userJacketDetailInfo2(String user_id);
}
