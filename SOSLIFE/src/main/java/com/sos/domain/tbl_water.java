package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class tbl_water {
	private int water_seq;
	private int jacket_seq;
	private double water_pressure;
	private String water_date;
	private double water_temperature;
	private double water_detect;
}
