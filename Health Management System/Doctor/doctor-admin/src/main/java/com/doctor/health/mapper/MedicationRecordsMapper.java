package com.doctor.health.mapper;

import java.util.List;
import com.doctor.health.domain.MedicationRecords;


public interface MedicationRecordsMapper 
{
    /**
     * 查询降压药物使用及效果记录
     * 
     * @param medId 降压药物使用及效果记录主键
     * @return 降压药物使用及效果记录
     */
    public MedicationRecords selectMedicationRecordsByMedId(Long medId);

    /**
     * 查询降压药物使用及效果记录列表
     * 
     * @param medicationRecords 降压药物使用及效果记录
     * @return 降压药物使用及效果记录集合
     */
    public List<MedicationRecords> selectMedicationRecordsList(MedicationRecords medicationRecords);

    /**
     * 新增降压药物使用及效果记录
     * 
     * @param medicationRecords 降压药物使用及效果记录
     * @return 结果
     */
    public int insertMedicationRecords(MedicationRecords medicationRecords);

    /**
     * 修改降压药物使用及效果记录
     * 
     * @param medicationRecords 降压药物使用及效果记录
     * @return 结果
     */
    public int updateMedicationRecords(MedicationRecords medicationRecords);

    /**
     * 删除降压药物使用及效果记录
     * 
     * @param medId 降压药物使用及效果记录主键
     * @return 结果
     */
    public int deleteMedicationRecordsByMedId(Long medId);

    /**
     * 批量删除降压药物使用及效果记录
     * 
     * @param medIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMedicationRecordsByMedIds(Long[] medIds);
}
