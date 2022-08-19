package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_jacket_location {
	private int jl_seq;
	private double jl_latitude;
	private double jl_longitude;
	private String jl_date;
	private int jacket_seq;
}
