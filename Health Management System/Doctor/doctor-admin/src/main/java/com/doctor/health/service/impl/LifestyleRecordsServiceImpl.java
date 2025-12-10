package com.doctor.health.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.doctor.health.mapper.LifestyleRecordsMapper;
import com.doctor.health.domain.LifestyleRecords;
import com.doctor.health.service.ILifestyleRecordsService;


@Service
public class LifestyleRecordsServiceImpl implements ILifestyleRecordsService 
{
    @Autowired
    private LifestyleRecordsMapper lifestyleRecordsMapper;

    /**
     * 查询生活习惯干预跟踪
     * 
     * @param lifestyleId 生活习惯干预跟踪主键
     * @return 生活习惯干预跟踪
     */
    @Override
    public LifestyleRecords selectLifestyleRecordsByLifestyleId(Long lifestyleId)
    {
        return lifestyleRecordsMapper.selectLifestyleRecordsByLifestyleId(lifestyleId);
    }

    /**
     * 查询生活习惯干预跟踪列表
     * 
     * @param lifestyleRecords 生活习惯干预跟踪
     * @return 生活习惯干预跟踪
     */
    @Override
    public List<LifestyleRecords> selectLifestyleRecordsList(LifestyleRecords lifestyleRecords)
    {
        return lifestyleRecordsMapper.selectLifestyleRecordsList(lifestyleRecords);
    }

    /**
     * 新增生活习惯干预跟踪
     * 
     * @param lifestyleRecords 生活习惯干预跟踪
     * @return 结果
     */
    @Override
    public int insertLifestyleRecords(LifestyleRecords lifestyleRecords)
    {
        return lifestyleRecordsMapper.insertLifestyleRecords(lifestyleRecords);
    }

    /**
     * 修改生活习惯干预跟踪
     * 
     * @param lifestyleRecords 生活习惯干预跟踪
     * @return 结果
     */
    @Override
    public int updateLifestyleRecords(LifestyleRecords lifestyleRecords)
    {
        return lifestyleRecordsMapper.updateLifestyleRecords(lifestyleRecords);
    }

    /**
     * 批量删除生活习惯干预跟踪
     * 
     * @param lifestyleIds 需要删除的生活习惯干预跟踪主键
     * @return 结果
     */
    @Override
    public int deleteLifestyleRecordsByLifestyleIds(Long[] lifestyleIds)
    {
        return lifestyleRecordsMapper.deleteLifestyleRecordsByLifestyleIds(lifestyleIds);
    }

    /**
     * 删除生活习惯干预跟踪信息
     * 
     * @param lifestyleId 生活习惯干预跟踪主键
     * @return 结果
     */
    @Override
    public int deleteLifestyleRecordsByLifestyleId(Long lifestyleId)
    {
        return lifestyleRecordsMapper.deleteLifestyleRecordsByLifestyleId(lifestyleId);
    }
}
