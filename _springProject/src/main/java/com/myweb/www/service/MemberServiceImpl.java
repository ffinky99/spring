package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mdao;

	@Override
	@Transactional
	public int register(MemberVO mvo) {
		int isOk =mdao.register(mvo);
		return  mdao.insertAuthInit(mvo);
	}

	@Override
	public boolean lastLogin(String authEmail) {
		return mdao.lastLogin(authEmail)>0 ? true : false;
	}

	@Override
	public List<MemberVO> getMemberList() {
		// TODO Auto-generated method stub
		return mdao.getMemberList();
	}

	@Override
	public int modiPwd(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.modiPwd(mvo);
	}

	@Override
	public int delete(String email) {
		mdao.delAuthUser(email);
		return mdao.delete(email);
	}


}
