package com.doctor.health.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.doctor.common.annotation.Excel;
import com.doctor.common.core.domain.BaseEntity;


public class Health extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户id */
    private Long id;

    /** 用户姓名 */
    @Excel(name = "用户姓名")
    private String name;

    /** 生活方式 */
    @Excel(name = "生活方式")
    private Long livestyle;

    /** 健康状况 */
    @Excel(name = "健康状况")
    private Long health;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }

    public void setLivestyle(Long livestyle) 
    {
        this.livestyle = livestyle;
    }

    public Long getLivestyle() 
    {
        return livestyle;
    }

    public void setHealth(Long health) 
    {
        this.health = health;
    }

    public Long getHealth() 
    {
        return health;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("livestyle", getLivestyle())
            .append("health", getHealth())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
