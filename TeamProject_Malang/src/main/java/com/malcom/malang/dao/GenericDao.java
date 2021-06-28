package com.malcom.malang.dao;

import java.util.List;

public interface GenericDao<VO, PK> {

	public List<VO> select();
	public VO findById(String PK);
	public Integer insert(VO vo);
	public Integer update(VO vo);
	public Integer delete(String PK);
	
}