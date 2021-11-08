package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ContentsVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface ContentsMapper{
	List<ContentsVO> selectTopOrder();
	List<ContentsVO> selectKoreanOrder();
	List<ContentsVO> selectLatestOrder();
	List<ContentsVO> selectSearch(SearchCriteria cri);
	ContentsVO view(Integer contentsid);
	List<ContentsVO> selectWishlist(UserVO userVo);
	List<ContentsVO> selectViewReply(Integer contentsid);
	
	
	
	
	
}
