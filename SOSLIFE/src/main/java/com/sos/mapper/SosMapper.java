package com.sos.mapper;

import java.util.ArrayList;

import com.sos.domain.tbl_as;
import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_location;
import com.sos.domain.tbl_notice;
import com.sos.domain.tbl_question;
import com.sos.domain.tbl_user;
import com.sos.domain.tbl_water;

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
	public ArrayList<tbl_jacket> getjacketinfo();
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
}
