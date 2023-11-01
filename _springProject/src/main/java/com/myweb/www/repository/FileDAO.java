package com.myweb.www.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.myweb.www.domain.FileVO;

public interface FileDAO {

	int insert(FileVO fvo);

	List<FileVO> getflist(int bno);

	int deletefile(String uuid);

	int insertfile(long bno, MultipartFile[] files);

	List<FileVO> selectListAllFiles();

}
