package com.doctor.health.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.doctor.common.annotation.Excel;
import com.doctor.common.core.domain.BaseEntity;


public class HealthRecords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long recordId;

    /** 关联患者ID */
    @Excel(name = "关联患者ID")
    private Long patientId;

    /** 记录日期及时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录日期及时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordDate;

    /** 收缩压（mmHg） */
    @Excel(name = "收缩压", readConverterExp = "m=mHg")
    private Long systolicBp;

    /** 舒张压（mmHg） */
    @Excel(name = "舒张压", readConverterExp = "m=mHg")
    private Long diastolicBp;

    /** 血压分级 */
    @Excel(name = "血压分级")
    private String bpLevel;

    /** 心率（次/分钟） */
    @Excel(name = "心率", readConverterExp = "次=/分钟")
    private Long heartRate;

    /** 异常症状 */
    @Excel(name = "异常症状")
    private String notes;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String name;

    public void setRecordId(Long recordId) 
    {
        this.recordId = recordId;
    }

    public Long getRecordId() 
    {
        return recordId;
    }

    public void setPatientId(Long patientId) 
    {
        this.patientId = patientId;
    }

    public Long getPatientId() 
    {
        return patientId;
    }

    public void setRecordDate(Date recordDate) 
    {
        this.recordDate = recordDate;
    }

    public Date getRecordDate() 
    {
        return recordDate;
    }

    public void setSystolicBp(Long systolicBp) 
    {
        this.systolicBp = systolicBp;
    }

    public Long getSystolicBp() 
    {
        return systolicBp;
    }

    public void setDiastolicBp(Long diastolicBp) 
    {
        this.diastolicBp = diastolicBp;
    }

    public Long getDiastolicBp() 
    {
        return diastolicBp;
    }

    public void setBpLevel(String bpLevel) 
    {
        this.bpLevel = bpLevel;
    }

    public String getBpLevel() 
    {
        return bpLevel;
    }

    public void setHeartRate(Long heartRate) 
    {
        this.heartRate = heartRate;
    }

    public Long getHeartRate() 
    {
        return heartRate;
    }

    public void setNotes(String notes) 
    {
        this.notes = notes;
    }

    public String getNotes() 
    {
        return notes;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
            .append("记录时间", getRecordDate())
            .append("收缩压", getSystolicBp())
            .append("舒张压", getDiastolicBp())
            .append("高血压等级", getBpLevel())
            .append("心率", getHeartRate())
            .append("异常症状", getNotes())
            .toString();
    }
}
