package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ContentsVO;
import org.zerock.domain.Criteria;

public interface ContentsMapper{
	List<ContentsVO> selectTopOrder();
	List<ContentsVO> selectKoreanOrder();
	List<ContentsVO> selectLatestOrder();
	List<ContentsVO> selectSearch(Criteria cri);
	ContentsVO view(Integer contentsid);
}
