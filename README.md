# 🏥 Health-Management-System

> A Health Management System tailored for family doctors, based on RuoYi-Vue.
> Focused on full-cycle health management, vital signs monitoring, and lifestyle intervention for elderly hypertension patients.

## 📖 Introduction

This project is a comprehensive **Health Management System** designed for community healthcare and family doctors. Centered around **Hypertension Management**, the system creates a closed-loop business flow ranging from patient profiling and daily monitoring to medication tracking and risk assessment.

Additionally, the system integrates an **AI Personalized Recommendation** module, aiming to assist doctors in providing more precise health guidance to patients.

## 🌟 Core Modules

Based on the database design (`ry-vue.sql`), the system includes the following core functional units:

### 1. 🗂️ Patient Profile Center
- **Comprehensive Management**: Manages basic patient info (Name, ID, Contact).
- **Smart Calculation**: Automatically calculates **BMI** based on height and weight.
- **History Tracking**: Detailed records of family history and complications (e.g., CHD, Stroke).

### 2. 📈 Vital Signs Monitoring
- **Data Logging**: Records Systolic BP, Diastolic BP, and Heart Rate.
- **Auto-Grading**: Automatically classifies hypertension levels (Normal / Stage 1 / Stage 2 / Stage 3).
- **Trend Analysis**: Visualizes recent blood pressure trends using **ECharts Line Charts**.

### 3. 🥗 Lifestyle Intervention
- **Multi-dimensional Assessment**: Tracks diet plans (Low Salt/Fat), exercise frequency, smoking/drinking status, and sleep quality.
- **Health Portrait**: Generates a health index model using a **Radar Chart**.

### 4. 💊 Medication Management
- **Prescription Tracking**: Records drug names, dosages, and frequencies.
- **Effectiveness Feedback**: Tracks medication outcomes (Effective/Side Effects) and adverse reactions.

### 5. 📋 Follow-up & Risk Assessment
- **Regular Follow-ups**: Logs doctor-patient follow-up details and medical advice.
- **Risk Grading**: Automatically tags cardiovascular risk levels (🔴 High / 🟠 Medium / 🟢 Low).

### 6. 🤖 AI Intelligent Consultant
- **Smart Consultation**: Integrated AI chat interface generating personalized diet and exercise advice based on patient health data.
---

## 🛠️ Tech Stack

| Module | Technology | Description |
| :--- | :--- | :--- |
| **Backend** | Spring Boot 2.5+ | Core Framework |
| | MyBatis Plus | ORM / Persistence Layer |
| | MySQL 8.0 | Relational Database |
| | Redis | Caching & Session Management |
| | JWT | Authentication |
| **Frontend** | Vue 3 | Progressive JavaScript Framework |
| | Element Plus | UI Component Library |
| | Apache ECharts 5 | Data Visualization |
| | Vite | Frontend Build Tool |

---

## ⚡️ Quick Start

### 1. Prerequisites
- **JDK:** 1.8+
- **MySQL:** 8.0 (Recommended) or 5.7
- **Redis:** 3.0+
- **Node.js:** 14+ / 16+

### 2. Database Setup
1. Create a database named `ry-vue` (Charset: `utf8mb4`).
2. Import SQL scripts in order:
   - `sql/ry_2025xxxx.sql` (Base Structure)
   - `ry-vue.sql` (Business Data)

### 3. Backend Startup
1. Open the `Doctor` folder in IntelliJ IDEA.
2. Update `doctor-admin/src/main/resources/application-druid.yml` with your database credentials.
3. Run `RuoYiApplication.java`.

### 4. Frontend Startup
```bash
# Navigate to frontend directory
cd RuoYi-Vue3

# Install dependencies
npm install --registry=[https://registry.npmmirror.com](https://registry.npmmirror.com)

# Start the server
npm run dev


