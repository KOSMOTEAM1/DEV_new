package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ContentsVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.mapper.ContentsMapper;

@Service
//@Repository
public class ContentsServiceImpl implements ContentsService {

	/*
	 * @Inject private SqlSession sql; private static String namespace =
	 * "org.zerock.mapper.contentsMapper";
	 * 
	 * @Override public ContentsVO read(Integer contents_id) throws Exception {
	 * return sql.selectOne(namespace + ".read", contents_id);
	 */
	@Autowired
	private ContentsMapper ContentsMapper;

	@Transactional
	@Override
	public List<ContentsVO> selectTopOrder() throws Exception {
		return ContentsMapper.selectTopOrder();
	}

	@Override
	public List<ContentsVO> selectKoreanOrder() throws Exception {
		return ContentsMapper.selectKoreanOrder();
	}

	@Override
	public List<ContentsVO> selectLatestOrder() throws Exception {
		return ContentsMapper.selectLatestOrder();
	}

	@Override
	public ContentsVO view(Integer contentsid) throws Exception {
		return ContentsMapper.view(contentsid);
	}

	@Override
	public List<ContentsVO> selectSearch(SearchCriteria cri) throws Exception {
		return ContentsMapper.selectSearch(cri);
	}

	@Override
	public List<ContentsVO> selectWishlist(UserVO userVo) throws Exception {
		return ContentsMapper.selectWishlist(userVo);
	}

	@Override
	public List<ContentsVO> selectViewReply(Integer contentsid) throws Exception {
		return ContentsMapper.selectViewReply(contentsid);
	}

	@Override
	public ContentsVO selectAvgscore(Integer contentsid) throws Exception {
		return ContentsMapper.selectAvgscore(contentsid);
	}

	@Override
	public ContentsVO selectReviewcnt(Integer contentsid) throws Exception {
		return ContentsMapper.selectReviewcnt(contentsid);
	}

	@Override
	public void addReview(ContentsVO vo) {
		ContentsMapper.addReview(vo);
	}

}
