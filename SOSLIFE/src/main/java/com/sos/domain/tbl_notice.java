package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_notice {
	private int notice_seq;
	private String notice_subject;
	private String notice_content;
	private String notice_file;
	private String notice_date;
	private String notice_id;
	private int notice_count;
}
