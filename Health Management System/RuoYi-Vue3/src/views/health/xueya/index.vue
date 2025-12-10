<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="150px">
      <el-form-item label="Patient ID" prop="patientId">
        <el-input v-model="queryParams.patientId" placeholder="Please enter associated patient ID" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Record Date" prop="recordDate">
        <el-date-picker clearable v-model="queryParams.recordDate" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select record date and time">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="Systolic BP" prop="systolicBp">
        <el-input v-model="queryParams.systolicBp" placeholder="Please enter systolic blood pressure" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Diastolic BP" prop="diastolicBp">
        <el-input v-model="queryParams.diastolicBp" placeholder="Please enter diastolic blood pressure" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Heart Rate" prop="heartRate">
        <el-input v-model="queryParams.heartRate" placeholder="Please enter heart rate" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Patient Name" prop="name">
        <el-input v-model="queryParams.name" placeholder="Please enter patient name" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">Search</el-button>
        <el-button icon="Refresh" @click="resetQuery">Reset</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd" v-hasPermi="['health:xueya:add']">Add</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['health:xueya:edit']">Edit</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['health:xueya:remove']">Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['health:xueya:export']">Export</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="xueyaList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Record ID" align="center" prop="recordId" />
      <el-table-column label="Patient ID" align="center" prop="patientId" />
      <el-table-column label="Record Date" align="center" prop="recordDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.recordDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Systolic BP" align="center" prop="systolicBp" />
      <el-table-column label="Diastolic BP" align="center" prop="diastolicBp" />
      <el-table-column label="BP Level" align="center" prop="bpLevel" />
      <el-table-column label="Heart Rate" align="center" prop="heartRate" />
      <el-table-column label="Abnormal Symptoms" align="center" prop="notes" />
      <el-table-column label="Patient Name" align="center" prop="name" />
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['health:xueya:edit']">Edit</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['health:xueya:remove']">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- Add or Edit Blood Pressure and Vital Signs Record Dialog -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="xueyaRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Patient ID" prop="patientId">
          <el-input v-model="form.patientId" placeholder="Please enter associated patient ID" />
        </el-form-item>
        <el-form-item label="Record Date & Time" prop="recordDate">
          <el-date-picker clearable v-model="form.recordDate" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select record date and time">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Systolic BP" prop="systolicBp">
          <el-input v-model="form.systolicBp" placeholder="Please enter systolic blood pressure" />
        </el-form-item>
        <el-form-item label="Diastolic BP" prop="diastolicBp">
          <el-input v-model="form.diastolicBp" placeholder="Please enter diastolic blood pressure" />
        </el-form-item>
        <el-form-item label="Heart Rate" prop="heartRate">
          <el-input v-model="form.heartRate" placeholder="Please enter heart rate" />
        </el-form-item>
        <el-form-item label="Abnormal Symptoms" prop="notes">
          <el-input v-model="form.notes" type="textarea" placeholder="Please enter content" />
        </el-form-item>
        <el-form-item label="Patient Name" prop="name">
          <el-input v-model="form.name" placeholder="Please enter patient name" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button type="primary" @click="submitForm">Confirm</el-button>
          <el-button @click="cancel">Cancel</el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup name="Xueya">
import { listXueya, getXueya, delXueya, addXueya, updateXueya } from "@/api/health/xueya"

const { proxy } = getCurrentInstance()

const xueyaList = ref([])
const open = ref(false)
const loading = ref(true)
const showSearch = ref(true)
const ids = ref([])
const single = ref(true)
const multiple = ref(true)
const total = ref(0)
const title = ref("")

const data = reactive({
  form: {},
  queryParams: {
    pageNum: 1,
    pageSize: 10,
    patientId: null,
    recordDate: null,
    systolicBp: null,
    diastolicBp: null,
    bpLevel: null,
    heartRate: null,
    notes: null,
    name: null
  },
  rules: {
    patientId: [
      { required: true, message: "Patient ID cannot be empty", trigger: "blur" }
    ],
    recordDate: [
      { required: true, message: "Record Date and Time cannot be empty", trigger: "blur" }
    ],
    systolicBp: [
      { required: true, message: "Systolic BP cannot be empty", trigger: "blur" }
    ],
    diastolicBp: [
      { required: true, message: "Diastolic BP cannot be empty", trigger: "blur" }
    ],
    name: [
      { required: true, message: "Patient Name cannot be empty", trigger: "blur" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** Query blood pressure and vital signs record list */
function getList() {
  loading.value = true
  listXueya(queryParams.value).then(response => {
    xueyaList.value = response.rows
    total.value = response.total
    loading.value = false
  })
}

// Cancel button
function cancel() {
  open.value = false
  reset()
}

// Form reset
function reset() {
  form.value = {
    recordId: null,
    patientId: null,
    recordDate: null,
    systolicBp: null,
    diastolicBp: null,
    bpLevel: null,
    heartRate: null,
    notes: null,
    name: null
  }
  proxy.resetForm("xueyaRef")
}

/** Search button operation */
function handleQuery() {
  queryParams.value.pageNum = 1
  getList()
}

/** Reset button operation */
function resetQuery() {
  proxy.resetForm("queryRef")
  handleQuery()
}

// Multi-select checkbox selection data
function handleSelectionChange(selection) {
  ids.value = selection.map(item => item.recordId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** Add button operation */
function handleAdd() {
  reset()
  open.value = true
  title.value = "Add Blood Pressure and Vital Signs Record"
}

/** Edit button operation */
function handleUpdate(row) {
  reset()
  const _recordId = row.recordId || ids.value
  getXueya(_recordId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "Edit Blood Pressure and Vital Signs Record"
  })
}

/** Submit button */
function submitForm() {
  proxy.$refs["xueyaRef"].validate(valid => {
    if (valid) {
      if (form.value.recordId != null) {
        updateXueya(form.value).then(response => {
          proxy.$modal.msgSuccess("Update successful")
          open.value = false
          getList()
        })
      } else {
        addXueya(form.value).then(response => {
          proxy.$modal.msgSuccess("Add successful")
          open.value = false
          getList()
        })
      }
    }
  })
}

/** Delete button operation */
function handleDelete(row) {
  const _recordIds = row.recordId || ids.value
  proxy.$modal.confirm('Are you sure to delete blood pressure and vital signs record with ID "' + _recordIds + '"?').then(function () {
    return delXueya(_recordIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("Delete successful")
  }).catch(() => { })
}

/** Export button operation */
function handleExport() {
  proxy.download('health/xueya/export', {
    ...queryParams.value
  }, `xueya_${new Date().getTime()}.xlsx`)
}

getList()
</script>
