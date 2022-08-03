package com.sos.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sos.domain.tbl_location;
import com.sos.domain.tbl_water;
import com.sos.mapper.SosMapper;

@RestController
public class SosRestController {
	@Autowired
	SosMapper mapper;
	
	@RequestMapping("/gpstest.do")
	public void gpstest(String data) {
		String lat_pre[] = data.split("lat\": ");
		String lat_result[] = lat_pre[1].split(",");
		String long_pre[] = lat_result[1].split("log\": ");
		String long_pre_re[] = long_pre[1].split("}");
		String long_result = long_pre_re[0];
		tbl_location vo = new tbl_location(0, 0, Double.parseDouble(lat_result[0]), Double.parseDouble(long_result));
		int row = mapper.gpstest(vo);
	}
	
	@RequestMapping("/watertest.do")
	public void watertest(String data) {
		System.out.println(data);
		String water_pre[] = data.split("r\": \"");
		String water_result[] = water_pre[1].split("\",");
		String pres_pre[] = water_result[1].split("es\": \"");
		String pres_result[] = pres_pre[1].split("\", ");
		String temp_pre[] = water_result[2].split("p\": \"");
		String temp_result[] = temp_pre[1].split("\"}");
		tbl_water vo = new tbl_water(0,4,Double.parseDouble(pres_result[0]),"",Double.parseDouble(temp_result[0]),Double.parseDouble(water_result[0]));
		int row = mapper.watertest(vo);
		System.out.println(row);
	}
	
	@RequestMapping("/getdate.do")
	public ArrayList<tbl_water> MainChart(HttpServletResponse response) {
		ArrayList<tbl_water> vo = mapper.getdate();
		try {
			PrintWriter out = response.getWriter();
			for(tbl_water result : vo) {
				out.print(result);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return vo;
	}
}
