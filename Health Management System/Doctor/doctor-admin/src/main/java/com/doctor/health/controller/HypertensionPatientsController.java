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
import com.doctor.health.domain.HypertensionPatients;
import com.doctor.health.service.IHypertensionPatientsService;
import com.doctor.common.utils.poi.ExcelUtil;
import com.doctor.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/health/patients")
public class HypertensionPatientsController extends BaseController
{
    @Autowired
    private IHypertensionPatientsService hypertensionPatientsService;

    /**
     * 查询患者基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('health:patients:list')")
    @GetMapping("/list")
    public TableDataInfo list(HypertensionPatients hypertensionPatients)
    {
        startPage();
        List<HypertensionPatients> list = hypertensionPatientsService.selectHypertensionPatientsList(hypertensionPatients);
        return getDataTable(list);
    }

    /**
     * 导出患者基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('health:patients:export')")
    @Log(title = "患者基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HypertensionPatients hypertensionPatients)
    {
        List<HypertensionPatients> list = hypertensionPatientsService.selectHypertensionPatientsList(hypertensionPatients);
        ExcelUtil<HypertensionPatients> util = new ExcelUtil<HypertensionPatients>(HypertensionPatients.class);
        util.exportExcel(response, list, "患者基本信息数据");
    }

    /**
     * 获取患者基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:patients:query')")
    @GetMapping(value = "/{patientId}")
    public AjaxResult getInfo(@PathVariable("patientId") Long patientId)
    {
        return success(hypertensionPatientsService.selectHypertensionPatientsByPatientId(patientId));
    }

    /**
     * 新增患者基本信息
     */
    @PreAuthorize("@ss.hasPermi('health:patients:add')")
    @Log(title = "患者基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HypertensionPatients hypertensionPatients)
    {
        return toAjax(hypertensionPatientsService.insertHypertensionPatients(hypertensionPatients));
    }

    /**
     * 修改患者基本信息
     */
    @PreAuthorize("@ss.hasPermi('health:patients:edit')")
    @Log(title = "患者基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HypertensionPatients hypertensionPatients)
    {
        return toAjax(hypertensionPatientsService.updateHypertensionPatients(hypertensionPatients));
    }

    /**
     * 删除患者基本信息
     */
    @PreAuthorize("@ss.hasPermi('health:patients:remove')")
    @Log(title = "患者基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{patientIds}")
    public AjaxResult remove(@PathVariable Long[] patientIds)
    {
        return toAjax(hypertensionPatientsService.deleteHypertensionPatientsByPatientIds(patientIds));
    }
}
