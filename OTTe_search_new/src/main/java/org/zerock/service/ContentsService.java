package org.zerock.service;

import java.util.List;

import org.zerock.domain.ContentsVO;


public interface ContentsService {
	//public ContentsVO read(Integer contents_id) throws Exception;
	List<ContentsVO> selectContentsAll() throws Exception;
}
