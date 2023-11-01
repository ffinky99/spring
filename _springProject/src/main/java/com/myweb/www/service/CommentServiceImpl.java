package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.repository.BoardDAO;
import com.myweb.www.repository.CommentDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CommentServiceImpl implements CommentService {
	@Inject
	private CommentDAO cdao;
	private BoardDAO bdao;

	@Override
	public int postCmt(CommentVO cvo) {
		
		int  isOk = cdao.postCmt(cvo);
//		int cmtQty = cdao.getcmtQty(cvo.getBno());
//		log.info(cmtQty+"ddddddddddddddddddddddddddddddddd");
//		log.info(cvo.getBno()+"getbno~~~~~~~~~~~~~~~~~~~");
//		bdao.updateCmtQty(cvo.getBno(),cmtQty);
//		log.info("여기냐??????????????????????????");
		return isOk;
	}
	
	@Transactional
	@Override
	public PagingHandler getList(int bno ,PagingVO pgvo) {
		//totalcount 
		int totalcount= cdao.selectOneBnoTotalCount(bno);
		//comment list
		List <CommentVO> list= cdao.selectListPaging(bno,pgvo);
		//pagingHandler 값 완성 리턴
		PagingHandler ph = new PagingHandler(pgvo, totalcount,list);
	
		return ph;
	}

	@Override
	public int delete(int cno) {
		// TODO Auto-generated method stub
		return cdao.delete(cno);
	}

	@Override
	public int modify(CommentVO cvo) {
		// TODO Auto-generated method stub
		return cdao.modify(cvo);
	}

}
