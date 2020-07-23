package com.editube.dto;

import java.sql.Timestamp;

import com.editube.dto.MemberDto;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberDto {
	private String m_id;
	private String m_nickname;
	private int m_usertype;
	private String m_name;
	private String m_birth;
	private String m_password;
	private String m_phonenum;
	private int m_account;
	private String m_accountname;
	@JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Timestamp m_joindate;
}
