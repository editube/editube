package com.editube.dao;

import java.util.*;

import com.editube.dto.BfileDto;
import com.editube.dto.CBoardDto;
import com.editube.dto.EBoardDto;
import com.editube.dto.UBoardDto;
import com.editube.dto.ReplyDto;
public interface BoardDao {

	public List<UBoardDto> getUList(Map<String, String> lmap);

	public int getUBoardCount();

	public void viewUpdate(Integer bnum);

	public UBoardDto getUContents(Integer bnum);

	public void uboardInsert(UBoardDto uboard);

}
