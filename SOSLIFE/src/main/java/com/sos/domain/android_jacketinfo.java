package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class android_jacketinfo {
    private String product_id;
    private double water_pressure;
    private double water_temperature;
    private double water_detect;
}
