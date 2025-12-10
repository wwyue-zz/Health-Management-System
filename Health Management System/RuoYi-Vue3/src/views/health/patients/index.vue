<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryRef" :inline="true" v-show="showSearch" label-width="150px">
      <el-form-item label="Name" prop="name">
        <el-input v-model="queryParams.name" placeholder="Please enter patient name" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="ID Card" prop="idCard">
        <el-input v-model="queryParams.idCard" placeholder="Please enter ID card number" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Birth Date" prop="birthday">
        <el-date-picker clearable v-model="queryParams.birthday" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select birth date">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="Contact Phone" prop="contactPhone">
        <el-input v-model="queryParams.contactPhone" placeholder="Please enter contact phone" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Address" prop="address">
        <el-input v-model="queryParams.address" placeholder="Please enter address" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Height" prop="height">
        <el-input v-model="queryParams.height" placeholder="Please enter height" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="Weight" prop="weight">
        <el-input v-model="queryParams.weight" placeholder="Please enter weight" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <el-form-item label="BMI" prop="bmi">
        <el-input v-model="queryParams.bmi" placeholder="Please enter BMI" clearable @keyup.enter="handleQuery" />
      </el-form-item>
      <!-- <el-form-item label="Admission Date" prop="admissionDate">
        <el-date-picker clearable v-model="queryParams.admissionDate" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select admission date">
        </el-date-picker>
      </el-form-item> -->
      <el-form-item label="Created At" prop="createdAt">
        <el-date-picker clearable v-model="queryParams.createdAt" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select creation time">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="Updated At" prop="updatedAt">
        <el-date-picker clearable v-model="queryParams.updatedAt" type="date" value-format="YYYY-MM-DD"
          placeholder="Please select update time">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="Search" @click="handleQuery">Search</el-button>
        <el-button icon="Refresh" @click="resetQuery">Reset</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="Plus" @click="handleAdd"
          v-hasPermi="['health:patients:add']">Add</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="Edit" :disabled="single" @click="handleUpdate"
          v-hasPermi="['health:patients:edit']">Edit</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="Delete" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['health:patients:remove']">Delete</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="Download" @click="handleExport"
          v-hasPermi="['health:patients:export']">Export</el-button>
      </el-col>
      <right-toolbar v-model:showSearch="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="patientsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="Patient ID" align="center" prop="patientId" />
      <el-table-column label="Patient Name" align="center" prop="name" />
      <el-table-column label="Gender" align="center" prop="gender" />
      <el-table-column label="ID Card" align="center" prop="idCard" />
      <el-table-column label="Birth Date" align="center" prop="birthday" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.birthday, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Contact Phone" align="center" prop="contactPhone" />
      <el-table-column label="Address" align="center" prop="address" />
      <el-table-column label="Height" align="center" prop="height" />
      <el-table-column label="Weight" align="center" prop="weight" />
      <el-table-column label="BMI" align="center" prop="bmi" />
      <el-table-column label="Family History" align="center" prop="familyHistory" />
      <el-table-column label="Complications" align="center" prop="complication" />
      <el-table-column label="Admission Date" align="center" prop="admissionDate" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.admissionDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Created At" align="center" prop="createdAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Updated At" align="center" prop="updatedAt" width="180">
        <template #default="scope">
          <span>{{ parseTime(scope.row.updatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Actions" align="center" class-name="small-padding fixed-width">
        <template #default="scope">
          <el-button link type="primary" icon="Edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['health:patients:edit']">Edit</el-button>
          <el-button link type="primary" icon="Delete" @click="handleDelete(scope.row)"
            v-hasPermi="['health:patients:remove']">Delete</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :total="total" v-model:page="queryParams.pageNum"
      v-model:limit="queryParams.pageSize" @pagination="getList" />

    <!-- Add or Edit Patient Basic Information Dialog -->
    <el-dialog :title="title" v-model="open" width="500px" append-to-body>
      <el-form ref="patientsRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="Patient Name" prop="name">
          <el-input v-model="form.name" placeholder="Please enter patient name" />
        </el-form-item>
        <el-form-item label="ID Card" prop="idCard">
          <el-input v-model="form.idCard" placeholder="Please enter ID card number" />
        </el-form-item>
        <el-form-item label="Birth Date" prop="birthday">
          <el-date-picker clearable v-model="form.birthday" type="date" value-format="YYYY-MM-DD" placeholder="Please select birth date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Contact Phone" prop="contactPhone">
          <el-input v-model="form.contactPhone" placeholder="Please enter contact phone" />
        </el-form-item>
        <el-form-item label="Address" prop="address">
          <el-input v-model="form.address" placeholder="Please enter address" />
        </el-form-item>
        <el-form-item label="Height" prop="height">
          <el-input v-model="form.height" placeholder="Please enter height" />
        </el-form-item>
        <el-form-item label="Weight" prop="weight">
          <el-input v-model="form.weight" placeholder="Please enter weight" />
        </el-form-item>
        <el-form-item label="BMI" prop="bmi">
          <el-input v-model="form.bmi" placeholder="Please enter BMI" />
        </el-form-item>
        <el-form-item label="Family History" prop="familyHistory">
          <el-input v-model="form.familyHistory" type="textarea" placeholder="Please enter content" />
        </el-form-item>
        <el-form-item label="Complications" prop="complication">
          <el-input v-model="form.complication" type="textarea" placeholder="Please enter content" />
        </el-form-item>
        <el-form-item label="Admission Date" prop="admissionDate">
          <el-date-picker clearable v-model="form.admissionDate" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select admission date">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Created At" prop="createdAt">
          <el-date-picker clearable v-model="form.createdAt" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select record creation time">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="Updated At" prop="updatedAt">
          <el-date-picker clearable v-model="form.updatedAt" type="date" value-format="YYYY-MM-DD"
            placeholder="Please select record update time">
          </el-date-picker>
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

<script setup name="Patients">
import { listPatients, getPatients, delPatients, addPatients, updatePatients } from "@/api/health/patients"

const { proxy } = getCurrentInstance()

const patientsList = ref([])
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
    name: null,
    gender: null,
    idCard: null,
    birthday: null,
    contactPhone: null,
    address: null,
    height: null,
    weight: null,
    bmi: null,
    familyHistory: null,
    complication: null,
    admissionDate: null,
    createdAt: null,
    updatedAt: null
  },
  rules: {
    name: [
      { required: true, message: "Patient Name cannot be empty", trigger: "blur" }
    ],
    gender: [
      { required: true, message: "Gender cannot be empty", trigger: "blur" }
    ],
    idCard: [
      { required: true, message: "ID Card cannot be empty", trigger: "blur" }
    ],
    birthday: [
      { required: true, message: "Birth Date cannot be empty", trigger: "blur" }
    ],
    contactPhone: [
      { required: true, message: "Contact Phone cannot be empty", trigger: "blur" }
    ],
  }
})

const { queryParams, form, rules } = toRefs(data)

/** Query patient basic information list */
function getList() {
  loading.value = true
  listPatients(queryParams.value).then(response => {
    patientsList.value = response.rows
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
    patientId: null,
    name: null,
    gender: null,
    idCard: null,
    birthday: null,
    contactPhone: null,
    address: null,
    height: null,
    weight: null,
    bmi: null,
    familyHistory: null,
    complication: null,
    admissionDate: null,
    createdAt: null,
    updatedAt: null
  }
  proxy.resetForm("patientsRef")
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
  ids.value = selection.map(item => item.patientId)
  single.value = selection.length != 1
  multiple.value = !selection.length
}

/** Add button operation */
function handleAdd() {
  reset()
  open.value = true
  title.value = "Add Patient Basic Information"
}

/** Edit button operation */
function handleUpdate(row) {
  reset()
  const _patientId = row.patientId || ids.value
  getPatients(_patientId).then(response => {
    form.value = response.data
    open.value = true
    title.value = "Edit Patient Basic Information"
  })
}

/** Submit button */
function submitForm() {
  proxy.$refs["patientsRef"].validate(valid => {
    if (valid) {
      if (form.value.patientId != null) {
        updatePatients(form.value).then(response => {
          proxy.$modal.msgSuccess("Update successful")
          open.value = false
          getList()
        })
      } else {
        addPatients(form.value).then(response => {
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
  const _patientIds = row.patientId || ids.value
  proxy.$modal.confirm('Are you sure to delete patient basic information with ID "' + _patientIds + '"?').then(function () {
    return delPatients(_patientIds)
  }).then(() => {
    getList()
    proxy.$modal.msgSuccess("Delete successful")
  }).catch(() => { })
}

/** Export button operation */
function handleExport() {
  proxy.download('health/patients/export', {
    ...queryParams.value
  }, `patients_${new Date().getTime()}.xlsx`)
}

getList()
</script>
