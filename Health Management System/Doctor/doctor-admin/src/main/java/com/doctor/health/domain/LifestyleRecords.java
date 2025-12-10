package com.doctor.health.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.doctor.common.annotation.Excel;
import com.doctor.common.core.domain.BaseEntity;


public class LifestyleRecords extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long lifestyleId;

    /** 患者ID */
    @Excel(name = "患者ID")
    private Long patientId;

    /** 记录日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date recordDate;

    /** 饮食方案 */
    @Excel(name = "饮食方案")
    private String dietPlan;

    /** 盐摄入量 */
    @Excel(name = "盐摄入量")
    private String saltIntake;

    /** 运动频率 */
    @Excel(name = "运动频率")
    private String exerciseFrequency;

    /** 吸烟情况 */
    @Excel(name = "吸烟情况")
    private String smokingStatus;

    /** 饮酒情况 */
    @Excel(name = "饮酒情况")
    private String alcoholIntake;

    /** 睡眠质量 */
    @Excel(name = "睡眠质量")
    private String sleepQuality;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String name;

    public void setLifestyleId(Long lifestyleId) 
    {
        this.lifestyleId = lifestyleId;
    }

    public Long getLifestyleId() 
    {
        return lifestyleId;
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

    public void setDietPlan(String dietPlan) 
    {
        this.dietPlan = dietPlan;
    }

    public String getDietPlan() 
    {
        return dietPlan;
    }

    public void setSaltIntake(String saltIntake) 
    {
        this.saltIntake = saltIntake;
    }

    public String getSaltIntake() 
    {
        return saltIntake;
    }

    public void setExerciseFrequency(String exerciseFrequency) 
    {
        this.exerciseFrequency = exerciseFrequency;
    }

    public String getExerciseFrequency() 
    {
        return exerciseFrequency;
    }

    public void setSmokingStatus(String smokingStatus) 
    {
        this.smokingStatus = smokingStatus;
    }

    public String getSmokingStatus() 
    {
        return smokingStatus;
    }

    public void setAlcoholIntake(String alcoholIntake) 
    {
        this.alcoholIntake = alcoholIntake;
    }

    public String getAlcoholIntake() 
    {
        return alcoholIntake;
    }

    public void setSleepQuality(String sleepQuality) 
    {
        this.sleepQuality = sleepQuality;
    }

    public String getSleepQuality() 
    {
        return sleepQuality;
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
            .append("lifestyleId", getLifestyleId())
            .append("patientId", getPatientId())
            .append("recordDate", getRecordDate())
            .append("dietPlan", getDietPlan())
            .append("saltIntake", getSaltIntake())
            .append("exerciseFrequency", getExerciseFrequency())
            .append("smokingStatus", getSmokingStatus())
            .append("alcoholIntake", getAlcoholIntake())
            .append("sleepQuality", getSleepQuality())
            .append("name", getName())
            .toString();
    }
}
