package com.doctor.health.mapper;

import java.util.List;
import com.doctor.health.domain.LifestyleRecords;


public interface LifestyleRecordsMapper 
{
    /**
     * 查询生活习惯干预跟踪
     * 
     * @param lifestyleId 生活习惯干预跟踪主键
     * @return 生活习惯干预跟踪
     */
    public LifestyleRecords selectLifestyleRecordsByLifestyleId(Long lifestyleId);

    /**
     * 查询生活习惯干预跟踪列表
     * 
     * @param lifestyleRecords 生活习惯干预跟踪
     * @return 生活习惯干预跟踪集合
     */
    public List<LifestyleRecords> selectLifestyleRecordsList(LifestyleRecords lifestyleRecords);

    /**
     * 新增生活习惯干预跟踪
     * 
     * @param lifestyleRecords 生活习惯干预跟踪
     * @return 结果
     */
    public int insertLifestyleRecords(LifestyleRecords lifestyleRecords);

    /**
     * 修改生活习惯干预跟踪
     * 
     * @param lifestyleRecords 生活习惯干预跟踪
     * @return 结果
     */
    public int updateLifestyleRecords(LifestyleRecords lifestyleRecords);

    /**
     * 删除生活习惯干预跟踪
     * 
     * @param lifestyleId 生活习惯干预跟踪主键
     * @return 结果
     */
    public int deleteLifestyleRecordsByLifestyleId(Long lifestyleId);

    /**
     * 批量删除生活习惯干预跟踪
     * 
     * @param lifestyleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLifestyleRecordsByLifestyleIds(Long[] lifestyleIds);
}
