<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="150px">
      <el-form-item label="Patient ID" prop="patientId">
        <el-input
          v-model="queryParams.patientId"
          placeholder="Please enter patient ID"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item label="Record Date" prop="recordDate">
        <el-date-picker clearable
          v-model="queryParams.recordDate"
          type="date"
          value-format="YYYY-MM-DD"
          placeholder="Please select record date">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="Patient Name" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="Please enter patient name"
          clearable
          @keyup.enter="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">Search</el-button>
        <el-button icon="Refresh" @click="resetQuery">Reset</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="Plus"
          @click="handleAdd"
          v-hasPermi="['health:life:add']"
        >Add</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="Edit"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['health:life:edit']"
        >Edit</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="Delete"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['health:life:remove']"
        >Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="Download"
          @click="handleExport"
          v-hasPermi="['health:life:export']"
        >Export</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="lifeList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Record ID" align="center" prop="lifestyleId" />
      <el-table-column label="Patient ID" align="center" prop="patientId" />
      <el-table-column label="Record Date" align="center" prop="recordDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.recordDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Diet Plan" align="center" prop="dietPlan" />
      <el-table-column label="Salt Intake" align="center" prop="saltIntake" />
      <el-table-column label="Exercise Frequency" align="center" prop="exerciseFrequency" />
      <el-table-column label="Smoking Status" align="center" prop="smokingStatus" />
      <el-table-column label="Alcohol Intake" align="center" prop="alcoholIntake" />
      <el-table-column label="Sleep Quality" align="center" prop="sleepQuality" />
      <el-table-column label="Patient Name" align="center" prop="name" />
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)" v-hasPermi="['health:life:edit']">Edit</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)" v-hasPermi="['health:life:remove']">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- Add or Edit Lifestyle Intervention Tracking Dialog -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="lifeRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Patient ID" prop="patientId">
          <el-input v-model="form.patientId" placeholder="Please enter patient ID" />
        </el-form-item>
        <el-form-item label="Record Date" prop="recordDate">
          <el-date-picker clearable
            v-model="form.recordDate"
            type="date"
            value-format="YYYY-MM-DD"
            placeholder="Please select record date">
          </el-date-picker>
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

<script setup name="Life">
import { listLife, getLife, delLife, addLife, updateLife } from "@/api/health/life"

const { proxy } = getCurrentInstance()

const lifeList = ref([])
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
    dietPlan: null,
    saltIntake: null,
    exerciseFrequency: null,
    smokingStatus: null,
    alcoholIntake: null,
    sleepQuality: null,
    name: null
  },
  rules: {
    patientId: [
      { required: true, message: "Patient ID cannot be empty", trigger: "blur" }
    ],
    recordDate: [
      { required: true, message: "Record Date cannot be empty", trigger: "blur" }
    ],
    name: [
      { required: true, message: "Patient Name cannot be empty", trigger: "blur" }
    ]
  }
})

const { queryParams, form, rules } = toRefs(data)

/** Query lifestyle intervention tracking list */
function getList() {
  loading.value = true
  listLife(queryParams.value).then(response => {
    lifeList.value = response.rows
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
    lifestyleId: null,
    patientId: null,
    recordDate: null,
    dietPlan: null,
    saltIntake: null,
    exerciseFrequency: null,
    smokingStatus: null,
    alcoholIntake: null,
    sleepQuality: null,
    name: null
  }
  proxy.resetForm("lifeRef")
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
  ids.value = selection.map(item => item.lifestyleId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** Add button operation */
function handleAdd() {
  reset()
  open.value = true
  title.value = "Add Lifestyle Intervention Tracking"
}

/** Edit button operation */
function handleUpdate(row) {
  reset()
  const _lifestyleId = row.lifestyleId || ids.value
  getLife(_lifestyleId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "Edit Lifestyle Intervention Tracking"
  })
}

/** Submit button */
function submitForm() {
  proxy.$refs["lifeRef"].validate(valid => {
    if (valid) {
      if (form.value.lifestyleId != null) {
        updateLife(form.value).then(response => {
          proxy.$modal.msgSuccess("Update successful")
          open.value = false
          getList()
        })
      } else {
        addLife(form.value).then(response => {
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
  const _lifestyleIds = row.lifestyleId || ids.value
  proxy.$modal.confirm('Are you sure to delete lifestyle intervention tracking with ID "' + _lifestyleIds + '"?').then(function() {
    return delLife(_lifestyleIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("Delete successful")
  }).catch(() => {})
}

/** Export button operation */
function handleExport() {
  proxy.download('health/life/export', {
    ...queryParams.value
  }, `life_${new Date().getTime()}.xlsx`)
}

getList()
</script>
