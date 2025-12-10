package com.doctor.health.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.doctor.health.mapper.HealthRecordsMapper;
import com.doctor.health.domain.HealthRecords;
import com.doctor.health.service.IHealthRecordsService;


@Service
public class HealthRecordsServiceImpl implements IHealthRecordsService 
{
    @Autowired
    private HealthRecordsMapper healthRecordsMapper;

    /**
     * 查询血压及生命体征记录
     * 
     * @param recordId 血压及生命体征记录主键
     * @return 血压及生命体征记录
     */
    @Override
    public HealthRecords selectHealthRecordsByRecordId(Long recordId)
    {
        return healthRecordsMapper.selectHealthRecordsByRecordId(recordId);
    }

    /**
     * 查询血压及生命体征记录列表
     * 
     * @param healthRecords 血压及生命体征记录
     * @return 血压及生命体征记录
     */
    @Override
    public List<HealthRecords> selectHealthRecordsList(HealthRecords healthRecords)
    {
        return healthRecordsMapper.selectHealthRecordsList(healthRecords);
    }

    /**
     * 新增血压及生命体征记录
     * 
     * @param healthRecords 血压及生命体征记录
     * @return 结果
     */
    @Override
    public int insertHealthRecords(HealthRecords healthRecords)
    {
        return healthRecordsMapper.insertHealthRecords(healthRecords);
    }

    /**
     * 修改血压及生命体征记录
     * 
     * @param healthRecords 血压及生命体征记录
     * @return 结果
     */
    @Override
    public int updateHealthRecords(HealthRecords healthRecords)
    {
        return healthRecordsMapper.updateHealthRecords(healthRecords);
    }

    /**
     * 批量删除血压及生命体征记录
     * 
     * @param recordIds 需要删除的血压及生命体征记录主键
     * @return 结果
     */
    @Override
    public int deleteHealthRecordsByRecordIds(Long[] recordIds)
    {
        return healthRecordsMapper.deleteHealthRecordsByRecordIds(recordIds);
    }

    /**
     * 删除血压及生命体征记录信息
     * 
     * @param recordId 血压及生命体征记录主键
     * @return 结果
     */
    @Override
    public int deleteHealthRecordsByRecordId(Long recordId)
    {
        return healthRecordsMapper.deleteHealthRecordsByRecordId(recordId);
    }
}
