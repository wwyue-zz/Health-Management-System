<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="100px">
      <el-form-item label="ID" prop="patientId">
        <el-input v-model="queryParams.patientId" placeholder="Please enter patient ID" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Drug Name" prop="drugName">
        <el-input v-model="queryParams.drugName" placeholder="Please enter drug name" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Dosage" prop="dosage">
        <el-input v-model="queryParams.dosage" placeholder="Please enter dosage" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Start Date" prop="startDate">
        <el-date-picker clearable v-model="queryParams.startDate" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select start date">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="End Date" prop="endDate">
        <el-date-picker clearable v-model="queryParams.endDate" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select end date">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="Name" prop="name">
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
          v-hasPermi="['health:medication:add']">Add</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['health:medication:edit']">Edit</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['health:medication:remove']">Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['health:medication:export']">Export</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="medicationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Medication ID" align="center" prop="medId" />
      <el-table-column label="Patient ID" align="center" prop="patientId" />
      <el-table-column label="Drug Name" align="center" prop="drugName" />
      <el-table-column label="Dosage" align="center" prop="dosage" />
      <el-table-column label="Frequency" align="center" prop="frequency" />
      <el-table-column label="Start Date" align="center" prop="startDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.startDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="End Date" align="center" prop="endDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.endDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Effectiveness" align="center" prop="effect" />
      <el-table-column label="Side Effects" align="center" prop="sideEffects" />
      <el-table-column label="Patient Name" align="center" prop="name" />
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['health:medication:edit']">Edit</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['health:medication:remove']">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum" v-model:limit="queryParams.pageSize"
      @pagination="getList" />

    <!-- Add or Edit Antihypertensive Medication Usage and Effect Record Dialog -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="medicationRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Patient ID" prop="patientId">
          <el-input v-model="form.patientId" placeholder="Please enter patient ID" />
        </el-form-item>
        <el-form-item label="Drug Name" prop="drugName">
          <el-input v-model="form.drugName" placeholder="Please enter drug name" />
        </el-form-item>
        <el-form-item label="Dosage" prop="dosage">
          <el-input v-model="form.dosage" placeholder="Please enter dosage" />
        </el-form-item>
        <el-form-item label="Start Date" prop="startDate">
          <el-date-picker clearable v-model="form.startDate" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select start date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="End Date" prop="endDate">
          <el-date-picker clearable v-model="form.endDate" type="date" value-format="YYYY-MM-DD" placeholder="Please select end date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Side Effects" prop="sideEffects">
          <el-input v-model="form.sideEffects" type="textarea" placeholder="Please enter content" />
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

<script setup name="Medication">
import { listMedication, getMedication, delMedication, addMedication, updateMedication } from "@/api/health/medication"

const { proxy } = getCurrentInstance()

const medicationList = ref([])
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
    drugName: null,
    dosage: null,
    frequency: null,
    startDate: null,
    endDate: null,
    effect: null,
    sideEffects: null,
    name: null
  },
  rules: {
    patientId: [
      { required: true, message: "Patient ID cannot be empty", trigger: "blur" }
    ],
    drugName: [
      { required: true, message: "Drug Name cannot be empty", trigger: "blur" }
    ],
    dosage: [
      { required: true, message: "Dosage cannot be empty", trigger: "blur" }
    ],
    startDate: [
      { required: true, message: "Start Date cannot be empty", trigger: "blur" }
    ],
    name: [
      { required: true, message: "Patient Name cannot be empty", trigger: "blur" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** Query antihypertensive medication usage and effect record list */
function getList() {
  loading.value = true
  listMedication(queryParams.value).then(response => {
    medicationList.value = response.rows
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
    medId: null,
    patientId: null,
    drugName: null,
    dosage: null,
    frequency: null,
    startDate: null,
    endDate: null,
    effect: null,
    sideEffects: null,
    name: null
  }
  proxy.resetForm("medicationRef")
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
  ids.value = selection.map(item => item.medId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** Add button operation */
function handleAdd() {
  reset()
  open.value = true
  title.value = "Add Antihypertensive Medication Usage and Effect Record"
}

/** Edit button operation */
function handleUpdate(row) {
  reset()
  const _medId = row.medId || ids.value
  getMedication(_medId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "Edit Antihypertensive Medication Usage and Effect Record"
  })
}

/** Submit button */
function submitForm() {
  proxy.$refs["medicationRef"].validate(valid => {
    if (valid) {
      if (form.value.medId != null) {
        updateMedication(form.value).then(response => {
          proxy.$modal.msgSuccess("Update successful")
          open.value = false
          getList()
        })
      } else {
        addMedication(form.value).then(response => {
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
  const _medIds = row.medId || ids.value
  proxy.$modal.confirm('Are you sure to delete antihypertensive medication usage and effect record with ID "' + _medIds + '"?').then(function () {
    return delMedication(_medIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("Delete successful")
  }).catch(() => { })
}

/** Export button operation */
function handleExport() {
  proxy.download('health/medication/export', {
    ...queryParams.value
  }, `medication_${new Date().getTime()}.xlsx`)
}

getList()
</script>
