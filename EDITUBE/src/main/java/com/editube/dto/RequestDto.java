package com.editube.dto;

import lombok.Data;
import java.sql.Timestamp;

@Data
public class RequestDto {
	private int rq_num;
	private int rq_status;
	private int rq_content;
	private String rq_mnickname;
	private String rq_targetnickname;
	private Timestamp rq_date;
	private String rq_msg;
}
