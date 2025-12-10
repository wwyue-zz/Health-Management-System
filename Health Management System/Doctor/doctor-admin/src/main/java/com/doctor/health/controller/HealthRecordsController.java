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
import com.doctor.health.domain.HealthRecords;
import com.doctor.health.service.IHealthRecordsService;
import com.doctor.common.utils.poi.ExcelUtil;
import com.doctor.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/health/xueya")
public class HealthRecordsController extends BaseController
{
    @Autowired
    private IHealthRecordsService healthRecordsService;

    /**
     * 查询血压及生命体征记录列表
     */
    @PreAuthorize("@ss.hasPermi('health:xueya:list')")
    @GetMapping("/list")
    public TableDataInfo list(HealthRecords healthRecords)
    {
        startPage();
        List<HealthRecords> list = healthRecordsService.selectHealthRecordsList(healthRecords);
        return getDataTable(list);
    }

    /**
     * 导出血压及生命体征记录列表
     */
    @PreAuthorize("@ss.hasPermi('health:xueya:export')")
    @Log(title = "血压及生命体征记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HealthRecords healthRecords)
    {
        List<HealthRecords> list = healthRecordsService.selectHealthRecordsList(healthRecords);
        ExcelUtil<HealthRecords> util = new ExcelUtil<HealthRecords>(HealthRecords.class);
        util.exportExcel(response, list, "血压及生命体征记录数据");
    }

    /**
     * 获取血压及生命体征记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:xueya:query')")
    @GetMapping(value = "/{recordId}")
    public AjaxResult getInfo(@PathVariable("recordId") Long recordId)
    {
        return success(healthRecordsService.selectHealthRecordsByRecordId(recordId));
    }

    /**
     * 新增血压及生命体征记录
     */
    @PreAuthorize("@ss.hasPermi('health:xueya:add')")
    @Log(title = "血压及生命体征记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HealthRecords healthRecords)
    {
        return toAjax(healthRecordsService.insertHealthRecords(healthRecords));
    }

    /**
     * 修改血压及生命体征记录
     */
    @PreAuthorize("@ss.hasPermi('health:xueya:edit')")
    @Log(title = "血压及生命体征记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HealthRecords healthRecords)
    {
        return toAjax(healthRecordsService.updateHealthRecords(healthRecords));
    }

    /**
     * 删除血压及生命体征记录
     */
    @PreAuthorize("@ss.hasPermi('health:xueya:remove')")
    @Log(title = "血压及生命体征记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recordIds}")
    public AjaxResult remove(@PathVariable Long[] recordIds)
    {
        return toAjax(healthRecordsService.deleteHealthRecordsByRecordIds(recordIds));
    }
}
