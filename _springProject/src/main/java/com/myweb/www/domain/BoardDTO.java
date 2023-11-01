package com.myweb.www.domain;

import java.util.List;

import lombok.ToString;

import lombok.Setter;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

		private BoardVO bvo;
		private List<FileVO> flist;
		
}
