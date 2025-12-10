package com.doctor.health.service;

import java.util.List;
import com.doctor.health.domain.HealthRecords;


public interface IHealthRecordsService 
{
    /**
     * 查询血压及生命体征记录
     * 
     * @param recordId 血压及生命体征记录主键
     * @return 血压及生命体征记录
     */
    public HealthRecords selectHealthRecordsByRecordId(Long recordId);

    /**
     * 查询血压及生命体征记录列表
     * 
     * @param healthRecords 血压及生命体征记录
     * @return 血压及生命体征记录集合
     */
    public List<HealthRecords> selectHealthRecordsList(HealthRecords healthRecords);

    /**
     * 新增血压及生命体征记录
     * 
     * @param healthRecords 血压及生命体征记录
     * @return 结果
     */
    public int insertHealthRecords(HealthRecords healthRecords);

    /**
     * 修改血压及生命体征记录
     * 
     * @param healthRecords 血压及生命体征记录
     * @return 结果
     */
    public int updateHealthRecords(HealthRecords healthRecords);

    /**
     * 批量删除血压及生命体征记录
     * 
     * @param recordIds 需要删除的血压及生命体征记录主键集合
     * @return 结果
     */
    public int deleteHealthRecordsByRecordIds(Long[] recordIds);

    /**
     * 删除血压及生命体征记录信息
     * 
     * @param recordId 血压及生命体征记录主键
     * @return 结果
     */
    public int deleteHealthRecordsByRecordId(Long recordId);
}
