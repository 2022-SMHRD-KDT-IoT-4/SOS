package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

//회원정보
@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_user {
	private String user_id;
	private String user_pw;
	private String user_nick;
	private String user_type;
	private String user_joindate;
}