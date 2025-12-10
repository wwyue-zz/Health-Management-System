package com.doctor.health.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.doctor.health.mapper.HypertensionPatientsMapper;
import com.doctor.health.domain.HypertensionPatients;
import com.doctor.health.service.IHypertensionPatientsService;


@Service
public class HypertensionPatientsServiceImpl implements IHypertensionPatientsService 
{
    @Autowired
    private HypertensionPatientsMapper hypertensionPatientsMapper;

    /**
     * 查询患者基本信息
     * 
     * @param patientId 患者基本信息主键
     * @return 患者基本信息
     */
    @Override
    public HypertensionPatients selectHypertensionPatientsByPatientId(Long patientId)
    {
        return hypertensionPatientsMapper.selectHypertensionPatientsByPatientId(patientId);
    }

    /**
     * 查询患者基本信息列表
     * 
     * @param hypertensionPatients 患者基本信息
     * @return 患者基本信息
     */
    @Override
    public List<HypertensionPatients> selectHypertensionPatientsList(HypertensionPatients hypertensionPatients)
    {
        return hypertensionPatientsMapper.selectHypertensionPatientsList(hypertensionPatients);
    }

    /**
     * 新增患者基本信息
     * 
     * @param hypertensionPatients 患者基本信息
     * @return 结果
     */
    @Override
    public int insertHypertensionPatients(HypertensionPatients hypertensionPatients)
    {
        return hypertensionPatientsMapper.insertHypertensionPatients(hypertensionPatients);
    }

    /**
     * 修改患者基本信息
     * 
     * @param hypertensionPatients 患者基本信息
     * @return 结果
     */
    @Override
    public int updateHypertensionPatients(HypertensionPatients hypertensionPatients)
    {
        return hypertensionPatientsMapper.updateHypertensionPatients(hypertensionPatients);
    }

    /**
     * 批量删除患者基本信息
     * 
     * @param patientIds 需要删除的患者基本信息主键
     * @return 结果
     */
    @Override
    public int deleteHypertensionPatientsByPatientIds(Long[] patientIds)
    {
        return hypertensionPatientsMapper.deleteHypertensionPatientsByPatientIds(patientIds);
    }

    /**
     * 删除患者基本信息信息
     * 
     * @param patientId 患者基本信息主键
     * @return 结果
     */
    @Override
    public int deleteHypertensionPatientsByPatientId(Long patientId)
    {
        return hypertensionPatientsMapper.deleteHypertensionPatientsByPatientId(patientId);
    }
}
