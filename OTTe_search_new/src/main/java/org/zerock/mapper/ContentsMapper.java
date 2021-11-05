package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ContentsVO;
import org.zerock.domain.SearchCriteria;

public interface ContentsMapper{
	List<ContentsVO> selectTopOrder();
	List<ContentsVO> selectKoreanOrder();
	List<ContentsVO> selectLatestOrder();
	List<ContentsVO> selectSearch(SearchCriteria cri);
	ContentsVO view(Integer contentsid);
}
