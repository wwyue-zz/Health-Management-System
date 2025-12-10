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
import com.doctor.health.domain.Health;
import com.doctor.health.service.IHealthService;
import com.doctor.common.utils.poi.ExcelUtil;
import com.doctor.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/health/health")
public class HealthController extends BaseController
{
    @Autowired
    private IHealthService healthService;

    /**
     * 查询用户健康情况列表
     */
    @PreAuthorize("@ss.hasPermi('health:health:list')")
    @GetMapping("/list")
    public TableDataInfo list(Health health)
    {
        startPage();
        List<Health> list = healthService.selectHealthList(health);
        return getDataTable(list);
    }

    /**
     * 导出用户健康情况列表
     */
    @PreAuthorize("@ss.hasPermi('health:health:export')")
    @Log(title = "用户健康情况", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Health health)
    {
        List<Health> list = healthService.selectHealthList(health);
        ExcelUtil<Health> util = new ExcelUtil<Health>(Health.class);
        util.exportExcel(response, list, "用户健康情况数据");
    }

    /**
     * 获取用户健康情况详细信息
     */
    @PreAuthorize("@ss.hasPermi('health:health:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(healthService.selectHealthById(id));
    }

    /**
     * 新增用户健康情况
     */
    @PreAuthorize("@ss.hasPermi('health:health:add')")
    @Log(title = "用户健康情况", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Health health)
    {
        return toAjax(healthService.insertHealth(health));
    }

    /**
     * 修改用户健康情况
     */
    @PreAuthorize("@ss.hasPermi('health:health:edit')")
    @Log(title = "用户健康情况", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Health health)
    {
        return toAjax(healthService.updateHealth(health));
    }

    /**
     * 删除用户健康情况
     */
    @PreAuthorize("@ss.hasPermi('health:health:remove')")
    @Log(title = "用户健康情况", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(healthService.deleteHealthByIds(ids));
    }
}
