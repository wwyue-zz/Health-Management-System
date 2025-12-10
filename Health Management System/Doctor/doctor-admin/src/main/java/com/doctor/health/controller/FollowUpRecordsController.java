package com.doctor.health.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.doctor.common.annotation.Log;
import com.doctor.common.core.controller.BaseController;
import com.doctor.common.core.domain.AjaxResult;
import com.doctor.common.enums.BusinessType;
import com.doctor.health.domain.FollowUpRecords;
import com.doctor.health.service.IFollowUpRecordsService;
import com.doctor.common.utils.poi.ExcelUtil;
import com.doctor.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/health/records")
public class FollowUpRecordsController extends BaseController
{
    @Autowired
    private IFollowUpRecordsService followUpRecordsService;

    /**
     * 查询随访及风险评估列表
     */
    @PreAuthorize("@ss.hasPermi('health:records:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowUpRecords followUpRecords)
    {
        startPage();
        List<FollowUpRecords> list = followUpRecordsService.selectFollowUpRecordsList(followUpRecords);
        return getDataTable(list);
    }

    /**
     * 导出随访及风险评估列表
     */
    @PreAuthorize("@ss.hasPermi('health:records:export')")
    @Log(title = "随访及风险评估", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowUpRecords followUpRecords)
    {
        List<FollowUpRecords> list = followUpRecordsService.selectFollowUpRecordsList(followUpRecords);
        ExcelUtil<FollowUpRecords> util = new ExcelUtil<FollowUpRecords>(FollowUpRecords.class);
        util.exportExcel(response, list, "随访及风险评估数据");
    }

    /**
     * 获取随访及风险评估详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:records:query')")
    @GetMapping(value = "/{followId}")
    public AjaxResult getInfo(@PathVariable("followId") Long followId)
    {
        return success(followUpRecordsService.selectFollowUpRecordsByFollowId(followId));
    }

    /**
     * 新增随访及风险评估
     */
    @PreAuthorize("@ss.hasPermi('health:records:add')")
    @Log(title = "随访及风险评估", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowUpRecords followUpRecords)
    {
        return toAjax(followUpRecordsService.insertFollowUpRecords(followUpRecords));
    }

    /**
     * 修改随访及风险评估
     */
    @PreAuthorize("@ss.hasPermi('health:records:edit')")
    @Log(title = "随访及风险评估", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowUpRecords followUpRecords)
    {
        return toAjax(followUpRecordsService.updateFollowUpRecords(followUpRecords));
    }

    /**
     * 删除随访及风险评估
     */
    @PreAuthorize("@ss.hasPermi('health:records:remove')")
    @Log(title = "随访及风险评估", businessType = BusinessType.DELETE)
	@DeleteMapping("/{followIds}")
    public AjaxResult remove(@PathVariable Long[] followIds)
    {
        return toAjax(followUpRecordsService.deleteFollowUpRecordsByFollowIds(followIds));
    }
}
