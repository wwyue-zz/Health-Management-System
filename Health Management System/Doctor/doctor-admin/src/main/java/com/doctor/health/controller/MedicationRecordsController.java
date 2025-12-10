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
import com.doctor.health.domain.MedicationRecords;
import com.doctor.health.service.IMedicationRecordsService;
import com.doctor.common.utils.poi.ExcelUtil;
import com.doctor.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/health/medication")
public class MedicationRecordsController extends BaseController
{
    @Autowired
    private IMedicationRecordsService medicationRecordsService;

    /**
     * 查询降压药物使用及效果记录列表
     */
    @PreAuthorize("@ss.hasPermi('health:medication:list')")
    @GetMapping("/list")
    public TableDataInfo list(MedicationRecords medicationRecords)
    {
        startPage();
        List<MedicationRecords> list = medicationRecordsService.selectMedicationRecordsList(medicationRecords);
        return getDataTable(list);
    }

    /**
     * 导出降压药物使用及效果记录列表
     */
    @PreAuthorize("@ss.hasPermi('health:medication:export')")
    @Log(title = "降压药物使用及效果记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MedicationRecords medicationRecords)
    {
        List<MedicationRecords> list = medicationRecordsService.selectMedicationRecordsList(medicationRecords);
        ExcelUtil<MedicationRecords> util = new ExcelUtil<MedicationRecords>(MedicationRecords.class);
        util.exportExcel(response, list, "降压药物使用及效果记录数据");
    }

    /**
     * 获取降压药物使用及效果记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:medication:query')")
    @GetMapping(value = "/{medId}")
    public AjaxResult getInfo(@PathVariable("medId") Long medId)
    {
        return success(medicationRecordsService.selectMedicationRecordsByMedId(medId));
    }

    /**
     * 新增降压药物使用及效果记录
     */
    @PreAuthorize("@ss.hasPermi('health:medication:add')")
    @Log(title = "降压药物使用及效果记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MedicationRecords medicationRecords)
    {
        return toAjax(medicationRecordsService.insertMedicationRecords(medicationRecords));
    }

    /**
     * 修改降压药物使用及效果记录
     */
    @PreAuthorize("@ss.hasPermi('health:medication:edit')")
    @Log(title = "降压药物使用及效果记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MedicationRecords medicationRecords)
    {
        return toAjax(medicationRecordsService.updateMedicationRecords(medicationRecords));
    }

    /**
     * 删除降压药物使用及效果记录
     */
    @PreAuthorize("@ss.hasPermi('health:medication:remove')")
    @Log(title = "降压药物使用及效果记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{medIds}")
    public AjaxResult remove(@PathVariable Long[] medIds)
    {
        return toAjax(medicationRecordsService.deleteMedicationRecordsByMedIds(medIds));
    }
}
