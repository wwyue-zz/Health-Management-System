/*
 Navicat Premium Dump SQL

 Source Server         : SQl
 Source Server Type    : MySQL
 Source Server Version : 80043 (8.0.43)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80043 (8.0.43)
 File Encoding         : 65001

 Date: 10/11/2025 17:02:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'tb_health', '用户健康情况', NULL, NULL, 'Health', 'crud', 'element-plus', 'com.doctor.health', 'health', 'health', '用户健康情况', 'FZH', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2025-11-14 09:11:29', '', '2025-11-14 09:19:35', NULL);
INSERT INTO `gen_table` VALUES (4, 'tb_hypertension_patients', '患者基本信息表', NULL, NULL, 'HypertensionPatients', 'crud', 'element-plus', 'com.doctor.health', 'health', 'patients', '患者基本信息', 'FZH', '0', '/', '{\"parentMenuId\":2018}', 'admin', '2025-11-18 09:14:26', '', '2025-11-18 09:17:06', NULL);
INSERT INTO `gen_table` VALUES (9, 'tb_follow_up_records', '随访及风险评估表', NULL, NULL, 'FollowUpRecords', 'crud', 'element-plus', 'com.doctor.health', 'health', 'records', '随访及风险评估', 'FZH', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-11-18 09:56:37', '', '2025-11-18 10:06:09', NULL);
INSERT INTO `gen_table` VALUES (10, 'tb_health_records', '血压及生命体征记录表', NULL, NULL, 'HealthRecords', 'crud', 'element-plus', 'com.doctor.health', 'health', 'xueya', '血压及生命体征记录', 'FZH', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2025-11-18 09:56:37', '', '2025-11-18 10:04:16', NULL);
INSERT INTO `gen_table` VALUES (11, 'tb_lifestyle_records', '生活习惯干预跟踪表', NULL, NULL, 'LifestyleRecords', 'crud', 'element-plus', 'com.doctor.health', 'health', 'life', '生活习惯干预跟踪', 'FZH', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2025-11-18 09:56:37', '', '2025-11-18 10:04:57', NULL);
INSERT INTO `gen_table` VALUES (12, 'tb_medication_records', '降压药物使用及效果记录', NULL, NULL, 'MedicationRecords', 'crud', 'element-plus', 'com.doctor.health', 'health', 'medication', '降压药物使用及效果记录', 'FZH', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2025-11-18 09:56:37', '', '2025-11-18 10:05:50', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (14, 3, 'id', '用户id', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-14 09:11:29', '', '2025-06-14 09:19:35');
INSERT INTO `gen_table_column` VALUES (15, 3, 'name', '用户姓名', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-06-14 09:11:29', '', '2025-06-14 09:19:35');
INSERT INTO `gen_table_column` VALUES (16, 3, 'livestyle', '生活方式', 'int', 'Long', 'livestyle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_health_livestyle', 3, 'admin', '2025-06-14 09:11:29', '', '2025-06-14 09:19:35');
INSERT INTO `gen_table_column` VALUES (17, 3, 'health', '健康状况', 'int', 'Long', 'health', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_health_health', 4, 'admin', '2025-06-14 09:11:29', '', '2025-06-14 09:19:35');
INSERT INTO `gen_table_column` VALUES (18, 3, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-06-14 09:11:29', '', '2025-06-14 09:19:35');
INSERT INTO `gen_table_column` VALUES (19, 3, 'update_time', '更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-06-14 09:11:29', '', '2025-06-14 09:19:35');
INSERT INTO `gen_table_column` VALUES (20, 4, 'patient_id', '患者唯一ID，主键', 'int', 'Long', 'patientId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (21, 4, 'name', '患者姓名', 'varchar(50)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (22, 4, 'gender', '性别', 'enum(\'男\',\'女\')', 'String', 'gender', '0', '0', '1', '1', '1', '1', '1', 'EQ', NULL, '', 3, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (23, 4, 'id_card', '身份证号（18位）', 'char(18)', 'String', 'idCard', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (24, 4, 'birthday', '出生日期（用于自动计算年龄）', 'date', 'Date', 'birthday', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (25, 4, 'contact_phone', '联系电话', 'varchar(20)', 'String', 'contactPhone', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (26, 4, 'address', '住址', 'varchar(100)', 'String', 'address', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (27, 4, 'height', '身高（cm）', 'decimal(4,1)', 'BigDecimal', 'height', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (28, 4, 'weight', '体重（kg）', 'decimal(4,1)', 'BigDecimal', 'weight', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (29, 4, 'bmi', 'BMI指数（自动计算）', 'decimal(4,1)', 'BigDecimal', 'bmi', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (30, 4, 'family_history', '高血压家族病史（如祖父母、父母患病情况）[5,6](@ref)', 'text', 'String', 'familyHistory', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (31, 4, 'complication', '并发症（如冠心病、脑卒中、肾病等）[6](@ref)', 'text', 'String', 'complication', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (32, 4, 'admission_date', '入住养老机构时间[1](@ref)', 'date', 'Date', 'admissionDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (33, 4, 'created_at', '记录创建时间', 'timestamp', 'Date', 'createdAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (34, 4, 'updated_at', '记录更新时间', 'timestamp', 'Date', 'updatedAt', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2025-06-18 09:14:26', '', '2025-06-18 09:17:06');
INSERT INTO `gen_table_column` VALUES (68, 9, 'follow_id', '记录ID', 'int', 'Long', 'followId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (69, 9, 'patient_id', '患者ID', 'int', 'Long', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (70, 9, 'follow_date', '随访日期', 'date', 'Date', 'followDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (71, 9, 'next_date', '下次随访计划日期', 'date', 'Date', 'nextDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (72, 9, 'doctor_notes', '医生评估意见', 'text', 'String', 'doctorNotes', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (73, 9, 'risk_assessment', '心血管风险等级', 'enum(\'低危\',\'中危\',\'高危\')', 'String', 'riskAssessment', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 6, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (74, 9, 'referral', '转诊建议', 'text', 'String', 'referral', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (75, 9, 'name', '患者姓名', 'varchar(10)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 8, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:06:09');
INSERT INTO `gen_table_column` VALUES (76, 10, 'record_id', '记录ID', 'int', 'Long', 'recordId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (77, 10, 'patient_id', '关联患者ID', 'int', 'Long', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (78, 10, 'record_date', '记录日期及时间', 'datetime', 'Date', 'recordDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (79, 10, 'systolic_bp', '收缩压（mmHg）', 'smallint', 'Long', 'systolicBp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (80, 10, 'diastolic_bp', '舒张压（mmHg）', 'smallint', 'Long', 'diastolicBp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (81, 10, 'bp_level', '血压分级', 'enum(\'正常\',\'正常高值\',\'1级高血压\',\'2级高血压\',\'3级高血压\')', 'String', 'bpLevel', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 6, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (82, 10, 'heart_rate', '心率（次/分钟）', 'smallint', 'Long', 'heartRate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (83, 10, 'notes', '异常症状', 'text', 'String', 'notes', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (84, 10, 'name', '患者姓名', 'varchar(10)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:16');
INSERT INTO `gen_table_column` VALUES (85, 11, 'lifestyle_id', '记录ID', 'int', 'Long', 'lifestyleId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (86, 11, 'patient_id', '患者ID', 'int', 'Long', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (87, 11, 'record_date', '记录日期', 'date', 'Date', 'recordDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (88, 11, 'diet_plan', '饮食方案', 'enum(\'低盐\',\'低脂\',\'高纤维\',\'糖尿病饮食\',\'素食\',\'其他\')', 'String', 'dietPlan', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 4, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (89, 11, 'salt_intake', '盐摄入量', 'enum(\'<3g/天\',\'3-6g/天\',\'>6g/天\')', 'String', 'saltIntake', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 5, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (90, 11, 'exercise_frequency', '运动频率', 'enum(\'从不\',\'每周1-2次\',\'每周3-5次\',\'每天\')', 'String', 'exerciseFrequency', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 6, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (91, 11, 'smoking_status', '吸烟情况', 'enum(\'从不\',\'已戒烟\',\'偶尔\',\'每天\')', 'String', 'smokingStatus', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (92, 11, 'alcohol_intake', '饮酒情况', 'enum(\'从不\',\'偶尔\',\'经常\')', 'String', 'alcoholIntake', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 8, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (93, 11, 'sleep_quality', '睡眠质量', 'enum(\'良好\',\'一般\',\'差\')', 'String', 'sleepQuality', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 9, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (94, 11, 'name', '患者姓名', 'varchar(10)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:04:57');
INSERT INTO `gen_table_column` VALUES (95, 12, 'med_id', '药物ID', 'int', 'Long', 'medId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (96, 12, 'patient_id', '患者ID', 'int', 'Long', 'patientId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (97, 12, 'drug_name', '药物名称', 'varchar(50)', 'String', 'drugName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (98, 12, 'dosage', '剂量', 'varchar(30)', 'String', 'dosage', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (99, 12, 'frequency', '用药频率', 'enum(\'每日1次\',\'每日2次\',\'每日3次\',\'按需服用\')', 'String', 'frequency', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 5, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (100, 12, 'start_date', '开始用药日期', 'date', 'Date', 'startDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (101, 12, 'end_date', '停药日期', 'date', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (102, 12, 'effect', '疗效评估', 'enum(\'有效\',\'无效\',\'副作用\')', 'String', 'effect', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 8, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (103, 12, 'side_effects', '药物不良反应', 'text', 'String', 'sideEffects', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');
INSERT INTO `gen_table_column` VALUES (104, 12, 'name', '患者姓名', 'varchar(10)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 10, 'admin', '2025-06-18 09:56:37', '', '2025-06-18 10:05:50');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-green', 'Y', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-04 14:57:39', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-04-29 15:01:52', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-04 14:58:10', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-04-29 15:01:52', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-04-29 15:01:52', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-04-29 15:01:52', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'admin', 0, 'Zhihao Fu', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-04-29 15:01:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, 'Normal', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, 'Stop', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '0', '较差', 'sys_health_health', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:15:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '1', '中等', 'sys_health_health', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:15:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '2', '很好', 'sys_health_health', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:16:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '1', '差', 'sys_health_livestyle', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:16:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '2', '较差', 'sys_health_livestyle', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:16:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '3', '一般', 'sys_health_livestyle', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:16:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '4', '较好', 'sys_health_livestyle', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:16:50', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '5', '很好', 'sys_health_livestyle', NULL, 'default', 'N', '0', 'admin', '2025-06-14 09:16:56', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '健康状态', 'sys_health_health', '0', 'admin', '2025-06-14 09:14:06', 'admin', '2025-06-14 09:15:13', '用户健康状态列表');
INSERT INTO `sys_dict_type` VALUES (101, '生活方式', 'sys_health_livestyle', '0', 'admin', '2025-06-14 09:14:42', 'admin', '2025-06-14 09:15:20', '用户生活方式列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-04-29 15:01:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 15:58:38');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 16:11:56');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-04 14:37:21');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-04 14:58:53');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-14 07:51:33');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-14 08:11:36');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-14 08:13:12');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-06-14 08:13:23');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-14 08:13:27');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-14 08:34:23');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-14 08:42:24');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-14 08:55:08');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 09:14:06');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 10:51:47');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 11:07:41');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 11:09:23');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 11:16:52');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 12:14:26');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 14:17:45');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 14:32:53');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-06-18 14:32:58');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 14:33:02');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 14:33:37');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 14:33:40');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 14:34:12');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 14:34:16');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 14:37:14');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 14:39:37');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 14:40:19');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 14:40:23');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 15:30:18');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 15:32:29');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 15:33:18');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-06-18 15:33:45');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 15:34:04');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '222.244.139.20', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2025-06-18 15:54:58');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '222.244.139.200', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-18 16:30:32');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-19 19:35:27');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-19 19:55:00');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-19 20:34:03');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-20 14:46:56');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '1', '验证码已失效', '2025-06-20 16:06:28');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-20 16:06:40');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-06-20 16:17:55');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-20 17:17:56');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-21 10:41:38');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-21 13:48:22');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '222.244.139.200', 'XX XX', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-21 14:04:59');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-21 16:29:47');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '1', '验证码已失效', '2025-06-21 16:51:50');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-21 16:51:56');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-22 07:37:19');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-22 07:37:44');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '退出成功', '2025-06-22 07:40:00');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-22 07:40:20');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-22 17:55:08');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-22 21:41:26');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '223.64.113.194', 'XX XX', 'Firefox 13', 'Windows 10', '0', '登录成功', '2025-06-22 22:10:02');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-09-25 14:47:15');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-10 13:58:24');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-11-10 16:41:02');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-10 16:41:08');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-10 16:50:50');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2078 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 'System Management', 0, 7, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-04-29 15:01:52', 'admin', '2025-11-10 14:45:19', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, 'System monitor', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2025-04-29 15:01:52', 'admin', '2025-11-10 16:37:28', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, 'System Tool', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2025-04-29 15:01:52', 'admin', '2025-11-10 16:37:15', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, 'Website', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2025-04-29 15:01:52', 'admin', '2025-11-10 16:37:38', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, 'User Management', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-04-29 15:01:52', 'admin', '2025-11-10 16:13:04', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '1', '0', 'system:role:list', 'peoples', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:15', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, 'Order Management', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-04-29 15:01:52', 'admin', '2025-11-10 16:13:19', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:20', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:23', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:27', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:31', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:34', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2025-04-29 15:01:52', 'admin', '2025-06-18 13:30:37', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-04-29 15:01:52', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-04-29 15:01:52', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-04-29 15:01:52', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-04-29 15:01:52', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-04-29 15:01:52', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-04-29 15:01:52', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-04-29 15:01:52', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-04-29 15:01:52', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-04-29 15:01:52', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-04-29 15:01:52', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-04-29 15:01:52', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, 'Patient Basic Information', 0, 1, 'patients', 'health/patients/index', NULL, '', 1, 0, 'C', '0', '0', 'health:patients:list', 'documentation', 'admin', '2025-06-18 09:24:23', 'admin', '2025-11-10 16:12:47', '患者基本信息菜单');
INSERT INTO `sys_menu` VALUES (2025, '患者基本信息查询', 2024, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:patients:query', '#', 'admin', '2025-06-18 09:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '患者基本信息新增', 2024, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:patients:add', '#', 'admin', '2025-06-18 09:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '患者基本信息修改', 2024, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:patients:edit', '#', 'admin', '2025-06-18 09:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '患者基本信息删除', 2024, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:patients:remove', '#', 'admin', '2025-06-18 09:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '患者基本信息导出', 2024, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:patients:export', '#', 'admin', '2025-06-18 09:24:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, 'Follow-up and Risk Assessment', 0, 5, 'records', 'health/records/index', NULL, '', 1, 0, 'C', '0', '0', 'health:records:list', 'edit', 'admin', '2025-06-18 10:00:03', 'admin', '2025-11-10 16:11:34', '随访及风险评估菜单');
INSERT INTO `sys_menu` VALUES (2037, '随访及风险评估查询', 2036, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:records:query', '#', 'admin', '2025-06-18 10:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '随访及风险评估新增', 2036, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:records:add', '#', 'admin', '2025-06-18 10:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '随访及风险评估修改', 2036, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:records:edit', '#', 'admin', '2025-06-18 10:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '随访及风险评估删除', 2036, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:records:remove', '#', 'admin', '2025-06-18 10:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '随访及风险评估导出', 2036, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:records:export', '#', 'admin', '2025-06-18 10:00:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, 'Lifestyle habit intervention tracking', 0, 3, 'life', 'health/life/index', NULL, '', 1, 0, 'C', '0', '0', 'health:life:list', 'druid', 'admin', '2025-06-18 10:07:14', 'admin', '2025-11-10 16:12:19', '生活习惯干预跟踪菜单');
INSERT INTO `sys_menu` VALUES (2043, '生活习惯干预跟踪查询', 2042, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:life:query', '#', 'admin', '2025-06-18 10:07:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '生活习惯干预跟踪新增', 2042, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:life:add', '#', 'admin', '2025-06-18 10:07:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '生活习惯干预跟踪修改', 2042, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:life:edit', '#', 'admin', '2025-06-18 10:07:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '生活习惯干预跟踪删除', 2042, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:life:remove', '#', 'admin', '2025-06-18 10:07:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '生活习惯干预跟踪导出', 2042, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:life:export', '#', 'admin', '2025-06-18 10:07:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, 'Record of Antihypertensive Medication', 0, 4, 'medication', 'health/medication/index', NULL, '', 1, 0, 'C', '0', '0', 'health:medication:list', 'dict', 'admin', '2025-06-18 10:09:36', 'admin', '2025-11-10 16:10:49', '降压药物使用及效果记录菜单');
INSERT INTO `sys_menu` VALUES (2049, '降压药物使用及效果记录查询', 2048, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:medication:query', '#', 'admin', '2025-06-18 10:09:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '降压药物使用及效果记录新增', 2048, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:medication:add', '#', 'admin', '2025-06-18 10:09:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '降压药物使用及效果记录修改', 2048, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:medication:edit', '#', 'admin', '2025-06-18 10:09:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '降压药物使用及效果记录删除', 2048, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:medication:remove', '#', 'admin', '2025-06-18 10:09:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '降压药物使用及效果记录导出', 2048, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:medication:export', '#', 'admin', '2025-06-18 10:09:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, 'Blood pressure and vital signs record', 0, 2, 'xueya', 'health/xueya/index', NULL, '', 1, 0, 'C', '0', '0', 'health:xueya:list', 'log', 'admin', '2025-06-18 10:09:46', 'admin', '2025-11-10 16:12:33', '血压及生命体征记录菜单');
INSERT INTO `sys_menu` VALUES (2061, '血压及生命体征记录查询', 2060, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:xueya:query', '#', 'admin', '2025-06-18 10:09:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '血压及生命体征记录新增', 2060, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:xueya:add', '#', 'admin', '2025-06-18 10:09:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2063, '血压及生命体征记录修改', 2060, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:xueya:edit', '#', 'admin', '2025-06-18 10:09:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '血压及生命体征记录删除', 2060, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:xueya:remove', '#', 'admin', '2025-06-18 10:09:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '血压及生命体征记录导出', 2060, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'health:xueya:export', '#', 'admin', '2025-06-18 10:09:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, 'AI Personalized Recommendation Generation', 0, 6, 'ai-chat', 'ai/chat/index', NULL, '', 1, 0, 'C', '0', '0', 'system:ai:chat:list', 'input', 'admin', '2025-06-18 13:28:16', 'admin', '2025-11-10 14:49:27', 'AI患者咨询菜单');
INSERT INTO `sys_menu` VALUES (2077, 'Lifestyle Habit Assessment Radar Chart', 0, 3, 'health/life/list', 'health/lifestyle/radar', NULL, '', 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2025-06-18 16:24:18', 'admin', '2025-11-10 16:12:02', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-04-29 15:01:52', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-04-29 15:01:52', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------


-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', 'ceo', 1, '0', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', 'se', 2, '0', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', 'hr', 3, '0', 'admin', '2025-04-29 15:01:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', 'user', 4, '0', 'admin', '2025-04-29 15:01:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'Super', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, 'Normal', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-04-29 15:01:52', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------


-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for tb_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '课程编码',
  `subject` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '课程学科',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '课程名称',
  `price` int NULL DEFAULT NULL COMMENT '价格（元）',
  `applicable_person` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '适用人群',
  `info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '课程介绍',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '课程管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_course
-- ----------------------------


-- ----------------------------
-- Table structure for tb_follow_up_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_follow_up_records`;
CREATE TABLE `tb_follow_up_records`  (
  `follow_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `follow_date` date NOT NULL COMMENT 'Follow-up Date',
  `next_date` date NULL DEFAULT NULL COMMENT 'Next Follow-up Plan Date',
  `doctor_notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Doctor Assessment Notes',
  `risk_assessment` enum('High Risk','Medium Risk','Low Risk') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `referral` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Referral Recommendation',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Patient Name',
  PRIMARY KEY (`follow_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `tb_follow_up_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `tb_hypertension_patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Follow-up and Risk Assessment Table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_follow_up_records
-- ----------------------------
INSERT INTO `tb_follow_up_records` VALUES (1, 1, '2025-06-10', '2025-09-10', 'Blood pressure control unstable', 'High Risk', 'Cardiology consultation', 'Zhang Jianguo');
INSERT INTO `tb_follow_up_records` VALUES (2, 2, '2025-06-11', '2025-07-11', 'Need to adjust diuretic dosage', 'Low Risk', NULL, 'Wang Xiuying');
INSERT INTO `tb_follow_up_records` VALUES (3, 3, '2025-06-09', '2025-09-09', 'Lifestyle intervention effective', 'Medium Risk', 'Nutrition department consultation', 'Li Weimin');

-- ----------------------------
-- Table structure for tb_health
-- ----------------------------
DROP TABLE IF EXISTS `tb_health`;
CREATE TABLE `tb_health`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户姓名',
  `livestyle` int NOT NULL COMMENT '生活方式 1-9 越高越好',
  `health` int NOT NULL COMMENT '健康状况 0：差 1：中等 2：好',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户健康情况' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_health
-- ----------------------------
INSERT INTO `tb_health` VALUES (1, '张三', 1, 0, '2025-06-14 09:09:18', '2025-06-14 09:09:27');
INSERT INTO `tb_health` VALUES (2, '李四', 5, 1, '2025-06-14 09:09:22', '2025-06-14 09:09:30');
INSERT INTO `tb_health` VALUES (3, '王五', 9, 2, '2025-06-14 09:09:25', '2025-06-14 09:09:32');

-- ----------------------------
-- Table structure for tb_health_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_health_records`;
CREATE TABLE `tb_health_records`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL COMMENT 'Related Patient ID',
  `record_date` datetime NOT NULL COMMENT 'Record Date and Time',
  `systolic_bp` smallint NOT NULL COMMENT 'Systolic Blood Pressure (mmHg)',
  `diastolic_bp` smallint NOT NULL COMMENT 'Diastolic Blood Pressure (mmHg)',
  `bp_level` enum('Normal','High-Normal','Stage 1 Hypertension','Stage 2 Hypertension','Stage 3 Hypertension') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Blood Pressure Level',
  `heart_rate` smallint NULL DEFAULT NULL COMMENT 'Heart Rate (beats/minute)',
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Abnormal Symptoms',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Patient Name',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `tb_health_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `tb_hypertension_patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tb_health_records_chk_1` CHECK (`systolic_bp` > `diastolic_bp`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blood Pressure and Vital Signs Record Table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_health_records
-- ----------------------------
INSERT INTO `tb_health_records` VALUES (1, 1, '2025-06-01 08:30:00', 158, 92, 'Stage 2 Hypertension', 78, 'Morning dizziness', 'Zhang Jianguo');
INSERT INTO `tb_health_records` VALUES (2, 1, '2025-06-02 14:00:00', 146, 86, 'Stage 1 Hypertension', 75, NULL, 'Wang Xiuying');
INSERT INTO `tb_health_records` VALUES (3, 2, '2025-06-01 10:15:00', 172, 98, 'Stage 3 Hypertension', 82, 'Night palpitations', 'Li Weimin');
INSERT INTO `tb_health_records` VALUES (4, 3, '2025-06-03 09:00:00', 132, 80, 'High-Normal', 70, NULL, 'Chen Yulan');
INSERT INTO `tb_health_records` VALUES (5, 4, '2025-06-02 16:20:00', 148, 90, 'Stage 1 Hypertension', 76, 'Mild headache', 'Zhao Zhiqiang');

-- ----------------------------
-- Table structure for tb_hypertension_patients
-- ----------------------------
DROP TABLE IF EXISTS `tb_hypertension_patients`;
CREATE TABLE `tb_hypertension_patients`  (
  `patient_id` int NOT NULL AUTO_INCREMENT COMMENT 'Patient Unique ID, Primary Key',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Patient Name',
  `gender` enum('Male','Female') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Gender',
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID Card Number (18 digits)',
  `birthday` date NOT NULL COMMENT 'Birth Date (for automatic age calculation)',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Contact Phone',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Address',
  `height` decimal(4, 1) NULL DEFAULT NULL COMMENT 'Height (cm)',
  `weight` decimal(4, 1) NULL DEFAULT NULL COMMENT 'Weight (kg)',
  `bmi` decimal(4, 1) GENERATED ALWAYS AS ((`weight` / ((`height` / 100) * (`height` / 100)))) STORED COMMENT 'BMI Index (auto calculated)' NULL,
  `family_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Hypertension Family History (e.g., grandparents, parents condition) [5,6](@ref)',
  `complication` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Complications (e.g., coronary heart disease, stroke, kidney disease, etc.) [6](@ref)',
  `admission_date` date NULL DEFAULT NULL COMMENT 'Nursing Home Admission Date [1](@ref)',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Record Creation Time',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Record Update Time',
  PRIMARY KEY (`patient_id`) USING BTREE,
  UNIQUE INDEX `id_card`(`id_card` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Elderly Hypertension Patients Basic Information Table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_hypertension_patients
-- ----------------------------
INSERT INTO `tb_hypertension_patients` VALUES (1, 'Zhang Jianguo', 'Male', '320583195501011234', '1955-01-01', '13800138001', 'No.128 Guanqian Street, Gusu District, Suzhou City, Jiangsu Province', 168.5, 72.3, DEFAULT, 'Father has hypertension', 'Coronary heart disease, Diabetes', '2020-05-10', '2025-06-18 09:31:22', '2025-06-19 20:01:25');
INSERT INTO `tb_hypertension_patients` VALUES (2, 'Wang Xiuying', 'Female', '320583193802028765', '1938-02-02', '13900139002', 'No.218 Xinghu Street, Industrial Park, Suzhou City, Jiangsu Province', 155.0, 68.0, DEFAULT, 'Mother has hypertension', 'Stroke', '2019-11-20', '2025-06-18 09:31:22', '2025-06-19 20:01:34');
INSERT INTO `tb_hypertension_patients` VALUES (3, 'Li Weimin', 'Male', '320583194512123456', '1945-12-12', '13700137003', 'No.369 Baodai East Road, Wuzhong District, Suzhou City, Jiangsu Province', 172.0, 80.5, DEFAULT, 'None', 'Kidney disease', '2021-03-15', '2025-06-18 09:31:22', '2025-06-19 20:01:42');
INSERT INTO `tb_hypertension_patients` VALUES (4, 'Chen Yulan', 'Female', '320583195008087890', '1950-08-08', '13600136004', 'No.96 Yangcheng Lake West Road, Xiangcheng District, Suzhou City, Jiangsu Province', 160.2, 65.8, DEFAULT, 'Both parents have hypertension', 'Diabetes', '2022-01-30', '2025-06-18 09:31:22', '2025-06-19 20:01:51');
INSERT INTO `tb_hypertension_patients` VALUES (5, 'Zhao Zhiqiang', 'Male', '320583194303031111', '1943-03-03', '13500135005', 'No.88 Shishan Road, High-tech Zone, Suzhou City, Jiangsu Province', 170.1, 75.0, DEFAULT, 'Brother has hypertension', 'Coronary heart disease', '2018-07-22', '2025-06-18 09:31:22', '2025-06-19 20:02:01');
INSERT INTO `tb_hypertension_patients` VALUES (11, 'Zhou Jianhua', 'Male', '320583195712124567', '1957-12-12', '13400134006', 'No.202 Shiquan Street, Gusu District, Suzhou City, Jiangsu Province', 175.3, 82.0, DEFAULT, 'None', 'Diabetes', '2020-09-18', '2025-06-19 19:58:45', '2025-06-19 19:59:59');
INSERT INTO `tb_hypertension_patients` VALUES (12, 'Wu Shufen', 'Female', '320583194808088888', '1948-08-08', '13300133007', 'No.88 Jinji Lake Avenue, Industrial Park, Suzhou City, Jiangsu Province', 158.0, 62.5, DEFAULT, 'Mother has hypertension', 'None', '2021-06-05', '2025-06-19 19:58:45', '2025-06-19 20:00:02');
INSERT INTO `tb_hypertension_patients` VALUES (13, 'Huang Mingyuan', 'Male', '320583195303032222', '1953-03-03', '13200132008', 'No.333 Baodai East Road, Wuzhong District, Suzhou City, Jiangsu Province', 169.8, 78.2, DEFAULT, 'Father has hypertension', 'Stroke', '2019-04-12', '2025-06-19 19:58:45', '2025-06-19 20:00:04');
INSERT INTO `tb_hypertension_patients` VALUES (14, 'Yang Yuzhen', 'Female', '320583194404044444', '1944-04-04', '13100131009', 'No.188 Jiayuan Road, Xiangcheng District, Suzhou City, Jiangsu Province', 162.5, 70.1, DEFAULT, 'None', 'Diabetes', '2020-11-30', '2025-06-19 19:58:45', '2025-06-19 20:00:06');
INSERT INTO `tb_hypertension_patients` VALUES (15, 'Liu Weidong', 'Male', '320583195909096666', '1959-09-09', '13000130010', 'No.100 Shishan Road, High-tech Zone, Suzhou City, Jiangsu Province', 178.0, 85.0, DEFAULT, 'Both parents have hypertension', 'Coronary heart disease', '2021-08-15', '2025-06-19 19:58:45', '2025-06-19 20:00:09');
INSERT INTO `tb_hypertension_patients` VALUES (16, 'Xu Fang', 'Female', '320583194606066666', '1946-06-06', '15900159011', 'No.288 Ganjiang East Road, Gusu District, Suzhou City, Jiangsu Province', 156.8, 63.2, DEFAULT, 'Mother has hypertension', 'None', '2020-02-28', '2025-06-19 19:58:45', '2025-06-19 20:00:12');
INSERT INTO `tb_hypertension_patients` VALUES (17, 'Sun Wei', 'Male', '320583195707077777', '1957-07-07', '15800158012', 'No.199 Xinggang Street, Industrial Park, Suzhou City, Jiangsu Province', 173.5, 79.8, DEFAULT, 'None', 'Diabetes', '2019-10-10', '2025-06-19 19:58:45', '2025-06-19 20:00:15');
INSERT INTO `tb_hypertension_patients` VALUES (18, 'Ma Xiulan', 'Female', '320583194909099999', '1949-09-09', '15700157013', 'No.168 Dongwu South Road, Wuzhong District, Suzhou City, Jiangsu Province', 159.5, 66.7, DEFAULT, 'Both parents have hypertension', 'Stroke', '2021-01-05', '2025-06-19 19:58:45', '2025-06-19 20:00:17');
INSERT INTO `tb_hypertension_patients` VALUES (19, 'Zhu Guoqiang', 'Male', '320583195010101010', '1950-10-10', '15600156014', 'No.77 Runyuan Road, Xiangcheng District, Suzhou City, Jiangsu Province', 171.2, 76.5, DEFAULT, 'Father has hypertension', 'Coronary heart disease', '2020-07-20', '2025-06-19 19:58:45', '2025-06-19 20:00:20');
INSERT INTO `tb_hypertension_patients` VALUES (20, 'Zheng Yumei', 'Female', '320583194101012345', '1941-01-01', '15500155015', 'No.66 Qingshan Road, Science City, High-tech Zone, Suzhou City, Jiangsu Province', 157.0, 64.0, DEFAULT, 'None', 'None', '2018-12-15', '2025-06-19 19:58:45', '2025-06-19 20:00:22');
INSERT INTO `tb_hypertension_patients` VALUES (21, 'Gao Jianguo', 'Male', '320583195212125678', '1952-12-12', '15400154016', 'No.105 Sanxiang Road, Gusu District, Suzhou City, Jiangsu Province', 174.0, 81.2, DEFAULT, 'Brother has hypertension', 'Diabetes', '2020-04-05', '2025-06-19 19:58:45', '2025-06-19 20:00:25');
INSERT INTO `tb_hypertension_patients` VALUES (22, 'Lin Shuhua', 'Female', '320583194707077890', '1947-07-07', '15300153017', 'No.128 Fangzhou Road, Industrial Park, Suzhou City, Jiangsu Province', 161.5, 69.3, DEFAULT, 'Mother has hypertension', 'Stroke', '2019-09-10', '2025-06-19 19:58:45', '2025-06-19 20:00:28');
INSERT INTO `tb_hypertension_patients` VALUES (23, 'Hu Zhiqiang', 'Male', '320583195808088901', '1958-08-08', '15200152018', 'No.188 Shihu West Road, Wuzhong District, Suzhou City, Jiangsu Province', 176.5, 83.0, DEFAULT, 'None', 'Coronary heart disease', '2021-05-20', '2025-06-19 19:58:45', '2025-06-19 20:00:31');
INSERT INTO `tb_hypertension_patients` VALUES (24, 'Zhong Yuying', 'Female', '320583194505059012', '1945-05-05', '15100151019', 'No.58 Yuanhetang Street, Xiangcheng District, Suzhou City, Jiangsu Province', 163.0, 71.5, DEFAULT, 'Both parents have hypertension', 'None', '2020-10-30', '2025-06-19 19:58:45', '2025-06-19 20:00:34');
INSERT INTO `tb_hypertension_patients` VALUES (25, 'Qian Weimin', 'Male', '320583195611119876', '1956-11-11', '15000150020', 'No.33 Xingxian Road, Xushuguan Town, High-tech Zone, Suzhou City, Jiangsu Province', 172.8, 80.0, DEFAULT, 'Father has hypertension', 'Diabetes', '2019-12-25', '2025-06-19 19:58:45', '2025-06-19 20:00:37');

-- ----------------------------
-- Table structure for tb_lifestyle_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_lifestyle_records`;
CREATE TABLE `tb_lifestyle_records`  (
  `lifestyle_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `record_date` date NOT NULL COMMENT 'Record Date',
  `diet_plan` enum('Low Salt','Low Fat','High Fiber','Diabetic Diet','Vegetarian','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Diet Plan',
  `salt_intake` enum('<3g/day','3-6g/day','>6g/day') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Salt Intake',
  `exercise_frequency` enum('Never','1-2 times/week','3-5 times/week','Daily') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Exercise Frequency',
  `smoking_status` enum('Never','Quit','Occasionally','Daily') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Smoking Status',
  `alcohol_intake` enum('Never','Occasionally','Frequently') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Alcohol Intake',
  `sleep_quality` enum('Good','Average','Poor') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Sleep Quality',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Patient Name',
  PRIMARY KEY (`lifestyle_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `tb_lifestyle_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `tb_hypertension_patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Lifestyle Intervention Tracking Table' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_lifestyle_records
-- ----------------------------
INSERT INTO `tb_lifestyle_records` VALUES (1, 1, '2025-06-01', 'Low Salt', '<3g/day', '3-5 times/week', 'Quit', 'Occasionally', 'Average', 'Zhang Jianguo');
INSERT INTO `tb_lifestyle_records` VALUES (2, 2, '2025-06-01', 'Low Fat', '3-6g/day', 'Never', 'Daily', 'Frequently', 'Poor', 'Wang Xiuying');
INSERT INTO `tb_lifestyle_records` VALUES (3, 3, '2025-06-02', 'Diabetic Diet', '<3g/day', '1-2 times/week', 'Never', 'Never', 'Good', 'Li Weimin');
INSERT INTO `tb_lifestyle_records` VALUES (4, 4, '2025-06-01', 'High Fiber', '>6g/day', '3-5 times/week', 'Quit', 'Occasionally', 'Average', 'Chen Yulan');

-- ----------------------------
-- Table structure for tb_medication_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_medication_records`;
CREATE TABLE `tb_medication_records`  (
  `med_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `drug_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Drug name',
  `dosage` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Dosage',
  `frequency` enum('Once daily','Twice daily','Three times daily','As needed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Medication frequency',
  `start_date` date NOT NULL COMMENT 'Medication start date',
  `end_date` date NULL DEFAULT NULL COMMENT 'Medication end date',
  `effect` enum('Effective','Ineffective','Side effects') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Efficacy evaluation',
  `side_effects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'Adverse drug reactions',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Patient name',
  PRIMARY KEY (`med_id`) USING BTREE,
  INDEX `patient_id`(`patient_id` ASC) USING BTREE,
  CONSTRAINT `tb_medication_records_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `tb_hypertension_patients` (`patient_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Antihypertensive medication usage and effect records' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_medication_records
-- ----------------------------
INSERT INTO `tb_medication_records` VALUES (1, 1, 'Amlodipine', '5mg/dose', 'Once daily', '2024-01-01', NULL, 'Effective', 'Ankle edema', 'Zhang Jianguo');
INSERT INTO `tb_medication_records` VALUES (2, 1, 'Valsartan', '80mg/dose', 'Once daily', '2024-01-01', NULL, 'Effective', NULL, 'Wang Xiuying');
INSERT INTO `tb_medication_records` VALUES (3, 2, 'Hydrochlorothiazide', '25mg/dose', 'Once daily', '2023-11-01', NULL, 'Ineffective', 'Hypokalemia', 'Li Weimin');
INSERT INTO `tb_medication_records` VALUES (4, 3, 'Metoprolol', '47.5mg/dose', 'Once daily', '2024-03-01', NULL, 'Effective', 'Bradycardia', 'Chen Yulan');
INSERT INTO `tb_medication_records` VALUES (5, 4, 'Insulin', '10 units/dose', 'Twice daily', '2022-08-01', NULL, 'Effective', NULL, 'Zhao Zhiqiang');

SET FOREIGN_KEY_CHECKS = 1;
