package com.myweb.www.handler;

import java.io.File;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myweb.www.domain.FileVO;
import com.myweb.www.repository.FileDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FileSweeper {
	private final String BASE_PATH = "D:\\_myweb\\_java\\fileupload\\";
	
	@Inject
	private FileDAO fdao;
	
	//초 분 시 일 월 요일 년도(생략가능)
	@Scheduled(cron = "0 25 21 * * *")
	public void fileSweeper() {
		log.info(">>>>>>>>>>fileSweeper>>>>>>>> : { }>"+LocalDateTime.now());
	
		//
		List<FileVO> dblist = fdao.selectListAllFiles();
		
		List<String> currFiles = new ArrayList<String>();
		
		for(FileVO fvo : dblist) {
			String filePath = fvo.getSaveDir()+"\\"+fvo.getUuid();
			String fileName = fvo.getFileName();
			currFiles.add(BASE_PATH+filePath+"_"+fileName);
			
			//이미지 파일이면 썸네일
			if(fvo.getFileType() > 0) {
				currFiles.add(BASE_PATH+filePath+"_th_"+fileName);
			}
		}
		//날짜를 반영한 폴더 구조 경로 만들기
		LocalDate now = LocalDate.now();
		String today = now.toString();
		today = today.replace("-", File.separator);
		
		//경로를 기반으로 저장되어 있는 파일을 검색
		File dir = Paths.get(BASE_PATH + today).toFile();
		File[] allFileObjects = dir.listFiles();
		
		//실제 저장되어 있는 파일과 db에 존재하는 파일을 비교하여 없으면 삭제 진행
		for(File file : allFileObjects) {
			String storedFileName = file.toPath().toString();
			if(!currFiles.contains(storedFileName)) {
				file.delete(); //파일삭제
				log.info(">>>>>>>delete File > {} >>"+storedFileName);
			}
		}
	}

		
}
