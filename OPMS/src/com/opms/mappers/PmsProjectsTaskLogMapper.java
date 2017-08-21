package com.opms.mappers;

import com.opms.entity.PmsProjectsTaskLog;
import com.opms.entity.PmsProjectsTaskLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsProjectsTaskLogMapper {
	
	void insertLog(PmsProjectsTaskLog log);
	
	List<PmsProjectsTaskLog> selectByTaskid(Long taskid);
	
    int countByExample(PmsProjectsTaskLogExample example);

    int deleteByExample(PmsProjectsTaskLogExample example);

    int deleteByPrimaryKey(Long id);

    int insert(PmsProjectsTaskLog record);

    int insertSelective(PmsProjectsTaskLog record);

    List<PmsProjectsTaskLog> selectByExampleWithBLOBs(PmsProjectsTaskLogExample example);

    List<PmsProjectsTaskLog> selectByExample(PmsProjectsTaskLogExample example);

    PmsProjectsTaskLog selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PmsProjectsTaskLog record, @Param("example") PmsProjectsTaskLogExample example);

    int updateByExampleWithBLOBs(@Param("record") PmsProjectsTaskLog record, @Param("example") PmsProjectsTaskLogExample example);

    int updateByExample(@Param("record") PmsProjectsTaskLog record, @Param("example") PmsProjectsTaskLogExample example);

    int updateByPrimaryKeySelective(PmsProjectsTaskLog record);

    int updateByPrimaryKeyWithBLOBs(PmsProjectsTaskLog record);

    int updateByPrimaryKey(PmsProjectsTaskLog record);
}