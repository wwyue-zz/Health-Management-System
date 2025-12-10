package com.doctor.health.mapper;

import java.util.List;
import com.doctor.health.domain.FollowUpRecords;


public interface FollowUpRecordsMapper 
{
    /**
     * 查询随访及风险评估
     * 
     * @param followId 随访及风险评估主键
     * @return 随访及风险评估
     */
    public FollowUpRecords selectFollowUpRecordsByFollowId(Long followId);

    /**
     * 查询随访及风险评估列表
     * 
     * @param followUpRecords 随访及风险评估
     * @return 随访及风险评估集合
     */
    public List<FollowUpRecords> selectFollowUpRecordsList(FollowUpRecords followUpRecords);

    /**
     * 新增随访及风险评估
     * 
     * @param followUpRecords 随访及风险评估
     * @return 结果
     */
    public int insertFollowUpRecords(FollowUpRecords followUpRecords);

    /**
     * 修改随访及风险评估
     * 
     * @param followUpRecords 随访及风险评估
     * @return 结果
     */
    public int updateFollowUpRecords(FollowUpRecords followUpRecords);

    /**
     * 删除随访及风险评估
     * 
     * @param followId 随访及风险评估主键
     * @return 结果
     */
    public int deleteFollowUpRecordsByFollowId(Long followId);

    /**
     * 批量删除随访及风险评估
     * 
     * @param followIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowUpRecordsByFollowIds(Long[] followIds);
}
