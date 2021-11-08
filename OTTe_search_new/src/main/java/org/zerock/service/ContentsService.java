package org.zerock.service;

import java.util.List;

import org.zerock.domain.ContentsVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;


public interface ContentsService {
	public ContentsVO view(Integer contentsid) throws Exception;
	List<ContentsVO> selectTopOrder()throws Exception;
	List<ContentsVO> selectKoreanOrder()throws Exception;
	List<ContentsVO> selectLatestOrder()throws Exception;
	List<ContentsVO> selectSearch(SearchCriteria cri)throws Exception;
	List<ContentsVO> selectWishlist(UserVO userVo)throws Exception;
}
