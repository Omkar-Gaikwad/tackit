package com.tackit.facade;

import com.tackit.dao.DashBoardDao;
import com.tackit.domain.DashBoard;

public class DashBoardManager {
	
	public int addNewDashBoard( DashBoard dashBoardtoAdd ){
	
		DashBoardDao dashBoardDao = new DashBoardDao();
				
		return dashBoardDao.addDash( dashBoardtoAdd );			
	}
	
}
