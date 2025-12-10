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
import com.doctor.health.domain.LifestyleRecords;
import com.doctor.health.service.ILifestyleRecordsService;
import com.doctor.common.utils.poi.ExcelUtil;
import com.doctor.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/health/life")
public class LifestyleRecordsController extends BaseController
{
    @Autowired
    private ILifestyleRecordsService lifestyleRecordsService;

    /**
     * 查询生活习惯干预跟踪列表
     */
    @PreAuthorize("@ss.hasPermi('health:life:list')")
    @GetMapping("/list")
    public TableDataInfo list(LifestyleRecords lifestyleRecords)
    {
        startPage();
        List<LifestyleRecords> list = lifestyleRecordsService.selectLifestyleRecordsList(lifestyleRecords);
        return getDataTable(list);
    }

    /**
     * 导出生活习惯干预跟踪列表
     */
    @PreAuthorize("@ss.hasPermi('health:life:export')")
    @Log(title = "生活习惯干预跟踪", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LifestyleRecords lifestyleRecords)
    {
        List<LifestyleRecords> list = lifestyleRecordsService.selectLifestyleRecordsList(lifestyleRecords);
        ExcelUtil<LifestyleRecords> util = new ExcelUtil<LifestyleRecords>(LifestyleRecords.class);
        util.exportExcel(response, list, "生活习惯干预跟踪数据");
    }

    /**
     * 获取生活习惯干预跟踪详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:life:query')")
    @GetMapping(value = "/{lifestyleId}")
    public AjaxResult getInfo(@PathVariable("lifestyleId") Long lifestyleId)
    {
        return success(lifestyleRecordsService.selectLifestyleRecordsByLifestyleId(lifestyleId));
    }

    /**
     * 新增生活习惯干预跟踪
     */
    @PreAuthorize("@ss.hasPermi('health:life:add')")
    @Log(title = "生活习惯干预跟踪", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LifestyleRecords lifestyleRecords)
    {
        return toAjax(lifestyleRecordsService.insertLifestyleRecords(lifestyleRecords));
    }

    /**
     * 修改生活习惯干预跟踪
     */
    @PreAuthorize("@ss.hasPermi('health:life:edit')")
    @Log(title = "生活习惯干预跟踪", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LifestyleRecords lifestyleRecords)
    {
        return toAjax(lifestyleRecordsService.updateLifestyleRecords(lifestyleRecords));
    }

    /**
     * 删除生活习惯干预跟踪
     */
    @PreAuthorize("@ss.hasPermi('health:life:remove')")
    @Log(title = "生活习惯干预跟踪", businessType = BusinessType.DELETE)
	@DeleteMapping("/{lifestyleIds}")
    public AjaxResult remove(@PathVariable Long[] lifestyleIds)
    {
        return toAjax(lifestyleRecordsService.deleteLifestyleRecordsByLifestyleIds(lifestyleIds));
    }
}
