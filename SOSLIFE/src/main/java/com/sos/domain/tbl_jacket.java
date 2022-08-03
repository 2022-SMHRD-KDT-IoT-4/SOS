package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_jacket {
	private int jacket_seq;
	private String user_id;
	private int ship_seq;
	private String jacket_date;
	private String product_id;
}
