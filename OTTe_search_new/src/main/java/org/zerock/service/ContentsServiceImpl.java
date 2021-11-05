package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ContentsVO;
import org.zerock.mapper.ContentsMapper;

@Service
//@Repository
public class ContentsServiceImpl implements ContentsService {

	/*@Inject
	private SqlSession sql;
	private static String namespace = "org.zerock.mapper.contentsMapper";
	
	@Override
	public ContentsVO read(Integer contents_id) throws Exception {
		return sql.selectOne(namespace + ".read", contents_id);*/
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
}
