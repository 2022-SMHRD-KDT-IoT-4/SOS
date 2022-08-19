package com.sos.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class userJacketUseInfo {
	private String user_id;
	private String jacket_count;
	private String question_count;
}
