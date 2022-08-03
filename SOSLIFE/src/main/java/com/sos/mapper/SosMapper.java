package com.sos.mapper;

import java.util.ArrayList;

import com.sos.domain.tbl_jacket;
import com.sos.domain.tbl_location;
import com.sos.domain.tbl_user;
import com.sos.domain.tbl_water;

public interface SosMapper {
	public tbl_user UserLogin(tbl_user user);
	public int UserJoin(tbl_user user);
	public int gpstest(tbl_location vo);
	public int watertest(tbl_water vo);
	public int registjacket(tbl_jacket jacket);
	public ArrayList<tbl_water> getdate();
}
