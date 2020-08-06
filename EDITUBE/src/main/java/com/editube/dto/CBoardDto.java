package com.editube.dto;

import java.sql.Timestamp;

import com.editube.dto.CBoardDto;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CBoardDto {
	private int cb_num;
	private String cb_mnickname;
	private String cb_content;
	private String cb_title;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Timestamp cb_date;
}
