package com.editube.dao;

import java.util.List;
import java.util.Map;

import com.editube.dto.BoardDto;

public interface BoardDao {

	public List<BoardDto> getList(Map<String, String> lmap);

	public int getBoardCount();

	public BoardDto getContent(Integer cbnum);
	
	public void boardInsert(BoardDto board);

}
