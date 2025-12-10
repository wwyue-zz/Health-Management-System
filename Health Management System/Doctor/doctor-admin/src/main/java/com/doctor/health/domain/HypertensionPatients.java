package com.doctor.health.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.doctor.common.annotation.Excel;
import com.doctor.common.core.domain.BaseEntity;


public class HypertensionPatients extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 患者唯一ID，主键 */
    private Long patientId;

    /** 患者姓名 */
    @Excel(name = "患者姓名")
    private String name;

    /** 性别 */
    @Excel(name = "性别")
    private String gender;

    /** 身份证号（18位） */
    @Excel(name = "身份证号", readConverterExp = "1=8位")
    private String idCard;

    /** 出生日期 */
    @Excel(name = "出生日期", readConverterExp = "用=于自动计算年龄")
    private Date birthday;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String contactPhone;

    /** 住址 */
    @Excel(name = "住址")
    private String address;

    /** 身高（cm） */
    @Excel(name = "身高", readConverterExp = "c=m")
    private BigDecimal height;

    /** 体重（kg） */
    @Excel(name = "体重", readConverterExp = "k=g")
    private BigDecimal weight;

    /** BMI指数 */
    @Excel(name = "BMI指数", readConverterExp = "自=动计算")
    private BigDecimal bmi;

    /** 高血压病史 */
    @Excel(name = "高血压家族病史", readConverterExp = "如=祖父母、父母患病情况")
    private String familyHistory;

    /** 并发症 */
    @Excel(name = "并发症", readConverterExp = "如=冠心病、脑卒中、肾病等")
    private String complication;

    /** 时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入住养老机构时间[1](@ref)", width = 30, dateFormat = "yyyy-MM-dd")
    private Date admissionDate;

    /** 记录创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createdAt;

    /** 记录更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "记录更新时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date updatedAt;

    public void setPatientId(Long patientId) 
    {
        this.patientId = patientId;
    }

    public Long getPatientId() 
    {
        return patientId;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setGender(String gender) 
    {
        this.gender = gender;
    }

    public String getGender() 
    {
        return gender;
    }
    public void setIdCard(String idCard) 
    {
        this.idCard = idCard;
    }

    public String getIdCard() 
    {
        return idCard;
    }
    public void setBirthday(Date birthday) 
    {
        this.birthday = birthday;
    }

    public Date getBirthday() 
    {
        return birthday;
    }
    public void setContactPhone(String contactPhone) 
    {
        this.contactPhone = contactPhone;
    }

    public String getContactPhone() 
    {
        return contactPhone;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setHeight(BigDecimal height) 
    {
        this.height = height;
    }

    public BigDecimal getHeight() 
    {
        return height;
    }
    public void setWeight(BigDecimal weight) 
    {
        this.weight = weight;
    }

    public BigDecimal getWeight() 
    {
        return weight;
    }
    public void setBmi(BigDecimal bmi) 
    {
        this.bmi = bmi;
    }

    public BigDecimal getBmi() 
    {
        return bmi;
    }
    public void setFamilyHistory(String familyHistory) 
    {
        this.familyHistory = familyHistory;
    }

    public String getFamilyHistory() 
    {
        return familyHistory;
    }
    public void setComplication(String complication) 
    {
        this.complication = complication;
    }

    public String getComplication() 
    {
        return complication;
    }
    public void setAdmissionDate(Date admissionDate) 
    {
        this.admissionDate = admissionDate;
    }

    public Date getAdmissionDate() 
    {
        return admissionDate;
    }
    public void setCreatedAt(Date createdAt) 
    {
        this.createdAt = createdAt;
    }

    public Date getCreatedAt() 
    {
        return createdAt;
    }
    public void setUpdatedAt(Date updatedAt) 
    {
        this.updatedAt = updatedAt;
    }

    public Date getUpdatedAt() 
    {
        return updatedAt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this)
            .append("患者姓名", getName())
            .append("性别", getGender())
            .append("出生日期", getBirthday())
            .append("身高", getHeight())
            .append("体重", getWeight())
            .append("bmi", getBmi())
            .append("家族病史", getFamilyHistory())
            .append("并发症", getComplication())
            .toString();
    }
}
