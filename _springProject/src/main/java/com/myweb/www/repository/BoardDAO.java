package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.PagingVO;

public interface BoardDAO {

	int register(BoardVO bvo);

	List<BoardVO> getlist(PagingVO pgvo);

	BoardVO getdatil(int bno);

	int modify(BoardVO bvo);

	void delete(int bno);

	int getTotalCount(PagingVO pgvo);

	int insert(BoardVO bvo);

	long selectOneBno();

	void updateCmtQty(@Param("bno") int bno, @Param("cmtQty") int cmtQty);

	void updateCmtQty();

	void updatehasFile();

}
