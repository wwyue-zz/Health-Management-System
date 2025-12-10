package com.doctor.health.mapper;

import java.util.List;
import com.doctor.health.domain.Health;


public interface HealthMapper 
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
     * 删除用户健康情况
     * 
     * @param id 用户健康情况主键
     * @return 结果
     */
    public int deleteHealthById(Long id);

    /**
     * 批量删除用户健康情况
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHealthByIds(Long[] ids);
}
