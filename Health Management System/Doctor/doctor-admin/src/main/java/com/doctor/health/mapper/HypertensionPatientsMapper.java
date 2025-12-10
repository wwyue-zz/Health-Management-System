package com.doctor.health.mapper;

import java.util.List;
import com.doctor.health.domain.HypertensionPatients;


public interface HypertensionPatientsMapper 
{
    /**
     * 查询患者基本信息
     * 
     * @param patientId 患者基本信息主键
     * @return 患者基本信息
     */
    public HypertensionPatients selectHypertensionPatientsByPatientId(Long patientId);

    /**
     * 查询患者基本信息列表
     * 
     * @param hypertensionPatients 患者基本信息
     * @return 患者基本信息集合
     */
    public List<HypertensionPatients> selectHypertensionPatientsList(HypertensionPatients hypertensionPatients);

    /**
     * 新增患者基本信息
     * 
     * @param hypertensionPatients 患者基本信息
     * @return 结果
     */
    public int insertHypertensionPatients(HypertensionPatients hypertensionPatients);

    /**
     * 修改患者基本信息
     * 
     * @param hypertensionPatients 患者基本信息
     * @return 结果
     */
    public int updateHypertensionPatients(HypertensionPatients hypertensionPatients);

    /**
     * 删除患者基本信息
     * 
     * @param patientId 患者基本信息主键
     * @return 结果
     */
    public int deleteHypertensionPatientsByPatientId(Long patientId);

    /**
     * 批量删除患者基本信息
     * 
     * @param patientIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHypertensionPatientsByPatientIds(Long[] patientIds);
}
