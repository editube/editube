package com.editube.dao;

import java.util.*;

import com.editube.dto.BfileDto;
import com.editube.dto.CBoardDto;
import com.editube.dto.ChatbotDto;
import com.editube.dto.EBoardDto;
import com.editube.dto.UBoardDto;
import com.editube.dto.ReplyDto;
import com.editube.dto.RequestDto;
public interface BoardDao {

	public List<UBoardDto> getUList(Map<String, String> lmap);

	public List<UBoardDto> getTList(Map<String, String> lmap);
	
	public List<UBoardDto> getDList(Map<String, String> lmap);

	public int getUTBoardCount();
	public int getUDBoardCount();

	public UBoardDto getUTContent(Integer ubnum);
	public UBoardDto getUDContent(Integer ubnum);
	public UBoardDto getUContent(Integer ubnum);
	public void viewUpdate(Integer bnum);


	public void uboardInsert(UBoardDto uboard);

	public void boardUpdate(UBoardDto uboard);

	public void boardUDelete(int ubnum);

	public List<ChatbotDto> getCList(Map<String, String> lmap);

	public void chatInsert(ChatbotDto cDto);

	public RequestDto chkReq(Integer ubnum);


}
