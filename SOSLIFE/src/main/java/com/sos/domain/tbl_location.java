package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_location {
	private int loc_seq;
	private int ship_seq;
	private double latitude;
	private double longitude;
}
