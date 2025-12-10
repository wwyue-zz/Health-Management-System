<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="150px">
      <el-form-item label="Patient ID" prop="patientId">
        <el-input v-model="queryParams.patientId" placeholder="Please enter patient ID" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Follow-up Date" prop="followDate">
        <el-date-picker clearable v-model="queryParams.followDate" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select follow-up date">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="Next Follow-up Date" prop="nextDate">
        <el-date-picker clearable v-model="queryParams.nextDate" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select next follow-up date">
        </el-date-picker>
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
        <el-button type="primary" plain icon="Plus" @click="handleAdd"
          v-hasPermi="['health:records:add']">Add</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['health:records:edit']">Edit</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['health:records:remove']">Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['health:records:export']">Export</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Record ID" align="center" prop="followId" />
      <el-table-column label="Patient ID" align="center" prop="patientId" />
      <el-table-column label="Follow-up Date" align="center" prop="followDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.followDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Next Follow-up Date" align="center" prop="nextDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.nextDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Doctor Assessment" align="center" prop="doctorNotes" />
      <el-table-column label="Risk Assessment" align="center" prop="riskAssessment" />
      <el-table-column label="Referral Suggestion" align="center" prop="referral" />
      <el-table-column label="Patient Name" align="center" prop="name" />
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['health:records:edit']">Edit</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['health:records:remove']">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize"
      @pagination="getList" />

    <!-- Add or Edit Follow-up and Risk Assessment Dialog -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="recordsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Patient ID" prop="patientId">
          <el-input v-model="form.patientId" placeholder="Please enter patient ID" />
        </el-form-item>
        <el-form-item label="Follow-up Date" prop="followDate">
          <el-date-picker clearable v-model="form.followDate" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select follow-up date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Next Follow-up Date" prop="nextDate">
          <el-date-picker clearable v-model="form.nextDate" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select next follow-up date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Doctor Assessment" prop="doctorNotes">
          <el-input v-model="form.doctorNotes" type="textarea" placeholder="Please enter content" />
        </el-form-item>
        <el-form-item label="Referral Suggestion" prop="referral">
          <el-input v-model="form.referral" type="textarea" placeholder="Please enter content" />
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

<script setup name="Records">
import { listRecords, getRecords, delRecords, addRecords, updateRecords } from "@/api/health/records"

const { proxy } = getCurrentInstance()

const recordsList = ref([])
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
    followDate: null,
    nextDate: null,
    doctorNotes: null,
    riskAssessment: null,
    referral: null,
    name: null
  },
  rules: {
    patientId: [
      { required: true, message: "Patient ID cannot be empty", trigger: "blur" }
    ],
    followDate: [
      { required: true, message: "Follow-up Date cannot be empty", trigger: "blur" }
    ],
    name: [
      { required: true, message: "Patient Name cannot be empty", trigger: "blur" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** Query follow-up and risk assessment list */
function getList() {
  loading.value = true
  listRecords(queryParams.value).then(response => {
    recordsList.value = response.rows
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
    followId: null,
    patientId: null,
    followDate: null,
    nextDate: null,
    doctorNotes: null,
    riskAssessment: null,
    referral: null,
    name: null
  }
  proxy.resetForm("recordsRef")
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
  ids.value = selection.map(item => item.followId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** Add button operation */
function handleAdd() {
  reset()
  open.value = true
  title.value = "Add Follow-up and Risk Assessment"
}

/** Edit button operation */
function handleUpdate(row) {
  reset()
  const _followId = row.followId || ids.value
  getRecords(_followId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "Edit Follow-up and Risk Assessment"
  })
}

/** Submit button */
function submitForm() {
  proxy.$refs["recordsRef"].validate(valid => {
    if (valid) {
      if (form.value.followId != null) {
        updateRecords(form.value).then(response => {
          proxy.$modal.msgSuccess("Update successful")
          open.value = false
          getList()
        })
      } else {
        addRecords(form.value).then(response => {
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
  const _followIds = row.followId || ids.value
  proxy.$modal.confirm('Are you sure to delete follow-up and risk assessment record with ID "' + _followIds + '"?').then(function () {
    return delRecords(_followIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("Delete successful")
  }).catch(() => { })
}

/** Export button operation */
function handleExport() {
  proxy.download('health/records/export', {
    ...queryParams.value
  }, `records_${new Date().getTime()}.xlsx`)
}

getList()
</script>
