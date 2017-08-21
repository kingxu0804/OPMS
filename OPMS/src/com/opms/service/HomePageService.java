package com.opms.service;

import java.util.List;

import com.opms.entity.PmsAlbums;
import com.opms.entity.PmsUsersProfileDepartPostion;

public interface HomePageService {

	public PmsUsersProfileDepartPostion selectUsersProfileDepartPostion(
			long userid);

	public List<PmsAlbums> listAlbumsByUserid(Long userid);
		
		

}
