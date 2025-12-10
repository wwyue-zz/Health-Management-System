package com.doctor.health.service;

import java.util.List;
import com.doctor.health.domain.Health;


public interface IHealthService 
{
    /**
     * 查询用户健康情况
     * 
     * @param id 用户健康情况主键
     * @return 用户健康情况
     */
    public Health selectHealthById(Long id);

    /**
     * 查询用户健康情况列表
     * 
     * @param health 用户健康情况
     * @return 用户健康情况集合
     */
    public List<Health> selectHealthList(Health health);

    /**
     * 新增用户健康情况
     * 
     * @param health 用户健康情况
     * @return 结果
     */
    public int insertHealth(Health health);

    /**
     * 修改用户健康情况
     * 
     * @param health 用户健康情况
     * @return 结果
     */
    public int updateHealth(Health health);

    /**
     * 批量删除用户健康情况
     * 
     * @param ids 需要删除的用户健康情况主键集合
     * @return 结果
     */
    public int deleteHealthByIds(Long[] ids);

    /**
     * 删除用户健康情况信息
     * 
     * @param id 用户健康情况主键
     * @return 结果
     */
    public int deleteHealthById(Long id);
}
