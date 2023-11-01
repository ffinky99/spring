package com.myweb.www.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardService {

	int register(BoardVO bvo);

	List<BoardVO> getlist(PagingVO pgvo);

	BoardDTO getdetail(int bno);

	int modify(BoardVO bvo);

	void delete(int bno);

	int getTotalCount(PagingVO pgvo);

	int insert(BoardDTO boardDTO);

	int deletefile(String uuid);

	int insertfile(BoardDTO boardDTO);

	

}
