package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ContentsVO;

public interface ContentsMapper{
	List<ContentsVO> selectTopOrder();
	List<ContentsVO> selectKoreanOrder();
	List<ContentsVO> selectLatestOrder();
}
