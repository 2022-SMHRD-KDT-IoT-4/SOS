package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_power {
	private int power_seq;
	private int jacket_seq;
	private String power_yn;
	private String power_date;
}
