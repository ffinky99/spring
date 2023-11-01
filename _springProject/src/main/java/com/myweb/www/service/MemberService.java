package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	boolean lastLogin(String authEmail);

	List<MemberVO> getMemberList();

	int modiPwd(MemberVO mvo);

	int delete(String email);


}
