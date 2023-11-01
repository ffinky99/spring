package com.myweb.www.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentDAO {

	int postCmt(CommentVO cvo);

	PagingHandler getList(@Param("bno")int bno,@Param("pgvo") PagingVO pgvo);

	int delete(int cno);

	int modify(CommentVO cvo);

	int selectOneBnoTotalCount(int bno);

	List<CommentVO> selectListPaging(@Param("bno") int bno,@Param("pgvo") PagingVO pgvo);

	int getcmtQty(int bno);

}
