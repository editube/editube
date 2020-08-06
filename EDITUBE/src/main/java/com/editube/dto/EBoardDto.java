package com.editube.dto;

import java.sql.Timestamp;

import com.editube.dto.EBoardDto;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class EBoardDto {
	private int p_num;
	private String p_mnickname;
	private String p_title;
	private String p_content;
	private int p_cost;
	private String p_link;
	private int p_status;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Timestamp p_timepart;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Timestamp p_redate;
	private int p_view;
	private String pf_sysname;
	private String pf_oriname;
}
