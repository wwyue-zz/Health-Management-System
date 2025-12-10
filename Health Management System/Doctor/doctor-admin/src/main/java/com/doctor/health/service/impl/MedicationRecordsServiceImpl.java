package com.doctor.health.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.doctor.health.mapper.MedicationRecordsMapper;
import com.doctor.health.domain.MedicationRecords;
import com.doctor.health.service.IMedicationRecordsService;


@Service
public class MedicationRecordsServiceImpl implements IMedicationRecordsService 
{
    @Autowired
    private MedicationRecordsMapper medicationRecordsMapper;

    /**
     * 查询降压药物使用及效果记录
     * 
     * @param medId 降压药物使用及效果记录主键
     * @return 降压药物使用及效果记录
     */
    @Override
    public MedicationRecords selectMedicationRecordsByMedId(Long medId)
    {
        return medicationRecordsMapper.selectMedicationRecordsByMedId(medId);
    }

    /**
     * 查询降压药物使用及效果记录列表
     * 
     * @param medicationRecords 降压药物使用及效果记录
     * @return 降压药物使用及效果记录
     */
    @Override
    public List<MedicationRecords> selectMedicationRecordsList(MedicationRecords medicationRecords)
    {
        return medicationRecordsMapper.selectMedicationRecordsList(medicationRecords);
    }

    /**
     * 新增降压药物使用及效果记录
     * 
     * @param medicationRecords 降压药物使用及效果记录
     * @return 结果
     */
    @Override
    public int insertMedicationRecords(MedicationRecords medicationRecords)
    {
        return medicationRecordsMapper.insertMedicationRecords(medicationRecords);
    }

    /**
     * 修改降压药物使用及效果记录
     * 
     * @param medicationRecords 降压药物使用及效果记录
     * @return 结果
     */
    @Override
    public int updateMedicationRecords(MedicationRecords medicationRecords)
    {
        return medicationRecordsMapper.updateMedicationRecords(medicationRecords);
    }

    /**
     * 批量删除降压药物使用及效果记录
     * 
     * @param medIds 需要删除的降压药物使用及效果记录主键
     * @return 结果
     */
    @Override
    public int deleteMedicationRecordsByMedIds(Long[] medIds)
    {
        return medicationRecordsMapper.deleteMedicationRecordsByMedIds(medIds);
    }

    /**
     * 删除降压药物使用及效果记录信息
     * 
     * @param medId 降压药物使用及效果记录主键
     * @return 结果
     */
    @Override
    public int deleteMedicationRecordsByMedId(Long medId)
    {
        return medicationRecordsMapper.deleteMedicationRecordsByMedId(medId);
    }
}
