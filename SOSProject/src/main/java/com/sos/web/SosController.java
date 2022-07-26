package com.sos.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sos.mapper.SosMapper;

@Controller
public class SosController {
	@Autowired
	SosMapper mapper;
	
	
}
