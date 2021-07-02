package com.malcom.malang.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.malcom.malang.dao.BoardDao;
import com.malcom.malang.model.BoardVO;
import com.malcom.malang.service.BoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImplV1 implements BoardService{

	protected final BoardDao bDao;
	
	@Override
	public List<BoardVO> select() {
		// TODO Auto-generated method stub
		
		List<BoardVO> bdVO = bDao.select();
		
		return bdVO;
	}

	@Override
	public Integer insert(BoardVO vo) {
		// TODO Auto-generated method stub
		
		bDao.insert(vo);
		
		return null;
	}

	@Override
	public Integer update(BoardVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer delete(String PK) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}