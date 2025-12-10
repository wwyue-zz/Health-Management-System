package com.doctor.health.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.doctor.common.annotation.Excel;
import com.doctor.common.core.domain.BaseEntity;


public class FollowUpRecords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long followId;

    /** 患者ID */
    @Excel(name = "患者ID")
    private Long patientId;

    /** 随访日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "随访日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date followDate;

    /** 下次随访计划日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "下次随访计划日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date nextDate;

    /** 医生评估意见 */
    @Excel(name = "医生评估意见")
    private String doctorNotes;

    /** 心血管风险等级 */
    @Excel(name = "心血管风险等级")
    private String riskAssessment;

    /** 转诊建议 */
    @Excel(name = "转诊建议")
    private String referral;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String name;

    public void setFollowId(Long followId) 
    {
        this.followId = followId;
    }

    public Long getFollowId() 
    {
        return followId;
    }

    public void setPatientId(Long patientId) 
    {
        this.patientId = patientId;
    }

    public Long getPatientId() 
    {
        return patientId;
    }

    public void setFollowDate(Date followDate) 
    {
        this.followDate = followDate;
    }

    public Date getFollowDate() 
    {
        return followDate;
    }

    public void setNextDate(Date nextDate) 
    {
        this.nextDate = nextDate;
    }

    public Date getNextDate() 
    {
        return nextDate;
    }

    public void setDoctorNotes(String doctorNotes) 
    {
        this.doctorNotes = doctorNotes;
    }

    public String getDoctorNotes() 
    {
        return doctorNotes;
    }

    public void setRiskAssessment(String riskAssessment) 
    {
        this.riskAssessment = riskAssessment;
    }

    public String getRiskAssessment() 
    {
        return riskAssessment;
    }

    public void setReferral(String referral) 
    {
        this.referral = referral;
    }

    public String getReferral() 
    {
        return referral;
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
            .append("医生评估意见", getDoctorNotes())
            .append("评估风险等级", getRiskAssessment())
            .toString();
    }
}
