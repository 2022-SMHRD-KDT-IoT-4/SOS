package com.sos.mapper;

import java.util.ArrayList;

import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_location;
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
}
