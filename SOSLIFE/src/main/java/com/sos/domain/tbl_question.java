package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_question {
	private int q_seq;
	private String q_name;
	private String q_email;
	private String q_content;
	private String q_phone;
	private String q_date;
	private String user_id;
	private String q_type;
}
