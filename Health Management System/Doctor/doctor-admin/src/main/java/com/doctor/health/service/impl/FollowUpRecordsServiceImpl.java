package com.doctor.health.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.doctor.health.mapper.FollowUpRecordsMapper;
import com.doctor.health.domain.FollowUpRecords;
import com.doctor.health.service.IFollowUpRecordsService;


@Service
public class FollowUpRecordsServiceImpl implements IFollowUpRecordsService 
{
    @Autowired
    private FollowUpRecordsMapper followUpRecordsMapper;

    /**
     * 查询随访及风险评估
     * 
     * @param followId 随访及风险评估主键
     * @return 随访及风险评估
     */
    @Override
    public FollowUpRecords selectFollowUpRecordsByFollowId(Long followId)
    {
        return followUpRecordsMapper.selectFollowUpRecordsByFollowId(followId);
    }

    /**
     * 查询随访及风险评估列表
     * 
     * @param followUpRecords 随访及风险评估
     * @return 随访及风险评估
     */
    @Override
    public List<FollowUpRecords> selectFollowUpRecordsList(FollowUpRecords followUpRecords)
    {
        return followUpRecordsMapper.selectFollowUpRecordsList(followUpRecords);
    }

    /**
     * 新增随访及风险评估
     * 
     * @param followUpRecords 随访及风险评估
     * @return 结果
     */
    @Override
    public int insertFollowUpRecords(FollowUpRecords followUpRecords)
    {
        return followUpRecordsMapper.insertFollowUpRecords(followUpRecords);
    }

    /**
     * 修改随访及风险评估
     * 
     * @param followUpRecords 随访及风险评估
     * @return 结果
     */
    @Override
    public int updateFollowUpRecords(FollowUpRecords followUpRecords)
    {
        return followUpRecordsMapper.updateFollowUpRecords(followUpRecords);
    }

    /**
     * 批量删除随访及风险评估
     * 
     * @param followIds 需要删除的随访及风险评估主键
     * @return 结果
     */
    @Override
    public int deleteFollowUpRecordsByFollowIds(Long[] followIds)
    {
        return followUpRecordsMapper.deleteFollowUpRecordsByFollowIds(followIds);
    }

    /**
     * 删除随访及风险评估信息
     * 
     * @param followId 随访及风险评估主键
     * @return 结果
     */
    @Override
    public int deleteFollowUpRecordsByFollowId(Long followId)
    {
        return followUpRecordsMapper.deleteFollowUpRecordsByFollowId(followId);
    }
}
