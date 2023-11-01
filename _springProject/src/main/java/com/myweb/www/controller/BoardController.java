package com.myweb.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.www.domain.BoardDTO;
import com.myweb.www.domain.BoardVO;
import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.FileHandler;
import com.myweb.www.handler.PagingHandler;
import com.myweb.www.service.BoardService;

import lombok.Delegate;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private BoardService bsv;
	
	@Inject
	private FileHandler fh;
	
	@GetMapping("/register")
	public void register(){
	
	}
	@Transactional
	@PostMapping("/register")
	public String registerboard(BoardVO bvo, RedirectAttributes re,@RequestParam(name="files", required=false)MultipartFile[] files) {
		List<FileVO> flist =new ArrayList<>();
		if(files[0].getSize()>0) {
			flist = fh.uploadFiles(files);
		}
		int inUp = bsv.insert(new BoardDTO (bvo,flist));
//		int isOk = bsv.register(bvo);
		return "index";
		
	}
	//paging 추가

	@GetMapping("/list")
	public void list(Model m , PagingVO pgvo ) {
//		log.info(">>>>>>>>>>>pagingVO"+pgvo);
		List<BoardVO> list = bsv.getlist(pgvo);
		m.addAttribute("list", list);
//		페이징 처리
//		총 페이지 개수 totalCount
		int totalCount =  bsv.getTotalCount(pgvo);
		PagingHandler ph =  new PagingHandler(pgvo, totalCount);
		m.addAttribute("ph",ph);
		
	}
	@Transactional
	@GetMapping({"/detail","/modify"})
	public void detailmodfiy(Model m ,@RequestParam("bno") int bno) {
		 
		BoardDTO bdto= bsv.getdetail(bno);
		log.info("bdto><><><><><><>>>>>"+bdto.getFlist().size());
		m.addAttribute("bdto", bdto);
		
	}
	@Transactional
	@PostMapping("/modify")	
	public String modify(BoardVO bvo, Model m ,@RequestParam(name="files", required=false)MultipartFile[] files){
		List<FileVO> flist =new ArrayList<>();
		if(files[0].getSize()>0) {
			flist = fh.uploadFiles(files);
			int inUp = bsv.insertfile(new BoardDTO (bvo,flist));
		}
		int isOk = bsv.modify(bvo);
		m.addAttribute("bvo", bvo);
		log.info(bvo.getBno()+"bno<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
		return "redirect:/board/detail?bno="+bvo.getBno();
		
	}
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") int bno){
		bsv.delete(bno);
		
		return "redirect:/board/list";
	}
	@DeleteMapping("/delete/{uuid}")
	public ResponseEntity<String> delete( @PathVariable("uuid") String uuid) {
		int isOk=0;
		isOk = bsv.deletefile(uuid);
		return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK) 
				: new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
