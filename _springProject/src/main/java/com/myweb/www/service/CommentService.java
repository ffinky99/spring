package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentService {

	int postCmt(CommentVO cvo);

	PagingHandler getList(int bno, PagingVO pgvo);

	int delete(int cno);


	int modify(CommentVO cvo);

}
