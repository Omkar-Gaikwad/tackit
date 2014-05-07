package com.tackit.facade;

import java.util.ArrayList;

import com.tackit.dao.TackDao;
import com.tackit.domain.Tack;

public class TacksManager {

	public ArrayList<Tack> getAllTacks(){
		
		TackDao tackDao = new TackDao();
		
		return tackDao.getAllTacksDashandUserInfo();
		
	}
	
	public ArrayList<Tack> getLastNTacks( int n ){
		
		TackDao tackDao = new TackDao();
		
		return tackDao.getLastNTacksDashandUserInfo(n);
		
	}
	
	public int addTack(String boardId, Tack tack){
		
		TackDao tackDao = new TackDao();
		
		return tackDao.addTack(boardId, tack);
	}
	
}