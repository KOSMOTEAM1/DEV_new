package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ComentVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.mapper.BoardMapper;

@Service
//@Configuration
//@MapperScan("org.zerock.mapper")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Override
	@Transactional
	public List<BoardVO> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}

	public BoardVO insertBoard(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.insertBoard(board);
	}

	public BoardVO selectBoardOne(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardOne(board);
	}

	public BoardVO deleteBoardOne(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.deleteBoardOne(board);
	}

	public BoardVO read(Integer num) throws Exception {
		return boardMapper.read(num);
	}
	
	
	public void updateA(BoardVO board) throws Exception {

		boardMapper.updateA(board);
	}
	
	public void updateB(BoardVO board) throws Exception {

		boardMapper.updateB(board);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return boardMapper.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return boardMapper.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return boardMapper.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return boardMapper.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return boardMapper.listSearchCount(cri);
	}

}