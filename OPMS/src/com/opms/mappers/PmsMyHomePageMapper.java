package com.opms.mappers;

import java.util.List;

import com.opms.entity.PmsAlbums;
import com.opms.entity.PmsUsersProfileDepartPostion;

public interface PmsMyHomePageMapper {

	PmsUsersProfileDepartPostion selectUsersProfileDepartPostion(long userid);

	List<PmsAlbums> listAlbumsByUserid(Long userid);

}
