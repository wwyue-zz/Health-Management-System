package com.doctor.health.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.doctor.common.annotation.Excel;
import com.doctor.common.core.domain.BaseEntity;


public class MedicationRecords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 药物ID */
    private Long medId;

    /** 患者ID */
    @Excel(name = "患者ID")
    private Long patientId;

    /** 药物名称 */
    @Excel(name = "药物名称")
    private String drugName;

    /** 剂量 */
    @Excel(name = "剂量")
    private String dosage;

    /** 用药频率 */
    @Excel(name = "用药频率")
    private String frequency;

    /** 开始用药日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始用药日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date startDate;

    /** 停药日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "停药日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endDate;

    /** 疗效评估 */
    @Excel(name = "疗效评估")
    private String effect;

    /** 药物不良反应 */
    @Excel(name = "药物不良反应")
    private String sideEffects;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String name;

    public void setMedId(Long medId) 
    {
        this.medId = medId;
    }

    public Long getMedId() 
    {
        return medId;
    }

    public void setPatientId(Long patientId) 
    {
        this.patientId = patientId;
    }

    public Long getPatientId() 
    {
        return patientId;
    }

    public void setDrugName(String drugName) 
    {
        this.drugName = drugName;
    }

    public String getDrugName() 
    {
        return drugName;
    }

    public void setDosage(String dosage) 
    {
        this.dosage = dosage;
    }

    public String getDosage() 
    {
        return dosage;
    }

    public void setFrequency(String frequency) 
    {
        this.frequency = frequency;
    }

    public String getFrequency() 
    {
        return frequency;
    }

    public void setStartDate(Date startDate) 
    {
        this.startDate = startDate;
    }

    public Date getStartDate() 
    {
        return startDate;
    }

    public void setEndDate(Date endDate) 
    {
        this.endDate = endDate;
    }

    public Date getEndDate() 
    {
        return endDate;
    }

    public void setEffect(String effect) 
    {
        this.effect = effect;
    }

    public String getEffect() 
    {
        return effect;
    }

    public void setSideEffects(String sideEffects) 
    {
        this.sideEffects = sideEffects;
    }

    public String getSideEffects() 
    {
        return sideEffects;
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
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("medId", getMedId())
            .append("patientId", getPatientId())
            .append("drugName", getDrugName())
            .append("dosage", getDosage())
            .append("frequency", getFrequency())
            .append("startDate", getStartDate())
            .append("endDate", getEndDate())
            .append("effect", getEffect())
            .append("sideEffects", getSideEffects())
            .append("name", getName())
            .toString();
    }
}
