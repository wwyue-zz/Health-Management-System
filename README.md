# 🏥 Health-Management-System

> A Health Management System tailored for family doctors, based on RuoYi-Vue.
> Focused on full-cycle health management, vital signs monitoring, and lifestyle intervention for elderly hypertension patients.

## 📖 Introduction

This project is a comprehensive **Health Management System** designed for community healthcare and family doctors. Centered around **Hypertension Management**, the system creates a closed-loop business flow ranging from patient profiling and daily monitoring to medication tracking and risk assessment.

Additionally, the system integrates an **AI Personalized Recommendation** module, aiming to assist doctors in providing more precise health guidance to patients.

## 🌟 Core Modules

Based on the database design (`ry-vue.sql`), the system includes the following core functional units:

### 1. 👴 Patient Profile Management
* **Table**: `tb_hypertension_patients`
* **Function**: Manages basic information for elderly hypertension patients.
* **Key Fields**:
    * `bmi`: Automatic calculation of the Body Mass Index.
    * `family_history`: Records family history of hypertension.
    * `complication`: Records complications (e.g., Coronary Heart Disease, Stroke).
    * `admission_date`: Manages admission and filing dates.

### 2. 📉 Vital Signs Monitoring (BP Records)
* **Table**: `tb_health_records`
* **Function**: Logs daily blood pressure and vital signs data.
* **Key Fields**:
    * `systolic_bp` / `diastolic_bp`: Records systolic and diastolic pressure.
    * `bp_level`: Automatic BP grading (Normal / Stage 1 / Stage 2 / Stage 3 Hypertension).
    * `heart_rate`: Monitors heart rate.
    * `abnormal_symptoms`: Logs any abnormal symptoms observed.

### 3. 🥗 Lifestyle Intervention
* **Table**: `tb_lifestyle_records`
* **Function**: Tracks and evaluates patient lifestyle habits to support non-pharmacological treatment.
* **Key Dimensions**:
    * Diet Plan (`diet_plan`): e.g., Low Salt, Low Fat diet.
    * Salt Intake (`salt_intake`): Precise monitoring of daily salt consumption.
    * Tracks Exercise Frequency, Smoking Status, Alcohol Consumption, and Sleep Quality.

### 4. 💊 Medication Management
* **Table**: `tb_medication_records`
* **Function**: Tracks the usage and efficacy of antihypertensive medication.
* **Key Fields**:
    * `drug_name`: Name of the medication.
    * `frequency`: Dosage frequency (e.g., Once daily, Twice daily).
    * `effect`: Efficacy evaluation (Effective / Ineffective / Side Effects).
    * `side_effects`: Detailed records of any adverse drug reactions.

### 5. 📋 Follow-up & Risk Assessment
* **Table**: `tb_follow_up_records`
* **Function**: Records regular doctor-patient follow-ups and cardiovascular risk assessments.
* **Key Fields**:
    * `risk_assessment`: Determination of risk level (Low Risk / Medium Risk / High Risk).
    * `doctor_assessment`: Doctor's evaluation notes.
    * `referral`: Referral suggestions if transfer is needed.

### 6. 🤖 AI Consultant
* **Frontend**: `ai/chat/index`
* **Function**: Generates personalized health advice based on patient data.
* **Interaction**: Provides an intelligent chat interface to offer targeted diet and exercise guidance.

---

## 🛠️ Tech Stack

### Backend
- **Core Framework**: Spring Boot
- **Persistence**: MyBatis / MyBatis Plus
- **Database**: MySQL 8.0 (Charset `utf8mb4`)
- **Scheduling**: Quartz (for scheduled reminders)
- **Security**: Spring Security

### Frontend
- **Framework**: Vue.js
- **UI Library**: Element UI / Element Plus
- **Visualization**: ECharts (for BP Trend Lines and Health Radar Charts)

---

## ⚡️ Quick Start

### 1. Database Setup
1.  Create a database named `ry-vue`.
2.  Import the SQL scripts (in order):
    - `ry-vue.sql` (Core structure and data)
    - `patientsMenu.sql` (Incremental menu data)

### 2. Backend Startup
1.  Open the project in IDEA.
2.  Update `application-druid.yml` with your database connection details.
3.  Run the main class `RuoYiApplication`.

### 3. Frontend Startup
```bash
# Navigate to frontend directory
cd ruoyi-ui

# Install dependencies
npm install --registry=[https://registry.npmmirror.com](https://registry.npmmirror.com)

# Start the server
npm run dev
