package com.doctor.health.service.impl;

import java.util.List;
import com.doctor.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.doctor.health.mapper.HealthMapper;
import com.doctor.health.domain.Health;
import com.doctor.health.service.IHealthService;


@Service
public class HealthServiceImpl implements IHealthService 
{
    @Autowired
    private HealthMapper healthMapper;

    /**
     * 查询用户健康情况
     * 
     * @param id 用户健康情况主键
     * @return 用户健康情况
     */
    @Override
    public Health selectHealthById(Long id)
    {
        return healthMapper.selectHealthById(id);
    }

    /**
     * 查询用户健康情况列表
     * 
     * @param health 用户健康情况
     * @return 用户健康情况
     */
    @Override
    public List<Health> selectHealthList(Health health)
    {
        return healthMapper.selectHealthList(health);
    }

    /**
     * 新增用户健康情况
     * 
     * @param health 用户健康情况
     * @return 结果
     */
    @Override
    public int insertHealth(Health health)
    {
        health.setCreateTime(DateUtils.getNowDate());
        return healthMapper.insertHealth(health);
    }

    /**
     * 修改用户健康情况
     * 
     * @param health 用户健康情况
     * @return 结果
     */
    @Override
    public int updateHealth(Health health)
    {
        health.setUpdateTime(DateUtils.getNowDate());
        return healthMapper.updateHealth(health);
    }

    /**
     * 批量删除用户健康情况
     * 
     * @param ids 需要删除的用户健康情况主键
     * @return 结果
     */
    @Override
    public int deleteHealthByIds(Long[] ids)
    {
        return healthMapper.deleteHealthByIds(ids);
    }

    /**
     * 删除用户健康情况信息
     * 
     * @param id 用户健康情况主键
     * @return 结果
     */
    @Override
    public int deleteHealthById(Long id)
    {
        return healthMapper.deleteHealthById(id);
    }
}
