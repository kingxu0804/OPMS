package com.opms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opms.entity.PmsAlbums;
import com.opms.entity.PmsUsersProfileDepartPostion;
import com.opms.mappers.PmsMyHomePageMapper;
import com.opms.service.HomePageService;
@Service
public class HomePageServiceImpl implements HomePageService{
	 @Autowired
	 private PmsMyHomePageMapper pmsMyHomePageMapper;
	@Override
	public PmsUsersProfileDepartPostion selectUsersProfileDepartPostion(
			long userid) {
		
		return pmsMyHomePageMapper.selectUsersProfileDepartPostion(userid);
	}
	@Override
	public List<PmsAlbums> listAlbumsByUserid(Long userid) {
		
		return pmsMyHomePageMapper.listAlbumsByUserid(userid);
	}

}
