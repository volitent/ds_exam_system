/*
 Navicat Premium Data Transfer

 Source Server         : 123456
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : testpaper

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 22/06/2025 14:58:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'knowledge_point', '知识点表', NULL, NULL, 'KnowledgePoint', 'crud', 'element-plus', 'com.ruoyi.testpaper', 'testpaper', 'knowledge_point', '知识点', 'lkr', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:30:53', NULL);
INSERT INTO `gen_table` VALUES (3, 'paper_question', '试卷题目关联表', NULL, NULL, 'PaperQuestion', 'crud', 'element-plus', 'com.ruoyi.testpaper', 'testpaper', 'question', '试卷题目联表', 'lkr', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:07:17', NULL);
INSERT INTO `gen_table` VALUES (4, 'question', '题目表', NULL, NULL, 'Question', 'crud', 'element-plus', 'com.ruoyi.testpaper', 'testpaper', 'question', '问题表', 'lkr', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04', NULL);
INSERT INTO `gen_table` VALUES (6, 'question_knowledge', '题目知识点关联表', NULL, NULL, 'QuestionKnowledge', 'crud', 'element-plus', 'com.ruoyi.testpaper', 'testpaper', 'knowledge', '知识点题目关联表', 'lkr', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:20:49', NULL);
INSERT INTO `gen_table` VALUES (7, 'question_option', '选择题选项关联表', NULL, NULL, 'QuestionOption', 'crud', 'element-plus', 'com.ruoyi.testpaper', 'testpaper', 'option', '选择题选项', 'lkr', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2025-03-06 17:11:42', '', '2025-03-24 23:04:34', NULL);
INSERT INTO `gen_table` VALUES (8, 'question_image', '题目图片', NULL, NULL, 'QuestionImage', 'crud', 'element-plus', 'com.ruoyi.testpaper', 'testpaper', 'image', '题目图片', 'lkr', '0', '/', '{}', 'admin', '2025-03-15 21:58:38', '', '2025-03-15 21:59:43', NULL);
INSERT INTO `gen_table` VALUES (9, 'paper', '试卷表', NULL, NULL, 'Paper', 'crud', 'element-plus', 'com.ruoyi.paper', 'paper', 'paperlist', '试卷表管理', 'lkr', '0', '/', '{\"parentMenuId\":2031}', 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '知识点', 'bigint', 'Long', 'id', '1', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:30:53');
INSERT INTO `gen_table_column` VALUES (2, 1, 'kp_name', '知识点名称，如“树”、“图”、“排序”等', 'varchar(50)', 'String', 'kpName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:30:53');
INSERT INTO `gen_table_column` VALUES (3, 1, 'kp_desc', '知识点描述或备注', 'varchar(255)', 'String', 'kpDesc', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:30:53');
INSERT INTO `gen_table_column` VALUES (10, 3, 'id', '关联ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:07:17');
INSERT INTO `gen_table_column` VALUES (11, 3, 'paper_id', '试卷ID', 'bigint', 'Long', 'paperId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 2, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:07:17');
INSERT INTO `gen_table_column` VALUES (12, 3, 'question_id', '题目ID', 'bigint', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:07:17');
INSERT INTO `gen_table_column` VALUES (13, 3, 'question_score', '该题在本试卷中的分值', 'int', 'Long', 'questionScore', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:07:17');
INSERT INTO `gen_table_column` VALUES (14, 3, 'sort_order', '题目在试卷中的排列顺序', 'int', 'Long', 'sortOrder', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:07:17');
INSERT INTO `gen_table_column` VALUES (15, 4, 'id', '题目ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (16, 4, 'question_type', '题型，如 single_choice/multi_choice/fill_blank/short_answer/code 等', 'varchar(20)', 'String', 'questionType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (17, 4, 'title', '题目标题或题干', 'text', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (18, 4, 'difficulty', '难度等级，如 1=易，2=中，3=难', 'int', 'Long', 'difficulty', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (19, 4, 'answer', '正确答案或参考答案（对简答/填空/编程题等生效）', 'text', 'String', 'answer', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 5, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (20, 4, 'analysis', '答案解析或思路讲解', 'text', 'String', 'analysis', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'textarea', '', 6, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (21, 4, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (22, 4, 'update_time', '最后更新时间', 'timestamp', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (23, 4, 'creator_id', '创建者的用户ID（若需要追溯）', 'bigint', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (24, 4, 'remarks', '备注信息，或题目来源', 'varchar(255)', 'String', 'remarks', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 10, 'admin', '2025-03-06 17:11:42', '', '2025-03-14 21:09:04');
INSERT INTO `gen_table_column` VALUES (29, 6, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:20:49');
INSERT INTO `gen_table_column` VALUES (30, 6, 'question_id', '题目id', 'bigint', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:20:49');
INSERT INTO `gen_table_column` VALUES (31, 6, 'kp_id', '知识点id', 'bigint', 'Long', 'kpId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-06 17:11:42', '', '2025-03-08 11:20:49');
INSERT INTO `gen_table_column` VALUES (32, 7, 'id', '选项ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-06 17:11:42', '', '2025-03-24 23:04:34');
INSERT INTO `gen_table_column` VALUES (33, 7, 'question_id', '所属题目的ID', 'bigint', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-06 17:11:42', '', '2025-03-24 23:04:34');
INSERT INTO `gen_table_column` VALUES (34, 7, 'option_label', '选项标签，如 A/B/C/D', 'varchar(5)', 'String', 'optionLabel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-03-06 17:11:42', '', '2025-03-24 23:04:34');
INSERT INTO `gen_table_column` VALUES (35, 7, 'option_content', '选项内容', 'text', 'String', 'optionContent', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'editor', '', 4, 'admin', '2025-03-06 17:11:42', '', '2025-03-24 23:04:34');
INSERT INTO `gen_table_column` VALUES (36, 7, 'is_correct', '是否为正确选项，1=正确，0=错误', 'tinyint(1)', 'Integer', 'isCorrect', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-03-06 17:11:42', '', '2025-03-24 23:04:34');
INSERT INTO `gen_table_column` VALUES (37, 8, 'id', NULL, 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-03-15 21:58:38', '', '2025-03-15 21:59:43');
INSERT INTO `gen_table_column` VALUES (38, 8, 'question_id', '关联题目ID', 'bigint', 'Long', 'questionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-03-15 21:58:38', '', '2025-03-15 21:59:43');
INSERT INTO `gen_table_column` VALUES (39, 8, 'image_path', '图片路径或URL', 'varchar(255)', 'String', 'imagePath', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2025-03-15 21:58:38', '', '2025-03-15 21:59:43');
INSERT INTO `gen_table_column` VALUES (40, 8, 'type', '1-对应题目，0-对应答案', 'int', 'Long', 'type', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2025-03-15 21:58:38', '', '2025-03-15 21:59:43');
INSERT INTO `gen_table_column` VALUES (41, 9, 'id', '试卷ID', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51');
INSERT INTO `gen_table_column` VALUES (42, 9, 'paper_name', '试卷名称', 'varchar(100)', 'String', 'paperName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51');
INSERT INTO `gen_table_column` VALUES (43, 9, 'create_time', '创建时间', 'timestamp', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 3, 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51');
INSERT INTO `gen_table_column` VALUES (44, 9, 'creator_id', '创建者ID，可关联 user(id)', 'bigint', 'Long', 'creatorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51');
INSERT INTO `gen_table_column` VALUES (45, 9, 'total_score', '该试卷的总分（可动态计算，也可存固定值）', 'int', 'Long', 'totalScore', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51');
INSERT INTO `gen_table_column` VALUES (46, 9, 'remarks', '备注或考试说明', 'varchar(255)', 'String', 'remarks', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2025-04-18 16:52:01', '', '2025-04-18 19:45:51');

-- ----------------------------
-- Table structure for knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_point`;
CREATE TABLE `knowledge_point`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kp_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '知识点名称，如“树”、“图”、“排序”等',
  `kp_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '知识点描述或备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_point
-- ----------------------------
INSERT INTO `knowledge_point` VALUES (1, '第一章 绪论', '123');
INSERT INTO `knowledge_point` VALUES (3, '第二章 线性表', NULL);
INSERT INTO `knowledge_point` VALUES (4, '第三章 栈和队列', '无');
INSERT INTO `knowledge_point` VALUES (6, '第五章 树和二叉树', '无');
INSERT INTO `knowledge_point` VALUES (7, '第六章 图', NULL);
INSERT INTO `knowledge_point` VALUES (8, '第七章 查找', NULL);
INSERT INTO `knowledge_point` VALUES (9, '第八章 排序', NULL);
INSERT INTO `knowledge_point` VALUES (10, '第四章 串、数组和广义表', NULL);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `paper_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '试卷名称',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建者ID，可关联 user(id)',
  `total_score` int NULL DEFAULT NULL COMMENT '该试卷的总分（可动态计算，也可存固定值）',
  `remarks` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注或考试说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, '2022秋 数据结构A卷', '2025-03-08 15:35:27', 1, 100, '测试用例');
INSERT INTO `paper` VALUES (2, '贵州大学2022-2023学年第一学期考试试卷   A 数据结构', '2025-04-11 17:28:58', 1, NULL, '自动导入试卷');
INSERT INTO `paper` VALUES (5, '数据结构期末试卷', '2025-05-15 23:43:48', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (6, '数据结构期末试卷', '2025-05-15 23:49:45', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (7, '数据结构期末试卷', '2025-05-15 23:51:17', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (8, '数据结构期末试卷', '2025-05-16 20:47:17', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (9, '数据结构期末试卷', '2025-05-16 21:21:42', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (10, '数据结构期末试卷', '2025-05-16 21:46:14', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (11, '数据结构期末试卷', '2025-05-16 21:46:17', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (12, '数据结构期末试卷', '2025-05-18 14:32:13', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (13, '数据结构期末试卷', '2025-05-23 14:51:58', 1, 100, '由导出功能添加');
INSERT INTO `paper` VALUES (14, '数据结构期末试卷', '2025-06-02 22:23:33', 1, 100, '由导出功能添加');

-- ----------------------------
-- Table structure for paper_question
-- ----------------------------
DROP TABLE IF EXISTS `paper_question`;
CREATE TABLE `paper_question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `paper_id` bigint NOT NULL COMMENT '试卷ID',
  `question_id` bigint NOT NULL COMMENT '题目ID',
  `question_score` int NULL DEFAULT 5 COMMENT '该题在本试卷中的分值',
  `sort_order` int NULL DEFAULT NULL COMMENT '题目在试卷中的排列顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper_question
-- ----------------------------
INSERT INTO `paper_question` VALUES (60, 2, 64, 2, 1);
INSERT INTO `paper_question` VALUES (61, 2, 65, 2, 2);
INSERT INTO `paper_question` VALUES (62, 2, 66, 2, 3);
INSERT INTO `paper_question` VALUES (63, 2, 67, 2, 4);
INSERT INTO `paper_question` VALUES (64, 2, 68, 2, 5);
INSERT INTO `paper_question` VALUES (65, 2, 69, 2, 6);
INSERT INTO `paper_question` VALUES (66, 2, 70, 2, 7);
INSERT INTO `paper_question` VALUES (67, 2, 71, 2, 8);
INSERT INTO `paper_question` VALUES (68, 2, 72, 2, 9);
INSERT INTO `paper_question` VALUES (69, 2, 73, 2, 10);
INSERT INTO `paper_question` VALUES (70, 2, 74, 0, 11);
INSERT INTO `paper_question` VALUES (71, 2, 75, 0, 12);
INSERT INTO `paper_question` VALUES (72, 2, 76, 0, 13);
INSERT INTO `paper_question` VALUES (73, 2, 77, 0, 14);
INSERT INTO `paper_question` VALUES (74, 2, 78, 0, 15);
INSERT INTO `paper_question` VALUES (75, 2, 79, 0, 16);
INSERT INTO `paper_question` VALUES (76, 2, 80, 0, 17);
INSERT INTO `paper_question` VALUES (77, 2, 81, 0, 18);
INSERT INTO `paper_question` VALUES (78, 2, 82, 6, 19);
INSERT INTO `paper_question` VALUES (79, 2, 83, 6, 20);
INSERT INTO `paper_question` VALUES (80, 2, 84, 6, 21);
INSERT INTO `paper_question` VALUES (81, 2, 85, 6, 22);
INSERT INTO `paper_question` VALUES (82, 2, 86, 6, 23);
INSERT INTO `paper_question` VALUES (83, 2, 87, 6, 24);
INSERT INTO `paper_question` VALUES (84, 2, 88, 6, 25);
INSERT INTO `paper_question` VALUES (85, 2, 89, 6, 26);
INSERT INTO `paper_question` VALUES (86, 2, 90, 0, 27);
INSERT INTO `paper_question` VALUES (87, 2, 91, 0, 28);
INSERT INTO `paper_question` VALUES (88, 2, 92, 0, 29);
INSERT INTO `paper_question` VALUES (89, 2, 190, 2, 9);
INSERT INTO `paper_question` VALUES (90, 2, 191, 2, 10);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `question_type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '题型，如single_choice/multi_choice/fill_blank/short_answer/code 等',
  `title` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '题目标题或题干',
  `difficulty` int NOT NULL DEFAULT 1 COMMENT '难度等级，如 1=易，2=中，3=难',
  `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '正确答案或参考答案（对简答/填空/编程题等生效）',
  `analysis` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '答案解析或思路讲解',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `creator_id` bigint NULL DEFAULT NULL COMMENT '创建者的用户ID（若需要追溯）',
  `remarks` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注信息，或题目来源',
  `score` int NULL DEFAULT NULL COMMENT '题目分值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (3, 'single_choice', '下列哪一项是法国的首都？', 1, 'C', '法国的首都是巴黎', '2025-03-15 22:10:35', '2025-05-16 21:16:28', 1001, '示例测试题', 2);
INSERT INTO `question` VALUES (4, 'short_answer', 'test', 1, '1', '1', '2025-03-22 15:54:24', '2025-03-22 21:02:31', 1, NULL, NULL);
INSERT INTO `question` VALUES (64, 'single_choice', '下面程序段的时间复杂度是（____________）。\nint x = 1;\nwhile (n >= x * x)\nx *= 2;', 1, 'A', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (65, 'single_choice', '下面不属于基本逻辑结构的是（____________）。', 1, 'D', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (66, 'single_choice', '对于链表和顺序表，下面哪种情况更适合用链表（____________）。', 1, 'B', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (67, 'single_choice', '若入栈序列为ABCD，不可能的出栈序列是（____________）。', 1, 'C', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (68, 'single_choice', '当队列为空时，下面说法正确的是（____________）。', 1, 'B', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (69, 'single_choice', '可以使用压缩存储的矩阵包括（____________）。', 1, 'D', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (70, 'single_choice', '下面数组中是用双亲表示法存储的一棵树，该树的高度为（____________）。\n', 1, 'C', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (71, 'single_choice', '下面哪个图的算法不能用于判断一个无向图是否连通？（____________）。', 1, 'B', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (72, 'single_choice', '下面哪个序列不可能是一趟快速排序之后的结果（    ）。', 1, 'A', NULL, '2025-04-16 21:01:10', '2025-05-04 23:24:38', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (73, 'single_choice', '下面排序算法中不稳定的是（    ）。\n\n\n', 1, 'D', NULL, '2025-04-16 21:01:10', '2025-05-04 23:24:36', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (74, 'fill_blank', '算法特性包括____、确定性、可行性、输入、输出。', 1, '有穷性', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (75, 'fill_blank', '设顺序表中有n个元素，删除表中第i个元素（1≤i≤n）需要移动____个元素', 1, 'n-i', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (76, 'fill_blank', '对后缀表达式23*7-64+*求值，当处理完+号时，栈中元素依次为____________，最后计算出表达式的值为____。', 1, '10，-1（或-1，10）、-10', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (77, 'fill_blank', '模式串T=”aaaba”的next数组内容为____。使用KMP算法，若主串S=”aabacbaaabaab”，在匹配成功时一共进行了____次字符比较。', 1, '01231、14', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (78, 'fill_blank', '已知一棵完全二叉树有126个叶结点，该完全二叉树的结点总数为____。', 1, '251（或252）', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (79, 'fill_blank', '哈希表的查找效率取决于3个因素：哈希函数、处理冲突的方法、____。', 1, '装填因子', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (80, 'fill_blank', '最小生成树算法有两种，分别为____算法和克鲁斯卡尔算法。', 1, '普利姆（或Prim）', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (81, 'fill_blank', '有序列12、33、25、7、19，用选择排序法，第二趟排序后的序列为____。\n\n\n', 1, '7，12，25，33，19', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (82, 'short_answer', '已知二叉树的先序遍历为BCDEAFG，中序遍历为DECFAGB，画出该二叉树，写出该树的后序遍历结果。\n\n\n\n\n\n\n', 1, '（树4分，后序结果2分）\n后序遍历结果：EDFGACB', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:02', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (83, 'short_answer', '有AVL树如下，依次插入52、53。\n\n\n对于插入后得到的树，树的高度为________。叶结点个数为________。结点52的兄弟是________。\n', 1, '（每空2分）\n树的高度为________4____。叶结点个数为________4____。结点52的兄弟是________8____。', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:07', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (84, 'short_answer', '已知有序序列3、8、15、17、22、31、35、40、43、59、62存在一维数组中。若采用折半查找，画出判定树，并计算查找成功时的ASL。\n\n\n\n', 1, '（判定树4分，ASL 2分）\n或\nASL=(1*1+2*2+3*4+4*4)/11=33/11=3', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:12', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (85, 'short_answer', '假设哈希表中已有如下元素。现将一组元素12、25、36、48、42、89依次插入空哈希表中，哈希函数为除留余数法，表大小TableSize为11，用开放地址法解决冲突，探测函数采用线性探测（di=1,2,3,...）。\n（1）插入后的结果填入下表。\n\n（2）计算查找成功时的ASL。\n\n\n', 1, '（哈希表4分，其中数字每错一个扣1分，扣完为止，ASL的计算2分）\n\nASL=(1+1+2+2+3+3+7+1)/8=20/8或5/2', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:18', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (86, 'short_answer', '有AOE图如下。\n\n\n顶点e的最早开始时间为____；顶点g的最早开始时间为____；\n顶点b的最晚完成时间为____；顶点d的最晚完成时间为____；\n边<a,c>的最多延迟时间为____；边<e,f>的最多延迟时间为____。\n\n', 1, '（每空1分）\n顶点e的最早开始时间为____22____；顶点g的最早开始时间为____46____；\n顶点b的最晚完成时间为____14____；顶点d的最晚完成时间为____27____；\n边<a,c>的最多延迟时间为____0____；边<e,f>的最多延迟时间为____14____。', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:34', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (87, 'short_answer', '对下图，用Floyd算法求最短路径，将会得到方阵序列D-1、D0、D1、D2。将最后得到的方阵D2的内容填入右边的表格中。\n____________\n\n', 1, '（每错一个扣1分，扣完为止）', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:39', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (88, 'short_answer', '有序列8、22、17、10、5、34、9、26，用建堆操作构建大顶堆（最大堆），然后删除二次，画出最后得到的堆。\n\n\n\n\n\n\n\n\n', 1, '（若不是完全二叉树得0分，若是，每错一个结点扣1分，扣完为止）', NULL, '2025-04-16 21:01:10', '2025-05-18 12:32:43', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (89, 'short_answer', '有整数序列24、13、9、64、37、86、32、41、72，使用希尔排序法对其排序，增量序列为7、3、1。写出第一、二趟排序后的结果。\n第一趟：________\n\n第二趟：________\n\n\n\n', 1, '（每趟3分）\n第一趟：24，13，9，64，37，86，32，41，72\n第二趟：24，13，9，32，37，72，64，41，86', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 6);
INSERT INTO `question` VALUES (90, 'code', '有带头结点单链表，已知其中结点非递减排列。编写函数Slim，删除链表中的重复结点，返回删除的结点个数。（7分）\n\n\n\n\n\n\n\n\n\n\n', 1, '（共7分，函数声明正确2分，函数体5分）\nint Slim(struct Node *L) {\nint n = 0;\nstruct Node *p, *q;\np = L->Next;\nwhile (p != NULL && p->Next != NULL)\nif (p->Data == p->Next->Data) {\nq = p->Next;\np->Next = q->Next;\nfree(q);\nn ++;\n} else\np = p->Next;\nreturn n;\n}', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (91, 'code', '函数Merge的功能为：合并两个顺序表L1和L2（合并时先复制L1的元素，再复制L2的元素），返回合并后的新表。填写下面程序中的空缺处。（8分，每空2分）\nstruct SqList *Merge(struct SqList *L1, struct SqList *L2) {\nstruct SqList *L3;\nint i, k = 0;\nL3 = ____;\nL3->MaxSize =  ____;\nL3->Data = malloc(sizeof(ElementType) * L3->MaxSize);\nL3->N = 0;\n\nfor (i = 0; i < L1->N; i ++)\nL3->Data[k ++] = L1->Data[i];\nfor (i = 0; i < L2->N; i ++)\nL3->Data[k ++] = L2->Data[i];\nL3->N =  ____;\nreturn  ____;\n}\n', 1, '（共8分，每空4分）\n(1)  L3 = ____malloc(sizeof(struct SqList))____;\n(2) L3->MaxSize =  ____L1->MaxSize+L2->MaxSize 或 L1->N + L2->N____;\n(3) L3->N =  ____L1->N+L2->N____;\n(4) return  ____L3____;', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (92, 'code', '对链式二叉树T，编写函数DestroyTree，删除树中所有结点，返回删除的结点个数。（7分）\n\n', 1, '（共7分，函数声明正确2分，函数体5分）\nint DestroyTree(struct TreeNode *T) {\nint n = 0;\nif (T == NULL)\nreturn 0;\nn += DestroyTree(T->Left);\nn += DestroyTree(T->Right);\nfree(T);\nreturn n + 1;\n}', NULL, '2025-04-16 21:01:10', '2025-05-16 21:17:34', 1, '来源章节: None', 0);
INSERT INTO `question` VALUES (94, 'fill_blank', '二叉树的前序遍历首先访问的是根节点，然后依次访问___和___', 3, '左子树 右子树', '二叉树的前序遍历顺序为：先访问根节点，再递归地访问左子树，最后递归地访问右子树。', '2025-04-27 23:44:40', '2025-05-03 23:08:44', 1, NULL, NULL);
INSERT INTO `question` VALUES (96, 'fill_blank', '对于循环队列而言，判断其为空或满的状态不能仅依靠front和rear两个指针是否相等来决定，必须额外设置一个标记量或牺牲一个存储单元，这是因为当front与rear均指向同一个位置时，既可能表示队列为空也可能意味着队列为___（3）___。', 3, '满', '在循环队列中，为了区分空队列与满队列这两种状态，通常采用的方法包括增加一个布尔型变量作为标志位，或者预留一个空间不使用，即所谓的“牺牲一个存储单元”。这样做可以避免仅凭front与rear相同无法区分的情况发生。', '2025-04-27 23:55:31', '2025-04-27 23:55:31', 1, NULL, NULL);
INSERT INTO `question` VALUES (97, 'fill_blank', '在一个队列中，若初始时为空，依次进行如下操作：入队5、入队10、出队、入队15，则此时队首元素为______，队尾元素为______。', 3, '5 15', '按照题目描述的操作顺序，首先将5和10依次加入队列，之后移除队首的5，最后再加入15。因此当前队首是10，而队尾则是最新加入的15。', '2025-04-27 23:55:35', '2025-05-04 23:24:24', 1, NULL, NULL);
INSERT INTO `question` VALUES (98, 'single_choice', '在顺序存储的线性表中，插入一个元素的时间复杂度为', 2, 'B', '在顺序存储的线性表中，插入一个元素需要移动其后的所有元素，因此时间复杂度为O(n)。\n\n#### 题目2', '2025-04-29 15:24:19', '2025-04-29 15:24:18', 1, NULL, NULL);
INSERT INTO `question` VALUES (99, 'single_choice', '对于链式存储的线性表，删除一个指定位置的元素时，需要先找到该位置的前驱节点，这个操作的时间复杂度是', 2, 'B', '在链式存储的线性表中，为了删除一个指定位置的元素，必须从头节点开始遍历到该位置的前驱节点，因此时间复杂度为O(n)。', '2025-04-29 15:24:20', '2025-04-29 15:24:20', 1, NULL, NULL);
INSERT INTO `question` VALUES (100, 'fill_blank', '在图的深度优先遍历过程中，如果从某个顶点出发，存在一条路径可以访问到该图中的所有顶点，则这个图是___。', 2, '连通图', '根据图的定义，若从某一个顶点出发能够通过边访问到图中所有其他顶点，则称这个图为连通图。对于有向图来说，如果任意两个顶点之间都存在相互可达的路径，则称为强连通图。\n\n#### 第2题', '2025-04-29 20:25:04', '2025-04-29 20:25:04', 1, NULL, NULL);
INSERT INTO `question` VALUES (101, 'code', '编写一个函数，实现顺序查找。该函数接收一个整数数组和一个目标值作为参数，返回目标值在数组中的索引；如果目标值不在数组中，则返回-1。', 1, '```c\nint sequentialSearch(int arr[], int n, int target) {\n    for (int i = 0; i < n; i++) {\n        if (arr[i] == target) {\n            return i;\n        }\n    }\n    return -1;\n}\n```', '顺序查找算法从数组的第一个元素开始逐个比较，直到找到目标值或遍历完整个数组。如果找到目标值则返回其索引，否则返回-1。', '2025-05-02 17:46:55', '2025-05-02 17:46:55', 1, NULL, NULL);
INSERT INTO `question` VALUES (102, 'code', '编写一个函数，实现折半查找（二分查找）。该函数接收一个已排序的整数数组和一个目标值作为参数，返回目标值在数组中的索引；如果目标值不在数组中，则返回-1。', 1, '```c\nint binarySearch(int arr[], int n, int target) {\n    int left = 0, right = n - 1;\n    while (left <= right) {\n        int mid = left + (right - left) / 2;\n        if (arr[mid] == target) {\n            return mid;\n        } else if (arr[mid] < target) {\n            left = mid + 1;\n        } else {\n            right = mid - 1;\n        }\n    }\n    return -1;\n}\n```', '折半查找算法通过将搜索范围逐步缩小一半来提高查找效率。每次比较中间元素与目标值，根据比较结果调整搜索范围，直到找到目标值或搜索范围为空。', '2025-05-02 17:46:56', '2025-05-02 17:46:56', 1, NULL, NULL);
INSERT INTO `question` VALUES (103, 'code', '编写一个函数，实现二叉查找树的插入操作。该函数接收一个指向根节点的指针和一个待插入的整数值，将该值插入到二叉查找树中的正确位置。', 1, '```c\n#include <stdio.h>\n#include <stdlib.h>\n\ntypedef struct TreeNode {\n    int data;\n    struct TreeNode *left, *right;\n} TreeNode;\n\nTreeNode* createNode(int data) {\n    TreeNode *newNode = (TreeNode *)malloc(sizeof(TreeNode));\n    newNode->data = data;\n    newNode->left = NULL;\n    newNode->right = NULL;\n    return newNode;\n}\n\nTreeNode* insertBST(TreeNode *root, int data) {\n    if (root == NULL) {\n        return createNode(data);\n    }\n    if (data < root->data) {\n        root->left = insertBST(root->left, data);\n    }', '', '2025-05-02 17:47:10', '2025-05-02 17:47:09', 1, NULL, NULL);
INSERT INTO `question` VALUES (104, 'single_choice', '在一个无向图中，所有顶点的度数之和等于所有边数的（     ）', 2, 'C', '设无向图中含有 n 个顶点 e 条边，则每个边都连接了两个顶点，因此每条边会被计算两次，所以所有顶点的度数之和是 2e。', '2025-05-03 23:29:43', '2025-05-03 23:29:43', 1, NULL, NULL);
INSERT INTO `question` VALUES (105, 'single_choice', '对于一个具有 n 个顶点的有向完全图，其边的数量为（     ）', 2, 'D', '在有向完全图中，任意两个不同的顶点之间都有两条方向相反的边相连。因此，从 n 个顶点中任选两个顶点构成一条有向边的方式共有 n(n-1) 种。', '2025-05-03 23:29:45', '2025-05-03 23:29:44', 1, NULL, NULL);
INSERT INTO `question` VALUES (106, 'single_choice', '在带权图的最短路径问题中，Dijkstra算法适用于哪种类型的权重？（     ）', 2, 'C', 'Dijkstra算法是一种求解单源最短路径的经典算法，但要求所有边的权重必须是非负的。如果存在负权重边，可能会导致算法无法正确计算最短路径。', '2025-05-03 23:29:45', '2025-05-03 23:29:45', 1, NULL, NULL);
INSERT INTO `question` VALUES (107, 'code', '编写一个函数，实现顺序查找算法。给定一个整数数组和一个目标值，返回目标值在数组中的索引。如果目标值不在数组中，则返回-1。', 2, '```c\nint sequentialSearch(int arr[], int n, int target) {\n    for (int i = 0; i < n; i++) {\n        if (arr[i] == target) {\n            return i;\n        }\n    }\n    return -1;\n}\n```', '该函数通过遍历数组，逐一比较每个元素与目标值，找到目标值后返回其索引，否则返回-1。', '2025-05-15 21:17:41', '2025-05-15 21:17:40', 1, NULL, NULL);
INSERT INTO `question` VALUES (108, 'code', '编写一个函数，实现二分查找算法。给定一个已排序的整数数组和一个目标值，返回目标值在数组中的索引。如果目标值不在数组中，则返回-1。', 2, '```c\nint binarySearch(int arr[], int n, int target) {\n    int left = 0, right = n - 1;\n    while (left <= right) {\n        int mid = left + (right - left) / 2;\n        if (arr[mid] == target) {\n            return mid;\n        } else if (arr[mid] < target) {\n            left = mid + 1;\n        } else {\n            right = mid - 1;\n        }\n    }\n    return -1;\n}\n```', '该函数通过不断缩小搜索范围来查找目标值。首先确定中间位置，然后根据目标值与中间值的比较结果调整搜索范围，直到找到目标值或搜索范围为空。', '2025-05-15 21:17:41', '2025-05-15 21:17:40', 1, NULL, NULL);
INSERT INTO `question` VALUES (109, 'code', '编写一个函数，实现二叉查找树（BST）的插入操作。给定一个二叉查找树的根节点指针和一个待插入的整数值，将该值插入到适当的位置。', 2, '```c\ntypedef struct TreeNode {\n    int val;\n    struct TreeNode *left, *right;\n} TreeNode;\n\nTreeNode* insertIntoBST(TreeNode* root, int val) {\n    if (root == NULL) {\n        TreeNode* newNode = (TreeNode*)malloc(sizeof(TreeNode));\n        newNode->val = val;\n        newNode->left = newNode->right = NULL;\n        return newNode;\n    }\n\n    if (val < root->val) {\n        root->left = insertIntoBST(root->left, val);\n    } else {\n        root->right = insertIntoBST(root->right, val);\n    }\n\n    return root;\n}\n```', '该函数递归地查找待插入值的正确位置，并创建新节点插入到二叉查找树中。如果当前节点为空，则创建新节点并返回；否则根据值大小决定插入左子树还是右子树。', '2025-05-15 21:17:41', '2025-05-15 21:17:40', 1, NULL, NULL);
INSERT INTO `question` VALUES (110, 'code', '编写一个函数，实现哈希表的线性探测法解决冲突。给定一个哈希表、一个键值对以及哈希表的大小，将键值对插入哈希表中。', 2, '```c\n#define TABLE_SIZE 10\n\ntypedef struct {\n    int key;\n    int value;\n} HashEntry;\n\nvoid insertHashTable(HashEntry table[], int key, int value, int size) {\n    int index = key % size;\n    int originalIndex = index;\n\n    while (table[index].key != -1 && table[index].key != key) {\n        index = (index + 1) % size;\n        if (index == originalIndex) {\n            printf(\"Table is full\\n\");\n            return;\n        }\n    }\n\n    table[index].key = key;\n    table[index].value = value;\n}\n\n// 初始化哈希表\nvoid initializeHashTable(HashEntry table[], int size) {\n    for (int i = 0; i < size; i++) {\n        table[i].key = -1;\n        table[i].value = -1;\n    }\n}\n```', '该函数使用线性探测法解决哈希冲突。首先计算初始索引，如果该位置已有其他键值对，则继续寻找下一个空闲位置，直到找到空闲位置或回到初始位置。如果哈希表已满，则输出提示信息。', '2025-05-15 21:17:41', '2025-05-15 21:17:40', 1, NULL, NULL);
INSERT INTO `question` VALUES (111, 'code', '编写一个函数，实现二叉查找树的删除操作。给定一个二叉查找树的根节点指针和一个待删除的整数值，删除该值对应的节点。', 2, '```c\nTreeNode* deleteNode(TreeNode* root, int key) {\n    if (root == NULL) return root;\n\n    if (key < root->val) {\n        root->left = deleteNode(root->left, key);\n    } else if (key > root->val) {\n        root->right = deleteNode(root->right, key);\n    } else {\n        if (root->left == NULL) {\n            TreeNode* temp = root->right;\n            free(root);\n            return temp;\n        } else if (root->right == NULL) {\n            TreeNode* temp = root->left;\n            free(root);\n            return temp;\n        }\n\n        TreeNode* temp = minValueNode(root->right);\n        root->val = temp->val;\n        root->right = deleteNode(root->right, temp->val);\n    }\n\n    return root;\n}\n\nTreeNode* minValueNode(TreeNode* node) {\n    TreeNode* current = node;\n    while (current && current->left != NULL)\n        current = current->left;\n    return current;\n}\n```', '该函数递归地查找待删除节点，并根据节点的子节点情况处理删除操作。如果节点没有左子节点，则直接用右子节点替代；如果节点没有右子节点，则直接用左子节点替代；如果节点有两个子节点，则找到右子树中的最小值节点替换当前节点，并删除最小值节点。', '2025-05-15 21:17:41', '2025-05-15 21:17:40', 1, NULL, NULL);
INSERT INTO `question` VALUES (112, 'short_answer', '栈和队列的主要区别是什么？', 1, '（1）**操作特性**：栈是后进先出（LIFO），而队列是先进先出（FIFO）。\n（2）**插入和删除位置**：栈的插入和删除都在栈顶进行；队列的插入在队尾，删除在队头进行。\n（3）**应用场景**：栈常用于函数调用、表达式求值等；队列常用于任务调度、消息传递等。', '栈和队列都是线性表，但它们的操作特性不同，适用于不同的场景。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (113, 'short_answer', '简述栈的基本操作及其时间复杂度。', 1, '（1）**push(入栈)**：将一个元素添加到栈顶，时间复杂度为O(1)。\n（2）**pop(出栈)**：移除并返回栈顶元素，时间复杂度为O(1)。\n（3）**top(获取栈顶元素)**：返回栈顶元素但不移除，时间复杂度为O(1)。\n（4）**empty(判断栈是否为空)**：检查栈是否为空，时间复杂度为O(1)。', '栈的基本操作都非常高效，时间复杂度均为O(1)。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (114, 'short_answer', '什么是循环队列？它有什么优点？', 1, '（1）**定义**：循环队列是一种特殊的队列结构，通过将队列的存储空间看作是一个环形空间来实现。\n（2）**优点**：\n- **避免假溢出**：当队列满时，新的元素可以插入到空闲的位置，避免了传统队列中由于数组越界导致的假溢出问题。\n- **提高空间利用率**：通过循环使用数组空间，提高了空间利用率。', '循环队列通过环形结构解决了传统队列的假溢出问题，提高了空间利用率。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (115, 'short_answer', '简述队列的基本操作及其时间复杂度。', 1, '（1）**enqueue(入队)**：将一个元素添加到队尾，时间复杂度为O(1)。\n（2）**dequeue(出队)**：移除并返回队头元素，时间复杂度为O(1)。\n（3）**front(获取队头元素)**：返回队头元素但不移除，时间复杂度为O(1)。\n（4）**rear(获取队尾元素)**：返回队尾元素但不移除，时间复杂度为O(1)。\n（5）**empty(判断队列是否为空)**：检查队列是否为空，时间复杂度为O(1)。', '队列的基本操作也非常高效，时间复杂度均为O(1)。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (116, 'short_answer', '如何利用栈实现十进制数转换为二进制数？', 1, '（1）**步骤**：\n- 将十进制数不断除以2，记录每次的余数。\n- 余数依次入栈。\n- 当商为0时，停止操作。\n- 从栈中依次弹出余数，即为二进制表示。', '利用栈的后进先出特性，可以方便地将十进制数转换为二进制数。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (117, 'short_answer', '简述递归算法与栈的关系。', 1, '（1）**关系**：递归算法在执行过程中会隐式地使用系统栈来保存每一层递归调用的参数和局部变量。\n（2）**作用**：系统栈用于管理递归调用的返回地址，确保递归调用结束后能够正确返回到上一层调用。', '递归算法本质上是通过系统栈来实现的，每层递归调用都会在栈中创建一个新的帧。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (118, 'short_answer', '如何利用队列实现广度优先搜索（BFS）算法？', 1, '（1）**步骤**：\n- 初始化一个队列，将起始节点入队。\n- 当队列不为空时，取出队头节点进行处理。\n- 将当前节点的所有未访问邻居节点入队。\n- 标记已访问的节点，防止重复访问。', '广度优先搜索（BFS）算法通过队列实现了逐层遍历图或树的节点。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (119, 'short_answer', '简述栈的顺序存储结构和链式存储结构的区别。', 1, '（1）**顺序存储结构**：\n- 使用数组实现，存储空间连续。\n- 插入和删除操作的时间复杂度为O(1)，但可能会出现空间不足的问题。\n（2）**链式存储结构**：\n- 使用链表实现，存储空间离散。\n- 插入和删除操作的时间复杂度为O(1)，但需要额外的空间来存储指针。', '栈的两种存储结构各有优缺点，选择时需根据具体需求进行权衡。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (120, 'short_answer', '简述队列的顺序存储结构和链式存储结构的区别。', 1, '（1）**顺序存储结构**：\n- 使用数组实现，存储空间连续。\n- 插入和删除操作的时间复杂度为O(1)，但可能会出现空间不足的问题。\n（2）**链式存储结构**：\n- 使用链表实现，存储空间离散。\n- 插入和删除操作的时间复杂度为O(1)，但需要额外的空间来存储指针。', '队列的两种存储结构各有优缺点，选择时需根据具体需求进行权衡。', '2025-05-15 21:22:21', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (121, 'short_answer', '什么是双端队列？它有哪些基本操作？', 1, '（1）**定义**：双端队列是一种允许在两端进行插入和删除操作的线性表。\n（2）**基本操作**：\n- **addFront(在前端插入)**：在队列的前端插入一个元素。\n- **addRear(在后端插入)**：在队列的后端插入一个元素。\n- **removeFront(从前端删除)**：从队列的前端移除并返回一个元素。\n- **removeRear(从后端删除)**：从队列的后端移除并返回一个元素。\n- **isEmpty(判断是否为空)**：检查双端队列是否为空。', '双端队列结合了栈和队列的特点，提供了更灵活的操作方式。', '2025-05-15 21:22:22', '2025-05-15 21:22:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (122, 'single_choice', '在无向图中，如果从顶点vi到vj存在路径，则称vi和vj是连通的。一个图中的所有顶点都两两连通，则该图称为（     ）', 2, 'A', '连通图是指图中任意两个顶点之间都存在路径。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (123, 'single_choice', '下列哪种算法可用于求解单源最短路径问题？（     ）', 2, 'C', '迪杰斯特拉算法用于求解单源最短路径问题。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (124, 'single_choice', '在图的深度优先搜索（DFS）过程中，每个顶点可能被访问的状态有几种？（     ）', 2, 'C', '在DFS过程中，每个顶点可能被访问的状态有三种：未被访问、正在访问和已访问。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (125, 'single_choice', '在图的广度优先搜索（BFS）过程中，使用的辅助数据结构是（     ）', 2, 'B', 'BFS使用队列来存储待访问的顶点。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (126, 'single_choice', '在无向图中，如果一条边连接了两个相同的顶点，则这条边称为（     ）', 2, 'A', '自环是指一条边连接了同一个顶点。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (127, 'single_choice', '对于有向图，如果存在一条从顶点vi到vj的路径，则称vi可达vj。如果vi可达vj且vj可达vi，则称vi和vj是（     ）', 2, 'A', '强连通是指在有向图中，两个顶点互相可达。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (128, 'single_choice', '以下哪种算法用于求解最小生成树问题？（     ）', 2, 'C', '普里姆算法用于求解最小生成树问题。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (129, 'single_choice', '在图的邻接矩阵表示法中，如果图中有n个顶点，则邻接矩阵的大小为（     ）', 2, 'C', '邻接矩阵是一个n×n的矩阵，其中n是顶点的数量。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (130, 'single_choice', '在图的邻接表表示法中，每个顶点有一个链表，链表中的每个节点表示（     ）', 2, 'B', '邻接表中的每个节点表示与当前顶点相连的边。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (131, 'single_choice', '在图的拓扑排序中，如果图中存在环，则（     ）', 2, 'B', '如果图中存在环，则无法进行拓扑排序。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (132, 'fill_blank', '在图的邻接矩阵表示法中，如果矩阵中的元素为0，则表示这两个顶点之间______。', 2, '没有边', '邻接矩阵中的0表示两个顶点之间没有边。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (133, 'fill_blank', '在图的遍历算法中，常用的两种遍历方法是______和______。', 2, '深度优先搜索（DFS），广度优先搜索（BFS）', '图的遍历常用的方法是DFS和BFS。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (134, 'fill_blank', '在图的邻接表表示法中，每个顶点的链表中的节点表示该顶点的______。', 2, '邻接顶点', '邻接表中的每个节点表示与当前顶点相邻的顶点。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (135, 'fill_blank', '在有向图中，如果从顶点vi到vj存在路径，则称vi______vj。', 2, '可达', '在有向图中，如果从顶点vi到vj存在路径，则称vi可达vj。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (136, 'fill_blank', '在无向图中，如果一个顶点的度为奇数，则这个顶点称为______。', 2, '奇度顶点', '无向图中，度为奇数的顶点称为奇度顶点。', '2025-05-15 21:32:42', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (137, 'fill_blank', '在图的深度优先搜索（DFS）过程中，每个顶点可能被访问的状态有______种。', 2, '3', '在DFS过程中，每个顶点可能被访问的状态有三种：未被访问、正在访问和已访问。', '2025-05-15 21:32:43', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (138, 'fill_blank', '在图的广度优先搜索（BFS）过程中，使用的辅助数据结构是______。', 2, '队列', 'BFS使用队列来存储待访问的顶点。', '2025-05-15 21:32:43', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (139, 'fill_blank', '在图的邻接矩阵表示法中，如果图中有n个顶点，则邻接矩阵的大小为______。', 2, 'n^2', '邻接矩阵是一个n×n的矩阵，其中n是顶点的数量。', '2025-05-15 21:32:43', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (140, 'fill_blank', '在图的邻接表表示法中，每个顶点的链表中的节点表示该顶点的______。', 2, '邻接顶点', '邻接表中的每个节点表示与当前顶点相邻的顶点。', '2025-05-15 21:32:43', '2025-05-15 21:32:42', 1, NULL, NULL);
INSERT INTO `question` VALUES (141, 'single_choice', '在KMP算法中，next[j]表示模式串T的前j个字符组成的子串的最长相同真前后缀的长度。对于模式串T=\"ababc\"，计算next[4]的值是         （     ）', 2, 'C', '对于模式串T=\"ababc\"，前4个字符组成的子串为\"abab\"，其最长相同真前后缀为\"ab\"，长度为2。', '2025-05-15 22:50:38', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (142, 'single_choice', '二维数组A[0..9, 0..9]采用行优先存储方式，每个元素占4个字节，已知A[0][0]的地址为1000，则A[5][6]的地址是         （     ）', 2, 'B', '二维数组A[0..9, 0..9]共有10*10=100个元素，每个元素占4个字节，A[5][6]的地址计算公式为1000 + (5*10 + 6)*4 = 1128。', '2025-05-15 22:50:38', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (143, 'single_choice', '设S是一个字符串，若S为空串，则S的长度为         （     ）', 2, 'A', '空串是指不包含任何字符的串，其长度为0。', '2025-05-15 22:50:38', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (144, 'single_choice', '下列关于广义表的说法正确的是         （     ）', 2, 'A', '广义表中的元素可以是单个原子或另一个广义表，广义表可以是递归定义的，并且广义表是一种非线性结构。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (145, 'single_choice', '在一个二维数组A[m][n]中，假设A[0][0]位于内存地址1000，每个元素占用4个字节，采用列优先存储方式，那么A[3][2]的地址是         （     ）', 2, 'C', '二维数组A[m][n]采用列优先存储方式，A[3][2]的地址计算公式为1000 + (2*m + 3)*4 = 1032。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (146, 'single_choice', '设有一个字符串S=\"abcd\"，执行S=S+\"e\"后，S的长度为         （     ）', 2, 'B', '字符串S=\"abcd\"，执行S=S+\"e\"后，S变为\"abcde\"，长度为5。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (147, 'single_choice', '对于字符串S=\"hello world\"，执行S.substring(3, 7)后得到的子串是         （     ）', 2, 'A', 'substring(3, 7)表示从索引3开始到索引7（不包括7）的子串，即\"lo w\"。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (148, 'single_choice', '以下哪种数据结构不适合用于实现字符串的操作？         （     ）', 2, 'D', '栈是一种后进先出的数据结构，不适合用于实现字符串的操作。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (149, 'single_choice', '对于一个二维数组A[0..m-1, 0..n-1]，若按行优先存储，则A[i][j]的地址为         （     ）', 2, 'A', '按行优先存储时，A[i][j]的地址计算公式为A[0][0] + (i*n + j)*4。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (150, 'single_choice', '以下关于KMP算法的描述，正确的是         （     ）', 2, 'C', 'KMP算法利用了模式串的部分匹配信息，避免了不必要的回溯，时间复杂度为O(n+m)。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (151, 'single_choice', '以下哪个选项不是字符串的基本操作？         （     ）', 2, 'D', '排序不是字符串的基本操作，基本操作包括拼接、查找、插入等。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (152, 'single_choice', '对于一个广义表L=((a,b),(c,d))，其深度为         （     ）', 2, 'B', '广义表L=((a,b),(c,d))的深度为2，因为它有两层嵌套。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (153, 'code', '编写一个函数，判断两个字符串是否相等。', 2, '```c\n#include <stdio.h>\n#include <string.h>\n\nint string_equal(char *str1, char *str2) {\n    return strcmp(str1, str2) == 0;\n}\n\nint main() {\n    char str1[] = \"hello\";\n    char str2[] = \"world\";\n    if (string_equal(str1, str2)) {\n        printf(\"Strings are equal\\n\");\n    } else {\n        printf(\"Strings are not equal\\n\");\n    }\n    return 0;\n}\n```', '使用`strcmp`函数比较两个字符串，如果返回值为0则表示两个字符串相等。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (154, 'code', '编写一个函数，将一个字符串的所有小写字母转换为大写字母。', 2, '```c\n#include <stdio.h>\n#include <ctype.h>\n#include <string.h>\n\nvoid to_upper(char *str) {\n    for (int i = 0; i < strlen(str); i++) {\n        str[i] = toupper(str[i]);\n    }\n}\n\nint main() {\n    char str[] = \"hello world\";\n    to_upper(str);\n    printf(\"%s\\n\", str);\n    return 0;\n}\n```', '使用`toupper`函数将字符串中的每个小写字母转换为大写字母。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (155, 'code', '编写一个函数，实现二维数组的转置。', 2, '```c\n#include <stdio.h>\n\n#define ROWS 3\n#define COLS 4\n\nvoid transpose(int a[ROWS][COLS], int b[COLS][ROWS]) {\n    for (int i = 0; i < ROWS; i++) {\n        for (int j = 0; j < COLS; j++) {\n            b[j][i] = a[i][j];\n        }\n    }\n}\n\nint main() {\n    int a[ROWS][COLS] = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}};\n    int b[COLS][ROWS];\n\n    transpose(a, b);\n\n    for (int i = 0; i < COLS; i++) {\n        for (int j = 0; j < ROWS; j++) {\n            printf(\"%d \", b[i][j]);\n        }\n        printf(\"\\n\");\n    }\n\n    return 0;\n}\n```', '通过双重循环将原数组的行和列互换，实现二维数组的转置。', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (156, 'code', '编写一个函数，实现字符串的逆序输出。', 2, '```c\n#include <stdio.h>\n#include <string.h>\n\nvoid reverse_string(char *str) {\n    int len = strlen(str);\n    for (int i = 0; i < len / 2; i++) {\n        char temp = str[i];\n        str[i] = str[len - i - 1];\n        str[len - i - 1] = temp;\n    }\n}\n\nint main() {\n    char str[] = \"hello', '', '2025-05-15 22:50:39', '2025-05-15 22:50:38', 1, NULL, NULL);
INSERT INTO `question` VALUES (157, 'single_choice', '在直接插入排序过程中，假设当前处理的元素需要向前比较并移动，则该操作的目的是什么？（     ）', 1, 'A', '直接插入排序的核心思想是将未排序部分的第一个元素插入到已排序部分的适当位置。因此，该操作的目的是将当前元素放到正确的位置。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (158, 'single_choice', '以下哪种排序算法在最坏的情况下时间复杂度为O(n^2)？（     ）', 1, 'D', '冒泡排序在最坏的情况下（即初始序列逆序）时间复杂度为O(n^2)。快速排序、归并排序和堆排序在最坏情况下的时间复杂度分别为O(n^2)、O(n log n)和O(n log n)。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (159, 'fill_blank', '在直接插入排序中，每次从无序区取出第一个元素，把它插入到有序区的___。', 1, '适当位置', '直接插入排序的基本思想是从无序区取出一个元素，将其插入到有序区的适当位置。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (160, 'fill_blank', '冒泡排序的基本思想是通过不断交换相邻两个记录来实现排序，每一轮将最大的记录移动到___。', 1, '末尾', '冒泡排序通过多次遍历数组，每次将最大的元素“冒泡”到数组的末尾。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (161, 'fill_blank', '在简单选择排序中，每次从未排序的部分选出最小的元素，然后与未排序部分的___进行交换。', 1, '第一个元素', '简单选择排序通过每次从未排序部分选出最小的元素，然后与未排序部分的第一个元素进行交换。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (162, 'fill_blank', '归并排序的基本思想是将待排序序列分成若干个子序列，使每个子序列有序，然后再将这些子序列___。', 1, '合并成一个有序序列', '归并排序通过分治法将待排序序列分成若干个子序列，每个子序列有序后，再将这些子序列合并成一个有序序列。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (163, 'fill_blank', '希尔排序是插入排序的一种改进版本，其基本思想是将整个待排序序列分割成若干个子序列，分别进行___排序。', 1, '直接插入', '希尔排序通过将整个待排序序列分割成若干个子序列，分别进行直接插入排序，从而提高排序效率。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (164, 'fill_blank', '在快速排序中，每次划分操作将待排序的记录分成两部分，一部分记录的关键字均小于另一部分记录的关键字，这种操作称为___。', 1, '划分', '快速排序通过划分操作将待排序的记录分成两部分，一部分记录的关键字均小于另一部分记录的关键字。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (165, 'fill_blank', '堆排序是一种基于完全二叉树的排序方法，它首先将待排序序列构造成一个大顶堆或小顶堆，然后将堆顶元素与堆底元素交换，再重新调整堆，直到所有的元素都排好序。这种重新调整堆的过程称为___。', 1, '堆化', '堆排序通过堆化过程将待排序序列构造成一个大顶堆或小顶堆，然后逐步调整堆，直到所有元素都排好序。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (166, 'fill_blank', '在排序算法中，有一种算法是通过不断地选取最小（或最大）的元素并将其放在已排序序列的末尾，这种算法称为___。', 1, '选择排序', '选择排序通过不断地选取最小（或最大）的元素并将其放在已排序序列的末尾，从而完成排序。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (167, 'fill_blank', '在排序算法中，有一种算法是通过不断地比较相邻的元素并交换它们的位置，以达到排序的目的，这种算法称为___。', 1, '冒泡排序', '冒泡排序通过不断地比较相邻的元素并交换它们的位置，从而使较大的元素逐渐“冒泡”到数组的末尾。', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (168, 'short_answer', '简述数据结构的定义及其研究的主要内容。', 1, '（1）**定义**：数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。数据结构主要研究数据的逻辑结构、存储结构以及数据的运算。\n（2）**主要内容**：\n- **逻辑结构**：描述数据元素之间的逻辑关系，常见的有线性结构（如线性表、栈、队列）、非线性结构（如树、图）。\n- **存储结构**：描述数据元素在计算机中的存储方式，常见的有顺序存储结构和链式存储结构。\n- **运算**：对数据结构进行的操作，如查找、插入、删除等。', '', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (169, 'short_answer', '简述算法的定义及其评价标准。', 1, '（1）**定义**：算法是一组明确的规则，用于解决特定问题或执行特定任务的有限步骤。\n（2）**评价标准**：\n- **正确性**：算法必须能够正确地解决问题。\n- **可读性**：算法应当易于理解和阅读。\n- **健壮性**：算法应能处理各种边界条件和异常输入。\n- **时间复杂度**：算法运行所需的时间量。\n- **空间复杂度**：算法运行所需的存储空间量。', '', '2025-05-15 22:58:22', '2025-05-15 22:58:21', 1, NULL, NULL);
INSERT INTO `question` VALUES (170, 'single_choice', '在数据结构中，下列哪种结构可以实现高效的随机访问但插入和删除操作效率较低？（     ）', 3, 'C', '顺序表支持高效的随机访问，但插入和删除操作需要移动大量元素，因此效率较低。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (171, 'single_choice', '以下哪一项不是数据结构的基本操作？（     ）', 3, 'C', '排序是算法的一种，而不是数据结构的基本操作。基本操作包括插入、删除和搜索等。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (172, 'single_choice', '在数据结构的存储方式中，哪种存储方式会导致内存碎片问题？（     ）', 3, 'C', '连续分配会导致内存碎片问题，因为频繁的插入和删除操作会使内存变得不连续。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (173, 'single_choice', '以下哪种数据结构最适合表示具有多对多关系的数据？（     ）', 3, 'C', '图是一种非线性数据结构，非常适合表示多对多的关系。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (174, 'single_choice', '在数据结构中，哪种方法可以用来提高查找效率？（     ）', 3, 'B', '哈希表通过哈希函数将关键字映射到数组索引，可以在常数时间内完成查找操作，从而提高查找效率。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (175, 'short_answer', '简述顺序表和链表的主要区别，并讨论它们各自的优缺点。', 3, '（1）**存储方式**：顺序表使用连续的存储空间，而链表使用离散的存储空间。\n（2）**插入和删除效率**：顺序表的插入和删除操作需要移动大量元素，时间复杂度为O(n)；链表的插入和删除操作只需修改指针，时间复杂度为O(1)。\n（3）**访问效率**：顺序表支持随机访问，时间复杂度为O(1)；链表只能顺序访问，时间复杂度为O(n)。\n（4）**内存利用率**：顺序表容易产生内存碎片，链表不会产生内存碎片。\n（5）**动态性**：链表可以动态调整大小，而顺序表需要预先分配固定大小的空间。', '', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (176, 'short_answer', '描述线性表的两种基本存储结构，并说明它们各自的适用场景。', 3, '（1）**顺序表**：适用于频繁进行随机访问操作且不需要频繁插入和删除的场景。\n（2）**链表**：适用于频繁进行插入和删除操作且不需要频繁随机访问的场景。', '', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (177, 'short_answer', '简述线性表的抽象数据类型定义，并给出几个常见的线性表操作。', 3, '（1）**抽象数据类型定义**：线性表是一个有限序列，其中每个元素都有一个前驱和后继（首尾元素除外）。\n（2）**常见操作**：\n- 初始化线性表\n- 判断线性表是否为空\n- 获取线性表的长度\n- 查找特定元素\n- 插入元素\n- 删除元素\n- 清空线性表', '', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (178, 'short_answer', '解释线性表的逆置操作，并给出其实现方法。', 3, '（1）**逆置操作**：将线性表中的元素顺序颠倒。\n（2）**实现方法**：\n- **顺序表**：使用两个指针分别指向首尾，交换元素，逐步向中间靠拢。\n- **链表**：使用三个指针prev、current和next，逐个节点反转指针方向。', '', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (179, 'short_answer', '讨论线性表在实际应用中的几种常见用法，并举例说明。', 3, '（1）**数据库记录**：每个记录可以看作线性表的一个元素，用于存储用户信息、订单信息等。\n（2）**文件系统**：文件目录可以看作线性表，每个目录项是一个元素。\n（3）**日志记录**：日志文件中的每条日志记录可以看作线性表的一个元素。\n（4）**队列管理**：如打印任务队列，每个打印任务可以看作线性表的一个元素。', '', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (180, 'code', '编写一个函数，实现二叉树的先序遍历。', 3, '```c\nvoid PreOrder(BiTree T) {\n    if (T != NULL) {\n        printf(\"%d \", T->data);\n        PreOrder(T->lchild);\n        PreOrder(T->rchild);\n    }\n}\n```', '先序遍历的顺序是根节点 -> 左子树 -> 右子树。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (181, 'code', '编写一个函数，实现二叉树的中序遍历。', 3, '```c\nvoid InOrder(BiTree T) {\n    if (T != NULL) {\n        InOrder(T->lchild);\n        printf(\"%d \", T->data);\n        InOrder(T->rchild);\n    }\n}\n```', '中序遍历的顺序是左子树 -> 根节点 -> 右子树。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (182, 'code', '编写一个函数，实现二叉树的后序遍历。', 3, '```c\nvoid PostOrder(BiTree T) {\n    if (T != NULL) {\n        PostOrder(T->lchild);\n        PostOrder(T->rchild);\n        printf(\"%d \", T->data);\n    }\n}\n```', '后序遍历的顺序是左子树 -> 右子树 -> 根节点。', '2025-05-15 23:01:00', '2025-05-15 23:00:59', 1, NULL, NULL);
INSERT INTO `question` VALUES (183, 'code', '编写一个函数，计算二叉树的高度。', 3, '```c\nint TreeHeight(BiTree T) {\n    if (T == NULL) {\n        return 0;\n    } else {\n        int leftHeight = TreeHeight(T->lchild);\n        int rightHeight = TreeHeight(T->rchild);\n        return (leftHeight > rightHeight) ? (leftHeight + 1) : (rightHeight + 1);\n    }\n}\n```', '二叉树的高度等于其左右子树高度的最大值加1。', '2025-05-15 23:01:00', '2025-05-15 23:01:00', 1, NULL, NULL);
INSERT INTO `question` VALUES (184, 'code', '编写一个函数，判断两棵二叉树是否相同。', 3, '```c\nint IsSameTree(BiTree T1, BiTree T2) {\n    if (T1 == NULL && T2 == NULL) {\n        return 1;\n    } else if (T1 == NULL || T2 == NULL) {\n        return 0;\n    } else {\n        return (T1->data == T2->data) && IsSameTree(T1->lchild, T2->lchild) && IsSameTree(T1->rchild, T2->rchild);\n    }\n}\n```', '两棵二叉树相同的条件是它们的根节点值相等且左右子树也分别相同。', '2025-05-15 23:01:00', '2025-05-15 23:01:00', 1, NULL, NULL);
INSERT INTO `question` VALUES (185, 'single_choice', '在一棵二叉树中，若某结点没有左子树，则该结点的中序遍历前驱是         （     ）', 1, 'A', '在中序遍历中，如果一个结点没有左子树，那么它的前驱就是它的父结点。', '2025-05-16 20:49:18', '2025-05-16 20:49:18', 1, NULL, NULL);
INSERT INTO `question` VALUES (186, 'single_choice', '下列哪一项不是完全二叉树的特点？          （     ）', 1, 'A', '完全二叉树的定义是：除了最后一层外，其他各层的结点数都达到最大值；最后一层的结点集中在该层的最左边。选项A描述的是满二叉树的特点。', '2025-05-16 20:49:18', '2025-05-16 20:49:18', 1, NULL, NULL);
INSERT INTO `question` VALUES (187, 'single_choice', '二叉树的前序遍历序列与中序遍历序列相同的情况是         （     ）', 1, 'A', '当二叉树为空或所有结点都没有左子树时，前序遍历和中序遍历的结果会相同。因为前序遍历首先访问根结点，然后访问左子树，最后访问右子树；而中序遍历则先访问左子树，再访问根结点，最后访问右子树。如果没有左子树，那么根结点和右子树的访问顺序就一致了。', '2025-05-16 20:49:18', '2025-05-16 20:49:18', 1, NULL, NULL);
INSERT INTO `question` VALUES (188, 'single_choice', '对于一棵具有n个结点、度为4的树来说，树的高度至多是         （     ）', 1, 'A', '对于一棵具有n个结点、度为4的树来说，树的高度至多是n-3。这是因为高度为h的树至少有4^(h-1)个结点，通过计算可以得出高度至多为n-3。', '2025-05-16 20:49:18', '2025-05-16 20:49:18', 1, NULL, NULL);
INSERT INTO `question` VALUES (189, 'single_choice', '二叉树的层次遍历算法最适合使用哪种数据结构来实现？         （     ）', 1, 'B', '二叉树的层次遍历（广度优先遍历）需要按层次依次访问每个结点，因此适合使用队列这种先进先出的数据结构来实现。', '2025-05-16 20:49:18', '2025-05-16 20:49:18', 1, NULL, NULL);
INSERT INTO `question` VALUES (190, 'single_choice', '下面哪个序列不可能是一趟快速排序之后的结果（____________）。', 1, 'A', NULL, '2025-05-16 20:58:03', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (191, 'single_choice', '下面排序算法中不稳定的是（____________）。\n\n\n', 1, 'D', NULL, '2025-05-16 20:58:03', '2025-05-16 21:17:34', 1, '来源章节: None', 2);
INSERT INTO `question` VALUES (192, 'fill_blank', '在顺序表中进行查找，若每个元素的查找概率相同，则平均查找长度为___。', 1, '(n+1)/2', '顺序表的平均查找长度计算公式为 (1 + 2 + ... + n) / n = (n+1)/2。', '2025-05-16 21:23:04', '2025-05-16 21:23:04', 1, NULL, NULL);
INSERT INTO `question` VALUES (193, 'fill_blank', '二分查找算法要求线性表必须是___存储的有序表。', 1, '顺序', '二分查找需要快速访问中间元素，因此要求线性表必须是顺序存储的有序表。', '2025-05-16 21:23:04', '2025-05-16 21:23:04', 1, NULL, NULL);
INSERT INTO `question` VALUES (194, 'fill_blank', '哈希函数的目的是将关键字转换成存储地址，这个过程称为___。', 1, '哈希', '哈希函数通过一定的映射规则将关键字转换成存储地址，这个过程称为哈希。', '2025-05-16 21:23:04', '2025-05-16 21:23:04', 1, NULL, NULL);
INSERT INTO `question` VALUES (195, 'fill_blank', '在散列表中解决冲突的方法有开放定址法和___两种基本方法。', 1, '链地址法', '散列表中解决冲突的两种基本方法是开放定址法和链地址法。开放定址法包括线性探测、二次探测等，而链地址法则是将冲突的元素链接成一个链表。', '2025-05-16 21:23:04', '2025-05-16 21:23:04', 1, NULL, NULL);
INSERT INTO `question` VALUES (196, 'single_choice', '测试', 2, 'A', '无', '2025-05-17 19:04:10', '2025-05-17 19:04:09', 1, NULL, NULL);
INSERT INTO `question` VALUES (197, 'single_choice', '在使用栈结构解决括号匹配问题时，如果遇到左括号应执行的操作是         （     ）', 2, 'C', '当遇到左括号时，正确的做法是将其压入栈中以备后续与右括号进行配对。因此，正确答案选C。', '2025-05-23 14:46:18', '2025-05-23 14:46:17', 1, NULL, NULL);

-- ----------------------------
-- Table structure for question_image
-- ----------------------------
DROP TABLE IF EXISTS `question_image`;
CREATE TABLE `question_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint NOT NULL COMMENT '关联题目ID',
  `image_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片路径或URL',
  `type` int NULL DEFAULT NULL COMMENT '1-对应题目，0-对应答案',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_qi_question_id`(`question_id` ASC) USING BTREE,
  CONSTRAINT `fk_qi_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_image
-- ----------------------------
INSERT INTO `question_image` VALUES (51, 70, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q7_fbd7b27ba9eaa947c3b2f67db9d7616be61baf5e803869df332b43323a987387.png', 1);
INSERT INTO `question_image` VALUES (66, 3, 'http://localhost:8080/profile/upload/2025/04/07/96145490_p0_20250407151243A001.jpg', NULL);
INSERT INTO `question_image` VALUES (67, 3, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/upload/1747401386907_uqaqhuvavt0.jpg', NULL);
INSERT INTO `question_image` VALUES (68, 82, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q19_7f5ffc1d892a47c86968e8ea7e88e5870eb11ba0b6af214b366f91ae52fb2aeb.png', 0);
INSERT INTO `question_image` VALUES (69, 83, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q2_caca1e9700a117382a4e5a079dcf7d11e5694d1f4bf8d0493e12694a2556a9c5.png', 1);
INSERT INTO `question_image` VALUES (70, 84, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q21_5ef26575398be3099eebed2889db0477ee5ccb52595b38739a37ae43d721e9e9.png', 0);
INSERT INTO `question_image` VALUES (71, 84, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q21_fca0daf2876669ca09a5e2c6514043d0127a8d9b28abbf3c4d630bbdda2324eb.png', 0);
INSERT INTO `question_image` VALUES (72, 85, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q4_7a246cdb40f5b53011d3f800ed5ff4e6d0ff43603e3f465e9eb66c81481af688.png', 1);
INSERT INTO `question_image` VALUES (73, 85, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q22_fb3304c473ed00d00f7353f5d8d36251dd5fbdb91583e34c0589248e2ff63890.png', 0);
INSERT INTO `question_image` VALUES (74, 86, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q5_9d0e46ca9c78cb82b33da2059f0aa437cbea38e6798b39146566ccd187b0899d.png', 1);
INSERT INTO `question_image` VALUES (75, 87, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q6_8436626b809241fba4062c8d573e607742f841280644e0509dadcbf958768a61.png', 1);
INSERT INTO `question_image` VALUES (76, 87, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q6_38f82e5b293eb0ddd881106ffcc778876e83f6aa2f103bd775ec9e37a598f392.png', 1);
INSERT INTO `question_image` VALUES (77, 87, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q24_17657c6d4233a4e9ab1f300adb7243973d7489d037257cb415da26d38a2ed547.png', 0);
INSERT INTO `question_image` VALUES (78, 88, 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q25_aecb701ab920d55cc298926ad33d869704c67b186ad664d3b7a386a0470b7c91.png', 0);

-- ----------------------------
-- Table structure for question_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `question_knowledge`;
CREATE TABLE `question_knowledge`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question_id` bigint NOT NULL,
  `kp_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_qk_question_id`(`question_id` ASC) USING BTREE,
  INDEX `fk_qk_kp_id`(`kp_id` ASC) USING BTREE,
  CONSTRAINT `fk_qk_kp_id` FOREIGN KEY (`kp_id`) REFERENCES `knowledge_point` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_qk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_knowledge
-- ----------------------------
INSERT INTO `question_knowledge` VALUES (20, 64, 1);
INSERT INTO `question_knowledge` VALUES (21, 96, 4);
INSERT INTO `question_knowledge` VALUES (22, 97, 4);
INSERT INTO `question_knowledge` VALUES (23, 98, 3);
INSERT INTO `question_knowledge` VALUES (24, 99, 3);
INSERT INTO `question_knowledge` VALUES (25, 100, 7);
INSERT INTO `question_knowledge` VALUES (26, 101, 8);
INSERT INTO `question_knowledge` VALUES (27, 102, 8);
INSERT INTO `question_knowledge` VALUES (28, 103, 8);
INSERT INTO `question_knowledge` VALUES (29, 94, 6);
INSERT INTO `question_knowledge` VALUES (30, 104, 7);
INSERT INTO `question_knowledge` VALUES (31, 105, 7);
INSERT INTO `question_knowledge` VALUES (32, 106, 7);
INSERT INTO `question_knowledge` VALUES (33, 107, 8);
INSERT INTO `question_knowledge` VALUES (34, 108, 8);
INSERT INTO `question_knowledge` VALUES (35, 109, 8);
INSERT INTO `question_knowledge` VALUES (36, 110, 8);
INSERT INTO `question_knowledge` VALUES (37, 111, 8);
INSERT INTO `question_knowledge` VALUES (38, 112, 4);
INSERT INTO `question_knowledge` VALUES (39, 113, 4);
INSERT INTO `question_knowledge` VALUES (40, 114, 4);
INSERT INTO `question_knowledge` VALUES (41, 115, 4);
INSERT INTO `question_knowledge` VALUES (42, 116, 4);
INSERT INTO `question_knowledge` VALUES (43, 117, 4);
INSERT INTO `question_knowledge` VALUES (44, 118, 4);
INSERT INTO `question_knowledge` VALUES (45, 119, 4);
INSERT INTO `question_knowledge` VALUES (46, 120, 4);
INSERT INTO `question_knowledge` VALUES (47, 121, 4);
INSERT INTO `question_knowledge` VALUES (48, 122, 7);
INSERT INTO `question_knowledge` VALUES (49, 123, 7);
INSERT INTO `question_knowledge` VALUES (50, 124, 7);
INSERT INTO `question_knowledge` VALUES (51, 125, 7);
INSERT INTO `question_knowledge` VALUES (52, 126, 7);
INSERT INTO `question_knowledge` VALUES (53, 127, 7);
INSERT INTO `question_knowledge` VALUES (54, 128, 7);
INSERT INTO `question_knowledge` VALUES (55, 129, 7);
INSERT INTO `question_knowledge` VALUES (56, 130, 7);
INSERT INTO `question_knowledge` VALUES (57, 131, 7);
INSERT INTO `question_knowledge` VALUES (58, 141, 10);
INSERT INTO `question_knowledge` VALUES (59, 142, 10);
INSERT INTO `question_knowledge` VALUES (60, 143, 10);
INSERT INTO `question_knowledge` VALUES (61, 144, 10);
INSERT INTO `question_knowledge` VALUES (62, 145, 10);
INSERT INTO `question_knowledge` VALUES (63, 146, 10);
INSERT INTO `question_knowledge` VALUES (64, 147, 10);
INSERT INTO `question_knowledge` VALUES (65, 148, 10);
INSERT INTO `question_knowledge` VALUES (66, 149, 10);
INSERT INTO `question_knowledge` VALUES (67, 150, 10);
INSERT INTO `question_knowledge` VALUES (68, 151, 10);
INSERT INTO `question_knowledge` VALUES (69, 152, 10);
INSERT INTO `question_knowledge` VALUES (70, 153, 10);
INSERT INTO `question_knowledge` VALUES (71, 154, 10);
INSERT INTO `question_knowledge` VALUES (72, 155, 10);
INSERT INTO `question_knowledge` VALUES (73, 156, 10);
INSERT INTO `question_knowledge` VALUES (74, 157, 9);
INSERT INTO `question_knowledge` VALUES (75, 158, 9);
INSERT INTO `question_knowledge` VALUES (76, 159, 9);
INSERT INTO `question_knowledge` VALUES (77, 160, 9);
INSERT INTO `question_knowledge` VALUES (78, 161, 9);
INSERT INTO `question_knowledge` VALUES (79, 162, 9);
INSERT INTO `question_knowledge` VALUES (80, 163, 9);
INSERT INTO `question_knowledge` VALUES (81, 164, 9);
INSERT INTO `question_knowledge` VALUES (82, 165, 9);
INSERT INTO `question_knowledge` VALUES (83, 166, 9);
INSERT INTO `question_knowledge` VALUES (84, 167, 9);
INSERT INTO `question_knowledge` VALUES (85, 168, 1);
INSERT INTO `question_knowledge` VALUES (86, 169, 1);
INSERT INTO `question_knowledge` VALUES (87, 170, 1);
INSERT INTO `question_knowledge` VALUES (88, 171, 1);
INSERT INTO `question_knowledge` VALUES (89, 172, 1);
INSERT INTO `question_knowledge` VALUES (90, 173, 1);
INSERT INTO `question_knowledge` VALUES (91, 174, 1);
INSERT INTO `question_knowledge` VALUES (92, 175, 3);
INSERT INTO `question_knowledge` VALUES (93, 176, 3);
INSERT INTO `question_knowledge` VALUES (94, 177, 3);
INSERT INTO `question_knowledge` VALUES (95, 178, 3);
INSERT INTO `question_knowledge` VALUES (96, 179, 3);
INSERT INTO `question_knowledge` VALUES (97, 180, 6);
INSERT INTO `question_knowledge` VALUES (98, 181, 6);
INSERT INTO `question_knowledge` VALUES (99, 182, 6);
INSERT INTO `question_knowledge` VALUES (100, 183, 6);
INSERT INTO `question_knowledge` VALUES (101, 184, 6);
INSERT INTO `question_knowledge` VALUES (102, 185, 6);
INSERT INTO `question_knowledge` VALUES (103, 186, 6);
INSERT INTO `question_knowledge` VALUES (104, 187, 6);
INSERT INTO `question_knowledge` VALUES (105, 188, 6);
INSERT INTO `question_knowledge` VALUES (106, 189, 6);
INSERT INTO `question_knowledge` VALUES (113, 3, 3);
INSERT INTO `question_knowledge` VALUES (114, 66, 4);
INSERT INTO `question_knowledge` VALUES (115, 192, 8);
INSERT INTO `question_knowledge` VALUES (116, 193, 8);
INSERT INTO `question_knowledge` VALUES (117, 194, 8);
INSERT INTO `question_knowledge` VALUES (118, 195, 8);
INSERT INTO `question_knowledge` VALUES (119, 196, 3);
INSERT INTO `question_knowledge` VALUES (120, 82, 6);
INSERT INTO `question_knowledge` VALUES (121, 83, 6);
INSERT INTO `question_knowledge` VALUES (122, 84, 6);
INSERT INTO `question_knowledge` VALUES (123, 85, 3);
INSERT INTO `question_knowledge` VALUES (124, 86, 7);
INSERT INTO `question_knowledge` VALUES (125, 87, 7);
INSERT INTO `question_knowledge` VALUES (126, 88, 6);
INSERT INTO `question_knowledge` VALUES (127, 197, 4);

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '选项ID',
  `question_id` bigint NOT NULL COMMENT '所属题目的ID',
  `option_label` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '选项标签，如 A/B/C/D',
  `option_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '选项内容',
  `is_correct` tinyint(1) NULL DEFAULT 0 COMMENT '是否为正确选项，1=正确，0=错误',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_option
-- ----------------------------
INSERT INTO `question_option` VALUES (99, 65, 'A', '线性结构', 0);
INSERT INTO `question_option` VALUES (100, 65, 'B', '图结构', 0);
INSERT INTO `question_option` VALUES (101, 65, 'C', '树结构', 0);
INSERT INTO `question_option` VALUES (102, 65, 'D', '哈希结构', 1);
INSERT INTO `question_option` VALUES (107, 67, 'A', 'ABCD', 0);
INSERT INTO `question_option` VALUES (108, 67, 'B', 'ACBD', 0);
INSERT INTO `question_option` VALUES (109, 67, 'C', 'BDAC', 1);
INSERT INTO `question_option` VALUES (110, 67, 'D', 'DCBA', 0);
INSERT INTO `question_option` VALUES (111, 68, 'A', '队头和队尾一定在下标0', 0);
INSERT INTO `question_option` VALUES (112, 68, 'B', '队头和队尾一定在同一个下标，任意下标都有可能', 1);
INSERT INTO `question_option` VALUES (113, 68, 'C', '队头在下标0，队尾在下标n-1处', 0);
INSERT INTO `question_option` VALUES (114, 68, 'D', '以上说法都有可能', 0);
INSERT INTO `question_option` VALUES (115, 69, 'A', '对称矩阵', 0);
INSERT INTO `question_option` VALUES (116, 69, 'B', '三角矩阵', 0);
INSERT INTO `question_option` VALUES (117, 69, 'C', '对角矩阵', 0);
INSERT INTO `question_option` VALUES (118, 69, 'D', '以上都可以', 1);
INSERT INTO `question_option` VALUES (119, 70, 'A', '3', 0);
INSERT INTO `question_option` VALUES (120, 70, 'B', '4', 0);
INSERT INTO `question_option` VALUES (121, 70, 'C', '5', 1);
INSERT INTO `question_option` VALUES (122, 70, 'D', '6', 0);
INSERT INTO `question_option` VALUES (123, 71, 'A', '最小生成树', 0);
INSERT INTO `question_option` VALUES (124, 71, 'B', '拓扑排序', 1);
INSERT INTO `question_option` VALUES (125, 71, 'C', '深度优先搜索', 0);
INSERT INTO `question_option` VALUES (126, 71, 'D', '最短路径', 0);
INSERT INTO `question_option` VALUES (127, 72, 'A', '18,10,2,88,71', 1);
INSERT INTO `question_option` VALUES (128, 72, 'B', '3,14,8,27,31', 0);
INSERT INTO `question_option` VALUES (129, 72, 'C', '8,20,15,1,23', 0);
INSERT INTO `question_option` VALUES (130, 72, 'D', '23,19,28,37,50', 0);
INSERT INTO `question_option` VALUES (131, 73, 'A', '基数排序', 0);
INSERT INTO `question_option` VALUES (132, 73, 'B', '归并排序', 0);
INSERT INTO `question_option` VALUES (133, 73, 'C', '冒泡排序', 0);
INSERT INTO `question_option` VALUES (134, 73, 'D', '堆排序', 1);
INSERT INTO `question_option` VALUES (135, 93, 'A', '插入运算方便', 0);
INSERT INTO `question_option` VALUES (136, 93, 'B', '删除运算方便', 0);
INSERT INTO `question_option` VALUES (137, 93, 'C', '存储密度大', 1);
INSERT INTO `question_option` VALUES (138, 93, 'D', '可方便地用于各种逻辑结构的存储表示', 0);
INSERT INTO `question_option` VALUES (139, 98, 'A', 'O(1)', 0);
INSERT INTO `question_option` VALUES (140, 98, 'B', 'O(n)', 1);
INSERT INTO `question_option` VALUES (141, 98, 'C', 'O(log n)', 0);
INSERT INTO `question_option` VALUES (142, 98, 'D', 'O(n^2)', 0);
INSERT INTO `question_option` VALUES (143, 99, 'A', 'O(1)', 0);
INSERT INTO `question_option` VALUES (144, 99, 'B', 'O(n)', 1);
INSERT INTO `question_option` VALUES (145, 99, 'C', 'O(log n)', 0);
INSERT INTO `question_option` VALUES (146, 99, 'D', 'O(n^2)', 0);
INSERT INTO `question_option` VALUES (147, 104, 'A', '1/2', 0);
INSERT INTO `question_option` VALUES (148, 104, 'B', '1', 0);
INSERT INTO `question_option` VALUES (149, 104, 'C', '2', 1);
INSERT INTO `question_option` VALUES (150, 104, 'D', '4', 0);
INSERT INTO `question_option` VALUES (151, 105, 'A', 'n-1', 0);
INSERT INTO `question_option` VALUES (152, 105, 'B', 'n', 0);
INSERT INTO `question_option` VALUES (153, 105, 'C', 'n(n-1)/2', 0);
INSERT INTO `question_option` VALUES (154, 105, 'D', 'n(n-1)', 1);
INSERT INTO `question_option` VALUES (155, 106, 'A', '负权重', 0);
INSERT INTO `question_option` VALUES (156, 106, 'B', '正负权重皆可', 0);
INSERT INTO `question_option` VALUES (157, 106, 'C', '非负权重', 1);
INSERT INTO `question_option` VALUES (158, 106, 'D', '只能为0', 0);
INSERT INTO `question_option` VALUES (159, 122, 'A', '连通图', 1);
INSERT INTO `question_option` VALUES (160, 122, 'B', '完全图', 0);
INSERT INTO `question_option` VALUES (161, 122, 'C', '有向图', 0);
INSERT INTO `question_option` VALUES (162, 122, 'D', '二分图', 0);
INSERT INTO `question_option` VALUES (163, 123, 'A', '普里姆算法', 0);
INSERT INTO `question_option` VALUES (164, 123, 'B', '克鲁斯卡尔算法', 0);
INSERT INTO `question_option` VALUES (165, 123, 'C', '迪杰斯特拉算法', 1);
INSERT INTO `question_option` VALUES (166, 123, 'D', '弗洛伊德算法', 0);
INSERT INTO `question_option` VALUES (167, 124, 'A', '1种', 0);
INSERT INTO `question_option` VALUES (168, 124, 'B', '2种', 0);
INSERT INTO `question_option` VALUES (169, 124, 'C', '3种', 1);
INSERT INTO `question_option` VALUES (170, 124, 'D', '4种', 0);
INSERT INTO `question_option` VALUES (171, 125, 'A', '栈', 0);
INSERT INTO `question_option` VALUES (172, 125, 'B', '队列', 1);
INSERT INTO `question_option` VALUES (173, 125, 'C', '堆', 0);
INSERT INTO `question_option` VALUES (174, 125, 'D', '二叉树', 0);
INSERT INTO `question_option` VALUES (175, 126, 'A', '自环', 1);
INSERT INTO `question_option` VALUES (176, 126, 'B', '平行边', 0);
INSERT INTO `question_option` VALUES (177, 126, 'C', '环', 0);
INSERT INTO `question_option` VALUES (178, 126, 'D', '重边', 0);
INSERT INTO `question_option` VALUES (179, 127, 'A', '强连通', 1);
INSERT INTO `question_option` VALUES (180, 127, 'B', '弱连通', 0);
INSERT INTO `question_option` VALUES (181, 127, 'C', '单向连通', 0);
INSERT INTO `question_option` VALUES (182, 127, 'D', '不连通', 0);
INSERT INTO `question_option` VALUES (183, 128, 'A', '深度优先搜索', 0);
INSERT INTO `question_option` VALUES (184, 128, 'B', '广度优先搜索', 0);
INSERT INTO `question_option` VALUES (185, 128, 'C', '普里姆算法', 1);
INSERT INTO `question_option` VALUES (186, 128, 'D', '迪杰斯特拉算法', 0);
INSERT INTO `question_option` VALUES (187, 129, 'A', 'n', 0);
INSERT INTO `question_option` VALUES (188, 129, 'B', 'n-1', 0);
INSERT INTO `question_option` VALUES (189, 129, 'C', 'n^2', 1);
INSERT INTO `question_option` VALUES (190, 129, 'D', '2n', 0);
INSERT INTO `question_option` VALUES (191, 130, 'A', '顶点', 0);
INSERT INTO `question_option` VALUES (192, 130, 'B', '边', 1);
INSERT INTO `question_option` VALUES (193, 130, 'C', '权值', 0);
INSERT INTO `question_option` VALUES (194, 130, 'D', '路径', 0);
INSERT INTO `question_option` VALUES (195, 131, 'A', '可以进行拓扑排序', 0);
INSERT INTO `question_option` VALUES (196, 131, 'B', '无法进行拓扑排序', 1);
INSERT INTO `question_option` VALUES (197, 131, 'C', '拓扑排序结果不唯一', 0);
INSERT INTO `question_option` VALUES (198, 131, 'D', '拓扑排序结果唯一', 0);
INSERT INTO `question_option` VALUES (199, 141, 'A', '0', 0);
INSERT INTO `question_option` VALUES (200, 141, 'B', '1', 0);
INSERT INTO `question_option` VALUES (201, 141, 'C', '2', 1);
INSERT INTO `question_option` VALUES (202, 141, 'D', '3', 0);
INSERT INTO `question_option` VALUES (203, 142, 'A', '1124', 0);
INSERT INTO `question_option` VALUES (204, 142, 'B', '1128', 1);
INSERT INTO `question_option` VALUES (205, 142, 'C', '1132', 0);
INSERT INTO `question_option` VALUES (206, 142, 'D', '1136', 0);
INSERT INTO `question_option` VALUES (207, 143, 'A', '0', 1);
INSERT INTO `question_option` VALUES (208, 143, 'B', '1', 0);
INSERT INTO `question_option` VALUES (209, 143, 'C', '-1', 0);
INSERT INTO `question_option` VALUES (210, 143, 'D', '不确定', 0);
INSERT INTO `question_option` VALUES (211, 144, 'A', '广义表中的元素可以是单个原子或另一个广义表', 1);
INSERT INTO `question_option` VALUES (212, 144, 'B', '广义表不可以是递归定义的', 0);
INSERT INTO `question_option` VALUES (213, 144, 'C', '广义表中的元素只能是单个原子', 0);
INSERT INTO `question_option` VALUES (214, 144, 'D', '广义表是一种线性结构', 0);
INSERT INTO `question_option` VALUES (215, 145, 'A', '1024', 0);
INSERT INTO `question_option` VALUES (216, 145, 'B', '1028', 0);
INSERT INTO `question_option` VALUES (217, 145, 'C', '1032', 1);
INSERT INTO `question_option` VALUES (218, 145, 'D', '1036', 0);
INSERT INTO `question_option` VALUES (219, 146, 'A', '4', 0);
INSERT INTO `question_option` VALUES (220, 146, 'B', '5', 1);
INSERT INTO `question_option` VALUES (221, 146, 'C', '6', 0);
INSERT INTO `question_option` VALUES (222, 146, 'D', '7', 0);
INSERT INTO `question_option` VALUES (223, 147, 'A', '\"lo w\"', 1);
INSERT INTO `question_option` VALUES (224, 147, 'B', '\"llo w\"', 0);
INSERT INTO `question_option` VALUES (225, 147, 'C', '\"lo wo\"', 0);
INSERT INTO `question_option` VALUES (226, 147, 'D', '\"lo wor\"', 0);
INSERT INTO `question_option` VALUES (227, 148, 'A', '顺序存储', 0);
INSERT INTO `question_option` VALUES (228, 148, 'B', '链式存储', 0);
INSERT INTO `question_option` VALUES (229, 148, 'C', '哈希表', 0);
INSERT INTO `question_option` VALUES (230, 148, 'D', '栈', 1);
INSERT INTO `question_option` VALUES (231, 149, 'A', 'A[0][0] + (i*n + j)*4', 1);
INSERT INTO `question_option` VALUES (232, 149, 'B', 'A[0][0] + (i + j*n)*4', 0);
INSERT INTO `question_option` VALUES (233, 149, 'C', 'A[0][0] + (i + j)*4', 0);
INSERT INTO `question_option` VALUES (234, 149, 'D', 'A[0][0] + (i*n + j)', 0);
INSERT INTO `question_option` VALUES (235, 150, 'A', 'KMP算法的时间复杂度为O(n^2)', 0);
INSERT INTO `question_option` VALUES (236, 150, 'B', 'KMP算法需要回溯目标串', 0);
INSERT INTO `question_option` VALUES (237, 150, 'C', 'KMP算法利用了模式串的部分匹配信息', 1);
INSERT INTO `question_option` VALUES (238, 150, 'D', 'KMP算法无法处理模式串中存在重复字符的情况', 0);
INSERT INTO `question_option` VALUES (239, 151, 'A', '拼接', 0);
INSERT INTO `question_option` VALUES (240, 151, 'B', '查找', 0);
INSERT INTO `question_option` VALUES (241, 151, 'C', '插入', 0);
INSERT INTO `question_option` VALUES (242, 151, 'D', '排序', 1);
INSERT INTO `question_option` VALUES (243, 152, 'A', '1', 0);
INSERT INTO `question_option` VALUES (244, 152, 'B', '2', 1);
INSERT INTO `question_option` VALUES (245, 152, 'C', '3', 0);
INSERT INTO `question_option` VALUES (246, 152, 'D', '4', 0);
INSERT INTO `question_option` VALUES (247, 157, 'A', '将当前元素放到正确的位置', 1);
INSERT INTO `question_option` VALUES (248, 157, 'B', '确保所有元素按降序排列', 0);
INSERT INTO `question_option` VALUES (249, 157, 'C', '提高算法的时间复杂度', 0);
INSERT INTO `question_option` VALUES (250, 157, 'D', '减少算法的空间复杂度', 0);
INSERT INTO `question_option` VALUES (251, 158, 'A', '快速排序', 0);
INSERT INTO `question_option` VALUES (252, 158, 'B', '归并排序', 0);
INSERT INTO `question_option` VALUES (253, 158, 'C', '堆排序', 0);
INSERT INTO `question_option` VALUES (254, 158, 'D', '冒泡排序', 1);
INSERT INTO `question_option` VALUES (255, 170, 'A', '链表', 0);
INSERT INTO `question_option` VALUES (256, 170, 'B', '堆', 0);
INSERT INTO `question_option` VALUES (257, 170, 'C', '顺序表', 1);
INSERT INTO `question_option` VALUES (258, 170, 'D', '散列表', 0);
INSERT INTO `question_option` VALUES (259, 171, 'A', '插入', 0);
INSERT INTO `question_option` VALUES (260, 171, 'B', '删除', 0);
INSERT INTO `question_option` VALUES (261, 171, 'C', '排序', 1);
INSERT INTO `question_option` VALUES (262, 171, 'D', '搜索', 0);
INSERT INTO `question_option` VALUES (263, 172, 'A', '动态分配', 0);
INSERT INTO `question_option` VALUES (264, 172, 'B', '静态分配', 0);
INSERT INTO `question_option` VALUES (265, 172, 'C', '连续分配', 1);
INSERT INTO `question_option` VALUES (266, 172, 'D', '链式分配', 0);
INSERT INTO `question_option` VALUES (267, 173, 'A', '栈', 0);
INSERT INTO `question_option` VALUES (268, 173, 'B', '队列', 0);
INSERT INTO `question_option` VALUES (269, 173, 'C', '图', 1);
INSERT INTO `question_option` VALUES (270, 173, 'D', '二叉树', 0);
INSERT INTO `question_option` VALUES (271, 174, 'A', '使用链表', 0);
INSERT INTO `question_option` VALUES (272, 174, 'B', '使用哈希表', 1);
INSERT INTO `question_option` VALUES (273, 174, 'C', '使用栈', 0);
INSERT INTO `question_option` VALUES (274, 174, 'D', '使用队列', 0);
INSERT INTO `question_option` VALUES (275, 185, 'A', '该结点的父结点', 1);
INSERT INTO `question_option` VALUES (276, 185, 'B', '该结点的右子树中的最左下结点', 0);
INSERT INTO `question_option` VALUES (277, 185, 'C', '该结点的左子树中的最右下结点', 0);
INSERT INTO `question_option` VALUES (278, 185, 'D', '不存在', 0);
INSERT INTO `question_option` VALUES (279, 186, 'A', '每一层上的结点数都达到最大值。', 1);
INSERT INTO `question_option` VALUES (280, 186, 'B', '除了最后一层外，其他各层的结点数都达到最大值。', 0);
INSERT INTO `question_option` VALUES (281, 186, 'C', '最后一层的结点集中在该层的最左边。', 0);
INSERT INTO `question_option` VALUES (282, 186, 'D', '如果某个结点没有左孩子，则它一定没有右孩子。', 0);
INSERT INTO `question_option` VALUES (283, 187, 'A', '二叉树为空或所有结点都没有左子树。', 1);
INSERT INTO `question_option` VALUES (284, 187, 'B', '二叉树为空或所有结点都没有右子树。', 0);
INSERT INTO `question_option` VALUES (285, 187, 'C', '二叉树为空或只有根结点。', 0);
INSERT INTO `question_option` VALUES (286, 187, 'D', '二叉树为空或所有结点都只有一个孩子。', 0);
INSERT INTO `question_option` VALUES (287, 188, 'A', 'n-3', 1);
INSERT INTO `question_option` VALUES (288, 188, 'B', 'n-4', 0);
INSERT INTO `question_option` VALUES (289, 188, 'C', 'n-1', 0);
INSERT INTO `question_option` VALUES (290, 188, 'D', 'n', 0);
INSERT INTO `question_option` VALUES (291, 189, 'A', '栈', 0);
INSERT INTO `question_option` VALUES (292, 189, 'B', '队列', 1);
INSERT INTO `question_option` VALUES (293, 189, 'C', '哈希表', 0);
INSERT INTO `question_option` VALUES (294, 189, 'D', '二叉搜索树', 0);
INSERT INTO `question_option` VALUES (295, 64, 'A', 'O(logn)', 1);
INSERT INTO `question_option` VALUES (296, 64, 'B', 'O(n1/2)', 0);
INSERT INTO `question_option` VALUES (297, 64, 'C', 'O(n)', 0);
INSERT INTO `question_option` VALUES (298, 64, 'D', 'O(n2)', 0);
INSERT INTO `question_option` VALUES (299, 190, 'A', '18,10,2,88,71', 1);
INSERT INTO `question_option` VALUES (300, 190, 'B', '3,14,8,27,31', 0);
INSERT INTO `question_option` VALUES (301, 190, 'C', '8,20,15,1,23', 0);
INSERT INTO `question_option` VALUES (302, 190, 'D', '23,19,28,37,50', 0);
INSERT INTO `question_option` VALUES (303, 191, 'A', '基数排序', 0);
INSERT INTO `question_option` VALUES (304, 191, 'B', '归并排序', 0);
INSERT INTO `question_option` VALUES (305, 191, 'C', '冒泡排序', 0);
INSERT INTO `question_option` VALUES (306, 191, 'D', '堆排序', 1);
INSERT INTO `question_option` VALUES (307, 66, 'A', '经常修改表中元素的值', 0);
INSERT INTO `question_option` VALUES (308, 66, 'B', '经常在表中插入/删除元素', 1);
INSERT INTO `question_option` VALUES (309, 66, 'C', '经常对表中两个元素值互换', 0);
INSERT INTO `question_option` VALUES (310, 66, 'D', '经常对表中元素进行排序', 0);
INSERT INTO `question_option` VALUES (311, 196, 'A', '123', 1);
INSERT INTO `question_option` VALUES (312, 196, 'B', '321', 0);
INSERT INTO `question_option` VALUES (313, 196, 'C', '213', 0);
INSERT INTO `question_option` VALUES (314, 196, 'D', '312', 0);
INSERT INTO `question_option` VALUES (315, 197, 'A', '弹出栈顶元素', 0);
INSERT INTO `question_option` VALUES (316, 197, 'B', '检查栈是否为空', 0);
INSERT INTO `question_option` VALUES (317, 197, 'C', '将其压入栈中', 1);
INSERT INTO `question_option` VALUES (318, 197, 'D', '直接判定为不匹配', 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-03-05 19:55:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-03-05 19:55:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-03-05 19:55:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-03-05 19:55:48', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-03-05 19:55:48', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-03-05 19:55:48', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-03-05 19:55:48', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-03-05 19:55:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-05 19:58:28');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-06 17:09:17');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-06 18:37:39');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-06 20:55:24');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-08 10:48:16');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-08 16:13:26');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-09 20:06:34');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-09 20:06:38');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-14 20:52:54');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 16:31:55');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 17:26:09');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 19:45:13');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-15 21:30:42');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 15:45:14');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 17:47:01');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-16 19:40:08');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 19:40:15');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-16 20:30:51');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-18 16:28:17');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-22 13:19:05');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-22 14:37:00');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-22 15:53:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-22 20:35:57');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 17:34:03');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-24 22:53:00');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-26 22:04:49');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-26 22:04:52');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-26 22:04:54');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-03-27 10:59:01');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 10:59:03');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 12:55:18');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-27 16:51:46');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-03-28 20:26:27');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 20:26:31');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 21:14:36');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-03-28 22:19:14');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-06 23:24:59');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-07 14:33:13');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-14 20:39:48');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 11:15:22');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 17:12:26');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 20:50:53');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-15 23:19:22');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-16 11:18:12');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 11:18:18');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 13:57:24');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 21:01:29');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 22:52:43');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-16 23:34:09');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 10:13:50');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 17:38:57');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 20:49:03');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-17 21:32:48');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-18 14:52:40');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-18 14:52:43');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 14:52:46');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 16:46:46');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-04-18 16:55:16');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 16:55:18');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-04-18 19:40:40');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 19:40:43');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-18 20:37:22');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-21 20:02:43');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-22 15:56:57');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-23 19:56:48');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 11:34:05');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 17:53:27');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-04-24 21:36:50');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 21:36:52');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 22:21:04');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-24 23:49:25');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 10:36:43');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:09:12');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 12:52:03');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 15:15:26');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 16:06:15');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 22:05:35');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-25 23:07:27');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 14:45:57');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 16:21:49');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 16:55:31');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 19:42:29');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-26 21:40:52');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 10:11:51');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:06:27');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 16:48:05');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 22:42:38');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-27 23:44:24');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 10:04:30');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 12:28:32');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 14:53:25');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 16:26:46');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 19:38:17');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 20:50:34');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-28 23:18:50');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 15:18:13');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 19:58:41');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-29 23:39:16');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 09:43:09');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 11:03:59');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 12:22:27');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 14:13:04');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-04-30 14:45:22');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 11:35:25');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-01 22:18:22');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 16:05:44');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 17:45:19');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 20:09:43');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 20:58:36');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 21:39:47');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-02 23:57:04');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 12:35:51');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 19:44:14');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 20:22:40');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 20:54:08');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 22:14:37');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-03 23:08:12');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-04 17:03:24');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-05-04 19:11:39');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-05-04 19:29:47');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-04 19:29:51');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-04 21:23:45');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-04 23:23:31');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-13 16:09:52');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-13 19:57:30');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-13 21:32:22');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-14 20:48:38');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-15 00:22:03');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-15 20:15:57');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-05-16 20:29:14');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-16 20:35:50');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-16 20:40:50');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-16 20:41:12');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-16 20:54:01');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-16 20:54:29');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-16 21:11:05');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-16 21:12:41');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码错误', '2025-05-17 14:49:34');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-17 14:49:37');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-17 17:56:09');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-18 10:39:58');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-18 10:40:02');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-18 10:51:07');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-18 13:16:10');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-18 17:42:09');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-18 18:32:24');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-23 14:33:40');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-23 14:35:55');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-23 14:35:58');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '退出成功', '2025-05-23 14:43:04');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-05-23 14:43:53');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-02 21:48:18');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '1', '验证码已失效', '2025-06-04 22:24:33');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-06-04 22:24:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2059 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-03-05 19:55:48', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-03-05 19:55:48', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-16 20:37:44', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-03-05 19:55:48', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-03-05 19:55:48', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '1', '0', 'system:menu:list', 'tree-table', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-23 14:36:31', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-18 12:09:07', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-23 14:34:19', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-03-05 19:55:48', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-03-05 19:55:48', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-03-05 19:55:48', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '1', '0', 'monitor:job:list', 'job', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-16 20:38:31', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '1', '0', 'monitor:druid:list', 'druid', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-16 20:52:13', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-03-05 19:55:48', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '1', '0', 'monitor:cache:list', 'redis', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-18 12:07:59', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '1', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-03-05 19:55:48', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-03-05 19:55:48', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-03-05 19:55:48', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-03-05 19:55:48', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-03-05 19:55:48', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-03-05 19:55:48', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-03-05 19:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '题库', 0, 4, 'testpaper', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'table', 'admin', '2025-03-06 17:22:04', 'admin', '2025-05-16 20:53:12', '');
INSERT INTO `sys_menu` VALUES (2007, '题目管理', 2000, 1, 'question', 'testpaper/question/index', NULL, '', 1, 0, 'C', '0', '0', 'testpaper:question:list', 'form', 'admin', '2025-03-08 11:34:01', 'admin', '2025-05-16 20:53:07', '问题表菜单');
INSERT INTO `sys_menu` VALUES (2008, '问题表查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:question:query', '#', 'admin', '2025-03-08 11:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '问题表新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:question:add', '#', 'admin', '2025-03-08 11:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '问题表修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:question:edit', '#', 'admin', '2025-03-08 11:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '问题表删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:question:remove', '#', 'admin', '2025-03-08 11:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '问题表导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:question:export', '#', 'admin', '2025-03-08 11:34:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '知识点', 2000, 1, 'knowledge_point', 'testpaper/knowledge_point/index', NULL, '', 1, 0, 'C', '0', '0', 'testpaper:knowledge_point:list', 'tree', 'admin', '2025-03-08 11:34:12', 'admin', '2025-04-07 14:52:13', '知识点菜单');
INSERT INTO `sys_menu` VALUES (2020, '知识点查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:knowledge_point:query', '#', 'admin', '2025-03-08 11:34:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '知识点新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:knowledge_point:add', '#', 'admin', '2025-03-08 11:34:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '知识点修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:knowledge_point:edit', '#', 'admin', '2025-03-08 11:34:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '知识点删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:knowledge_point:remove', '#', 'admin', '2025-03-08 11:34:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '知识点导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:knowledge_point:export', '#', 'admin', '2025-03-08 11:34:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '选择题选项', 2000, 1, 'option', 'testpaper/option/index', NULL, '', 1, 0, 'C', '0', '0', 'testpaper:option:list', 'list', 'admin', '2025-03-24 17:42:40', 'admin', '2025-04-07 14:52:57', '选择题选项菜单');
INSERT INTO `sys_menu` VALUES (2026, '选择题选项查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:option:query', '#', 'admin', '2025-03-24 17:42:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '选择题选项新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:option:add', '#', 'admin', '2025-03-24 17:42:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '选择题选项修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:option:edit', '#', 'admin', '2025-03-24 17:42:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '选择题选项删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:option:remove', '#', 'admin', '2025-03-24 17:42:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '选择题选项导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'testpaper:option:export', '#', 'admin', '2025-03-24 17:42:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '试卷', 0, 5, 'paper', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'education', 'admin', '2025-04-15 23:21:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '试卷解析', 2031, 1, 'parser', 'paper/parser/index', NULL, '', 1, 0, 'C', '0', '0', '', 'code', 'admin', '2025-04-15 23:27:14', 'admin', '2025-04-15 23:28:46', '');
INSERT INTO `sys_menu` VALUES (2033, '手动组卷', 2031, 2, 'generator', 'paper/generator/index', NULL, '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2025-04-15 23:28:26', 'admin', '2025-05-15 20:38:56', '');
INSERT INTO `sys_menu` VALUES (2052, '试卷表管理', 2031, 1, 'paperlist', 'paper/paperlist/index', NULL, '', 1, 0, 'C', '0', '0', 'paper:paperlist:list', 'education', 'admin', '2025-04-18 19:46:31', 'admin', '2025-04-18 20:38:00', '试卷表管理菜单');
INSERT INTO `sys_menu` VALUES (2053, '试卷表管理查询', 2052, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'paper:paperlist:query', '#', 'admin', '2025-04-18 19:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '试卷表管理新增', 2052, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'paper:paperlist:add', '#', 'admin', '2025-04-18 19:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '试卷表管理修改', 2052, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'paper:paperlist:edit', '#', 'admin', '2025-04-18 19:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '试卷表管理删除', 2052, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'paper:paperlist:remove', '#', 'admin', '2025-04-18 19:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '试卷表管理导出', 2052, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'paper:paperlist:export', '#', 'admin', '2025-04-18 19:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, 'AI大模型', 2031, 4, 'SmartExamPage', 'paper/SmartExamPage/index', NULL, '', 1, 0, 'C', '0', '0', '', 'people', 'admin', '2025-04-21 20:19:55', 'admin', '2025-04-21 20:22:22', '');
INSERT INTO `sys_menu` VALUES (2059, '结构化组卷', 2031, 3, 'createExam', 'paper/createExam/index', '', '', 1, 0, 'C', '0', '0', '', 'education', 'admin', '2025-05-04 23:42:16', 'admin', '2025-05-15 20:38:47', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2025-05-01 新版本发布啦', '2', 0x3C703EE696B0E78988E69CACE58685E5AEB93C2F703E, '0', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-15 22:12:47', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2025-05-11 维护', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2025-03-05 19:55:48', 'admin', '2025-05-15 22:40:15', '管理员');
INSERT INTO `sys_notice` VALUES (10, '系统调试已基本完成', '1', 0x3C703EE5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE68890313233E5AE8CE688903132333C2F703E, '0', 'admin', '2025-05-15 22:40:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 284 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/03/05/1144400_20250217231715_1_20250305200004A001.png\",\"code\":200}', 0, NULL, '2025-03-05 20:00:04', 78);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"question_image,knowledge_point,question_knowledge,paper,paper_question,question,question_option\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 17:11:42', 154);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"point\",\"className\":\"KnowledgePoint\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"KpName\",\"columnComment\":\"知识点名称，如“树”、“图”、“排序”等\",\"columnId\":2,\"columnName\":\"kp_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"kpName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"KpDesc\",\"columnComment\":\"知识点描述或备注\",\"columnId\":3,\"columnName\":\"kp_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"kpDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"testpaper\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"common\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.common\",\"params\":{},\"sub\":false,\"tableComment\":\"知识点表\",\"tableId\":1,\"tableName\":\"knowledge_point\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-plus\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 17:14:30', 22);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"knowledge_point\"}', NULL, 0, NULL, '2025-03-06 17:14:35', 181);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"题库管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"testpaper\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 17:22:04', 14);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"knowledge_point\",\"className\":\"KnowledgePoint\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 17:14:30\",\"usableColumn\":false},{\"capJavaField\":\"KpName\",\"columnComment\":\"知识点名称，如“树”、“图”、“排序”等\",\"columnId\":2,\"columnName\":\"kp_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"kpName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 17:14:30\",\"usableColumn\":false},{\"capJavaField\":\"KpDesc\",\"columnComment\":\"知识点描述或备注\",\"columnId\":3,\"columnName\":\"kp_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"kpDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 17:14:30\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"知识点\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"testpaper\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.common\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableCo', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 17:24:56', 17);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"knowledge_point\"}', NULL, 0, NULL, '2025-03-06 17:24:59', 34);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"knowledge_point\",\"className\":\"KnowledgePoint\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"知识点\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 17:24:56\",\"usableColumn\":false},{\"capJavaField\":\"KpName\",\"columnComment\":\"知识点名称，如“树”、“图”、“排序”等\",\"columnId\":2,\"columnName\":\"kp_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"kpName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 17:24:56\",\"usableColumn\":false},{\"capJavaField\":\"KpDesc\",\"columnComment\":\"知识点描述或备注\",\"columnId\":3,\"columnName\":\"kp_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"kpDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 17:24:56\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lkr\",\"functionName\":\"知识点\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"testpaper\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.common\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 21:02:13', 50);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"knowledge_point\"}', NULL, 0, NULL, '2025-03-06 21:02:16', 173);
INSERT INTO `sys_oper_log` VALUES (109, '知识点', 1, 'com.ruoyi.common.controller.KnowledgePointController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/knowledge_point', '127.0.0.1', '内网IP', '{\"id\":1,\"kpDesc\":\"123\",\"kpName\":\"树\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-06 21:02:47', 12);
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/knowledge_point/index\",\"createTime\":\"2025-03-06 17:26:30\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"知识点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"knowledge_point\",\"perms\":\"testpaper:knowledge_point:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 10:49:47', 19);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"paper\",\"className\":\"Paper\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷ID\",\"columnId\":4,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaperName\",\"columnComment\":\"试卷名称\",\"columnId\":5,\"columnName\":\"paper_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":6,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreatorId\",\"columnComment\":\"创建者ID，可关联 user(id)\",\"columnId\":7,\"columnName\":\"creator_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"creatorId\",\"javaType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:03:10', 43);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"question\",\"className\":\"PaperQuestion\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"关联ID\",\"columnId\":10,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaperId\",\"columnComment\":\"试卷ID\",\"columnId\":11,\"columnName\":\"paper_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"paperId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"题目ID\",\"columnId\":12,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionScore\",\"columnComment\":\"该题在本试卷中的分值\",\"columnId\":13,\"columnName\":\"question_score\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"jav', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:07:17', 17);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"question\",\"className\":\"Question\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"题目ID\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionType\",\"columnComment\":\"题型，如 single_choice/multi_choice/fill_blank/short_answer/code 等\",\"columnId\":16,\"columnName\":\"question_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"题目标题或题干\",\"columnId\":17,\"columnName\":\"title\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度等级，如 1=易，2=中，3=难\",\"columnId\":18,\"columnName\":\"difficulty\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:08:55', 26);
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"image\",\"className\":\"QuestionImage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"关联题目ID\",\"columnId\":26,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImagePath\",\"columnComment\":\"图片路径或URL\",\"columnId\":27,\"columnName\":\"image_path\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imagePath\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"图片说明\",\"columnId\":28,\"columnName\":\"description\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:18:43', 14);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:19:58', 16);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"knowledge\",\"className\":\"QuestionKnowledge\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":29,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"题目id\",\"columnId\":30,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"KpId\",\"columnComment\":\"知识点id\",\"columnId\":31,\"columnName\":\"kp_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"kpId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lkr\",\"functionName\":\"知识点题目关联表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"testpaper\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.testpaper\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":2000,\"sub\":false,\"tableComment\":\"题目知识点关联表\",\"tableId\":6,\"tableName\":\"question_knowledge\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-plus\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:20:49', 11);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"image\",\"className\":\"QuestionImage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:18:43\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"关联题目ID\",\"columnId\":26,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:18:43\",\"usableColumn\":false},{\"capJavaField\":\"ImagePath\",\"columnComment\":\"图片路径或URL\",\"columnId\":27,\"columnName\":\"image_path\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"imagePath\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:18:43\",\"usableColumn\":false},{\"capJavaField\":\"Description\",\"columnComment\":\"图片说明\",\"columnId\":28,\"columnName\":\"description\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:22:07', 15);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:19:58\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:19:58\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:19:58\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:22:16', 12);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"knowledge_point\",\"className\":\"KnowledgePoint\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"知识点\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 21:02:13\",\"usableColumn\":false},{\"capJavaField\":\"KpName\",\"columnComment\":\"知识点名称，如“树”、“图”、“排序”等\",\"columnId\":2,\"columnName\":\"kp_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"kpName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 21:02:13\",\"usableColumn\":false},{\"capJavaField\":\"KpDesc\",\"columnComment\":\"知识点描述或备注\",\"columnId\":3,\"columnName\":\"kp_desc\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"kpDesc\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-03-06 21:02:13\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"lkr\",\"functionName\":\"知识点\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"testpaper\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.testpaper\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":20', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-08 11:30:53', 11);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"knowledge_point,paper,question\"}', NULL, 0, NULL, '2025-03-08 11:31:03', 244);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"paper_question,question_image,question_knowledge,question_option\"}', NULL, 0, NULL, '2025-03-08 16:13:38', 316);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"question\",\"className\":\"Question\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"题目ID\",\"columnId\":15,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:08:54\",\"usableColumn\":false},{\"capJavaField\":\"QuestionType\",\"columnComment\":\"题型，如 single_choice/multi_choice/fill_blank/short_answer/code 等\",\"columnId\":16,\"columnName\":\"question_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:08:54\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"题目标题或题干\",\"columnId\":17,\"columnName\":\"title\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:08:54\",\"usableColumn\":false},{\"capJavaField\":\"Difficulty\",\"columnComment\":\"难度等级，如 1=易，2=中，3=难\",\"columnId\":18,\"columnName\":\"difficulty\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-14 21:09:04', 72);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"question\"}', NULL, 0, NULL, '2025-03-14 21:12:04', 210);
INSERT INTO `sys_oper_log` VALUES (124, '问题表', 1, 'com.ruoyi.testpaper.controller.QuestionController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 21:32:09\",\"creatorId\":1001,\"difficulty\":1,\"id\":1,\"imageList\":[{\"description\":\"巴黎风光\",\"imagePath\":\"/static/images/paris.jpg\",\"params\":{}}],\"knowledgePoints\":[\"世界地理\"],\"optionList\":[{\"id\":1,\"isCorrect\":0,\"optionContent\":\"伦敦\",\"optionLabel\":\"A\",\"params\":{},\"questionId\":1},{\"id\":2,\"isCorrect\":0,\"optionContent\":\"柏林\",\"optionLabel\":\"B\",\"params\":{},\"questionId\":1},{\"id\":3,\"isCorrect\":1,\"optionContent\":\"巴黎\",\"optionLabel\":\"C\",\"params\":{},\"questionId\":1},{\"id\":4,\"isCorrect\":0,\"optionContent\":\"罗马\",\"optionLabel\":\"D\",\"params\":{},\"questionId\":1}],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'kpName\' in \'where clause\'\r\n### The error may exist in file [D:\\TestPaperGenerationSystem\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\testpaper\\KnowledgePointMapper.xml]\r\n### The error may involve com.ruoyi.testpaper.mapper.KnowledgePointMapper.selectKnowledgePointByName-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select id, kp_name, kp_desc from knowledge_point               where kpName = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'kpName\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'kpName\' in \'where clause\'', '2025-03-15 21:32:09', 139);
INSERT INTO `sys_oper_log` VALUES (125, '问题表', 1, 'com.ruoyi.testpaper.controller.QuestionController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 21:35:12\",\"creatorId\":1001,\"difficulty\":1,\"id\":2,\"imageList\":[{\"description\":\"巴黎风光\",\"imagePath\":\"/static/images/paris.jpg\",\"params\":{},\"questionId\":2}],\"knowledgePoints\":[\"世界地理\"],\"optionList\":[{\"id\":5,\"isCorrect\":0,\"optionContent\":\"伦敦\",\"optionLabel\":\"A\",\"params\":{},\"questionId\":2},{\"id\":6,\"isCorrect\":0,\"optionContent\":\"柏林\",\"optionLabel\":\"B\",\"params\":{},\"questionId\":2},{\"id\":7,\"isCorrect\":1,\"optionContent\":\"巴黎\",\"optionLabel\":\"C\",\"params\":{},\"questionId\":2},{\"id\":8,\"isCorrect\":0,\"optionContent\":\"罗马\",\"optionLabel\":\"D\",\"params\":{},\"questionId\":2}],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'description\' in \'field list\'\r\n### The error may exist in file [D:\\TestPaperGenerationSystem\\RuoYi-Vue\\ruoyi-admin\\target\\classes\\mapper\\testpaper\\QuestionImageMapper.xml]\r\n### The error may involve com.ruoyi.testpaper.mapper.QuestionImageMapper.insertQuestionImage-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into question_image          ( question_id,             image_path,             description )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'description\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'description\' in \'field list\'', '2025-03-15 21:35:12', 191);
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:58:32', 16);
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"question_image\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:58:38', 43);
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"image\",\"className\":\"QuestionImage\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":37,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:58:38\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"关联题目ID\",\"columnId\":38,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:58:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ImagePath\",\"columnComment\":\"图片路径或URL\",\"columnId\":39,\"columnName\":\"image_path\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:58:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"imagePath\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"1-对应题目，0-对应答案\",\"columnId\":40,\"columnName\":\"type\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2025-03-15 21:58:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"type\",\"javaT', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 21:59:44', 24);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"question_image\"}', NULL, 0, NULL, '2025-03-15 21:59:47', 173);
INSERT INTO `sys_oper_log` VALUES (130, '问题表', 1, 'com.ruoyi.testpaper.controller.QuestionController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":1,\"imagePath\":\"/static/images/paris.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"世界地理\"],\"optionList\":[{\"id\":9,\"isCorrect\":0,\"optionContent\":\"伦敦\",\"optionLabel\":\"A\",\"params\":{},\"questionId\":3},{\"id\":10,\"isCorrect\":0,\"optionContent\":\"柏林\",\"optionLabel\":\"B\",\"params\":{},\"questionId\":3},{\"id\":11,\"isCorrect\":1,\"optionContent\":\"巴黎\",\"optionLabel\":\"C\",\"params\":{},\"questionId\":3},{\"id\":12,\"isCorrect\":0,\"optionContent\":\"罗马\",\"optionLabel\":\"D\",\"params\":{},\"questionId\":3}],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-15 22:10:35', 158);
INSERT INTO `sys_oper_log` VALUES (131, '知识点', 1, 'com.ruoyi.testpaper.controller.KnowledgePointController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/knowledge_point', '127.0.0.1', '内网IP', '{\"id\":4,\"kpDesc\":\"无\",\"kpName\":\"绪论\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-16 21:20:50', 34);
INSERT INTO `sys_oper_log` VALUES (132, '知识点', 1, 'com.ruoyi.testpaper.controller.KnowledgePointController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/knowledge_point', '127.0.0.1', '内网IP', '{\"id\":5,\"kpDesc\":\"无\",\"kpName\":\"线性表\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-16 21:21:02', 5);
INSERT INTO `sys_oper_log` VALUES (133, '知识点', 1, 'com.ruoyi.testpaper.controller.KnowledgePointController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/knowledge_point', '127.0.0.1', '内网IP', '{\"id\":6,\"kpDesc\":\"无\",\"kpName\":\"串\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-16 21:21:23', 6);
INSERT INTO `sys_oper_log` VALUES (134, '问题表', 1, 'com.ruoyi.testpaper.controller.QuestionController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"1\",\"answer\":\"1\",\"createTime\":\"2025-03-22 15:54:23\",\"creatorId\":1,\"difficulty\":1,\"id\":4,\"params\":{},\"questionType\":\"short_answer\",\"title\":\"test\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-22 15:54:23', 104);
INSERT INTO `sys_oper_log` VALUES (135, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"1\",\"answer\":\"1\",\"createTime\":\"2025-03-22 15:54:24\",\"creatorId\":1,\"difficulty\":1,\"id\":4,\"params\":{},\"questionType\":\"short_answer\",\"title\":\"test\",\"updateTime\":\"2025-03-22 15:55:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-22 15:55:51', 8);
INSERT INTO `sys_oper_log` VALUES (136, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"1\",\"answer\":\"1\",\"createTime\":\"2025-03-22 15:54:24\",\"creatorId\":1,\"difficulty\":1,\"id\":4,\"params\":{},\"questionType\":\"short_answer\",\"title\":\"test\",\"updateTime\":\"2025-03-22 16:16:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-22 16:16:58', 23);
INSERT INTO `sys_oper_log` VALUES (137, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"1\",\"answer\":\"1\",\"createTime\":\"2025-03-22 15:54:24\",\"creatorId\":1,\"difficulty\":1,\"id\":4,\"params\":{},\"questionType\":\"short_answer\",\"title\":\"test\",\"updateTime\":\"2025-03-22 20:43:53\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.testpaper.mapper.QuestionImageMapper.deleteQuestionImageByQuestionId', '2025-03-22 20:43:53', 32);
INSERT INTO `sys_oper_log` VALUES (138, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"1\",\"answer\":\"1\",\"createTime\":\"2025-03-22 15:54:24\",\"creatorId\":1,\"difficulty\":1,\"id\":4,\"params\":{},\"questionType\":\"short_answer\",\"title\":\"test\",\"updateTime\":\"2025-03-22 20:52:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-22 20:52:24', 37);
INSERT INTO `sys_oper_log` VALUES (139, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"1\",\"answer\":\"1\",\"createTime\":\"2025-03-22 15:54:24\",\"creatorId\":1,\"difficulty\":1,\"id\":4,\"params\":{},\"questionType\":\"short_answer\",\"title\":\"test\",\"updateTime\":\"2025-03-22 21:02:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-22 21:02:31', 17);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:22:16\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:22:16\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:22:16\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 17:41:09', 41);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"question_option\"}', NULL, 0, NULL, '2025-03-24 17:41:14', 175);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 17:41:09\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 17:41:09\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 17:41:09\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 22:56:16', 22);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"question_option\"}', NULL, 0, NULL, '2025-03-24 22:56:19', 37);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 22:56:16\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 22:56:16\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 22:56:16\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 23:00:58', 17);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"question_option\"}', NULL, 0, NULL, '2025-03-24 23:01:02', 31);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:00:58\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:00:58\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:00:58\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"incre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 23:02:39', 21);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:02:39\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:02:39\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:02:39\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"incr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 23:03:21', 14);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:03:21\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:03:21\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:03:21\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 23:03:49', 16);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"option\",\"className\":\"QuestionOption\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"选项ID\",\"columnId\":32,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:03:49\",\"usableColumn\":false},{\"capJavaField\":\"QuestionId\",\"columnComment\":\"所属题目的ID\",\"columnId\":33,\"columnName\":\"question_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"questionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:03:49\",\"usableColumn\":false},{\"capJavaField\":\"OptionLabel\",\"columnComment\":\"选项标签，如 A/B/C/D\",\"columnId\":34,\"columnName\":\"option_label\",\"columnType\":\"varchar(5)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"optionLabel\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2025-03-24 23:03:49\",\"usableColumn\":false},{\"capJavaField\":\"OptionContent\",\"columnComment\":\"选项内容\",\"columnId\":35,\"columnName\":\"option_content\",\"columnType\":\"text\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"editor\",\"increme', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-24 23:04:34', 14);
INSERT INTO `sys_oper_log` VALUES (150, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":2,\"imagePath\":\"/static/images/paris.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"世界地理\",\"地理\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-03-27 16:57:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-27 16:57:46', 61);
INSERT INTO `sys_oper_log` VALUES (151, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":3,\"imagePath\":\"/static/images/paris.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"地理\",\"世界地理\",\"绪论\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-03-28 20:26:58\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 20:26:58', 50);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-03-28 21:14:45', 40);
INSERT INTO `sys_oper_log` VALUES (153, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":4,\"imagePath\":\"http://localhost:8080/profile/upload/2025/03/28/11_20250328222524A001.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"世界地理\",\"绪论\",\"地理\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-03-28 22:25:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 22:25:26', 59);
INSERT INTO `sys_oper_log` VALUES (154, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":5,\"imagePath\":\"http://localhost:8080/profile/upload/2025/03/28/11_20250328224621A001.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"世界地理\",\"绪论\",\"地理\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-03-28 22:46:22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 22:46:23', 140);
INSERT INTO `sys_oper_log` VALUES (155, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/03/28/Wingdk Screenshot 2024.04.24 - 22.12.11.54_20250328224747A002.png\",\"code\":200}', 0, NULL, '2025-03-28 22:47:47', 12);
INSERT INTO `sys_oper_log` VALUES (156, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"18985845454@163.com\",\"nickName\":\"刘铠睿\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-03-28 22:47:53', 12);
INSERT INTO `sys_oper_log` VALUES (157, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/04/06/6c0dce2dcc2580c0901ec882b3275d75_20250406232943A001.jpg\",\"code\":200}', 0, NULL, '2025-04-06 23:29:43', 89);
INSERT INTO `sys_oper_log` VALUES (158, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"18985845454@163.com\",\"nickName\":\"刘铠睿\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-06 23:29:47', 16);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 23:30:26', 4);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1016', '127.0.0.1', '内网IP', '1016', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-06 23:30:32', 11);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/question/index\",\"createTime\":\"2025-03-08 11:34:01\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"问题表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"question\",\"perms\":\"testpaper:question:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 14:51:27', 33);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/paper/index\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"试卷\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"perms\":\"testpaper:paper:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 14:51:52', 13);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/knowledge_point/index\",\"createTime\":\"2025-03-08 11:34:12\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"知识点\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"knowledge_point\",\"perms\":\"testpaper:knowledge_point:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 14:52:13', 12);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/option/index\",\"createTime\":\"2025-03-24 17:42:40\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"选择题选项\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"option\",\"perms\":\"testpaper:option:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 14:52:57', 13);
INSERT INTO `sys_oper_log` VALUES (165, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":6,\"imagePath\":\"http://localhost:8080/profile/upload/2025/04/07/96145490_p0_20250407151243A001.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"第二章 线性表\",\"第三章 栈和队列\",\"第六章 图\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-04-07 15:12:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-07 15:12:45', 74);
INSERT INTO `sys_oper_log` VALUES (166, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/04/14/EfcXdxiU4AIx_br_20250414205157A001.jpg\",\"code\":200}', 0, NULL, '2025-04-14 20:51:57', 84);
INSERT INTO `sys_oper_log` VALUES (167, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/04/14/11_20250414211311A002.jpg\",\"code\":200}', 0, NULL, '2025-04-14 21:13:11', 7);
INSERT INTO `sys_oper_log` VALUES (168, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":37,\"imagePath\":\"http://localhost:8080/profile/upload/2025/04/07/96145490_p0_20250407151243A001.jpg\",\"params\":{},\"questionId\":3},{\"id\":38,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/upload/1744638001012_11.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"第二章 线性表\",\"第三章 栈和队列\",\"第六章 图\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-04-14 21:40:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 21:40:05', 77);
INSERT INTO `sys_oper_log` VALUES (169, '选择题选项', 1, 'com.ruoyi.testpaper.controller.QuestionOptionController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/option', '127.0.0.1', '内网IP', '{\"id\":54,\"isCorrect\":0,\"optionContent\":\"测试\",\"optionLabel\":\"A\",\"params\":{},\"questionId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-14 21:45:36', 8);
INSERT INTO `sys_oper_log` VALUES (170, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744710617215.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744710617215.png\",\"code\":200}', 0, NULL, '2025-04-15 17:50:17', 36);
INSERT INTO `sys_oper_log` VALUES (171, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744710629326.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744710629326.png\",\"code\":200}', 0, NULL, '2025-04-15 17:50:29', 9);
INSERT INTO `sys_oper_log` VALUES (172, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744711471795.png\"}', NULL, 1, 'Cannot invoke \"java.lang.CharSequence.toString()\" because \"s\" is null', '2025-04-15 18:04:32', 14);
INSERT INTO `sys_oper_log` VALUES (173, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744721460988.png\"}', NULL, 1, 'Cannot invoke \"java.lang.CharSequence.toString()\" because \"s\" is null', '2025-04-15 20:51:01', 5);
INSERT INTO `sys_oper_log` VALUES (174, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744722737712.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744722737712.png\",\"code\":200}', 0, NULL, '2025-04-15 21:12:18', 20);
INSERT INTO `sys_oper_log` VALUES (175, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744724193954.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744724193954.png\",\"code\":200}', 0, NULL, '2025-04-15 21:36:34', 20);
INSERT INTO `sys_oper_log` VALUES (176, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744724601192.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744724601192.png\",\"code\":200}', 0, NULL, '2025-04-15 21:43:21', 9);
INSERT INTO `sys_oper_log` VALUES (177, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744725942683.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1744725942683.png\",\"code\":200}', 0, NULL, '2025-04-15 22:05:43', 390);
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"试卷\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"paper\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:21:47', 17);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper\\\\parser\\\\index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"试卷解析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2031,\"path\":\"parser\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:27:14', 10);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/parser/index\",\"createTime\":\"2025-04-15 23:27:14\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"试卷解析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2031,\"path\":\"parser\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:27:25', 10);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/generate/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"试卷生成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"generate\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:28:26', 9);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/parser/index\",\"createTime\":\"2025-04-15 23:27:14\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2032,\"menuName\":\"试卷解析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2031,\"path\":\"parser\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:28:46', 10);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/generate/index\",\"createTime\":\"2025-04-15 23:28:26\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"试卷生成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"generate\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-15 23:28:54', 12);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/generator/index\",\"createTime\":\"2025-04-15 23:28:26\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"试卷生成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"generator\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 11:26:28', 19);
INSERT INTO `sys_oper_log` VALUES (185, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"A\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":64,\"imageList\":[],\"knowledgePoints\":[\"第一章 绪论\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"来源章节: None\",\"title\":\"下面程序段的时间复杂度是（____________）。\\nint x = 1;\\nwhile (n >= x * x)\\nx *= 2;\",\"updateTime\":\"2025-04-16 21:24:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-16 21:24:14', 152);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"paper\",\"className\":\"Paper\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷ID\",\"columnId\":4,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:03:10\",\"usableColumn\":false},{\"capJavaField\":\"PaperName\",\"columnComment\":\"试卷名称\",\"columnId\":5,\"columnName\":\"paper_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:03:10\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":6,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-03-08 11:03:10\",\"usableColumn\":false},{\"capJavaField\":\"CreatorId\",\"columnComment\":\"创建者ID，可关联 user(id)\",\"columnId\":7,\"columnName\":\"creator_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-03-06 17:11:42\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 15:04:23', 43);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"paper\"}', NULL, 0, NULL, '2025-04-18 15:04:25', 173);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/paper/index\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"试卷表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"perms\":\"testpaper:paper:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 15:20:35', 13);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/paper/index\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"试卷表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"perms\":\"testpaper:paper:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 15:29:24', 9);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/paper/index\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"试卷表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"perms\":\"testpaper:paper:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 15:31:09', 7);
INSERT INTO `sys_oper_log` VALUES (191, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-05 19:55:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 15:42:26', 27);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-18 16:47:01', 9);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-18 16:47:09', 6);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/paper/index\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"试卷表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"perms\":\"testpaper:paper:list\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:47:13', 15);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '127.0.0.1', '内网IP', '2013', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2025-04-18 16:47:15', 2);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"试卷查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"testpaper:paper:query\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:47:19', 9);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '127.0.0.1', '内网IP', '2014', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-04-18 16:47:21', 6);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/paper/index\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"试卷表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"paper\",\"perms\":\"testpaper:paper:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:47:26', 8);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2025-03-08 11:34:07\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"试卷查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2013,\"path\":\"#\",\"perms\":\"testpaper:paper:query\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:47:28', 8);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:51:57', 24);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"paper\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:52:01', 37);
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"paper\",\"className\":\"Paper\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷ID\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PaperName\",\"columnComment\":\"试卷名称\",\"columnId\":42,\"columnName\":\"paper_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":43,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreatorId\",\"columnComment\":\"创建者ID，可关联 user(id)\",\"columnId\":44,\"columnName\":\"creator_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"creatorId\",\"java', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:52:33', 25);
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"paper\",\"className\":\"Paper\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷ID\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 16:52:33\",\"usableColumn\":false},{\"capJavaField\":\"PaperName\",\"columnComment\":\"试卷名称\",\"columnId\":42,\"columnName\":\"paper_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 16:52:33\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":43,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 16:52:33\",\"usableColumn\":false},{\"capJavaField\":\"CreatorId\",\"columnComment\":\"创建者ID，可关联 user(id)\",\"columnId\":44,\"columnName\":\"creator_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 16:52:57', 18);
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"paper\"}', NULL, 0, NULL, '2025-04-18 16:52:59', 169);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"paperlist\",\"className\":\"Paper\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷ID\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 16:52:57\",\"usableColumn\":false},{\"capJavaField\":\"PaperName\",\"columnComment\":\"试卷名称\",\"columnId\":42,\"columnName\":\"paper_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 16:52:57\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":43,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 16:52:57\",\"usableColumn\":false},{\"capJavaField\":\"CreatorId\",\"columnComment\":\"创建者ID，可关联 user(id)\",\"columnId\":44,\"columnName\":\"creator_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 19:45:34', 45);
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"paperlist\",\"className\":\"Paper\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"试卷ID\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 19:45:34\",\"usableColumn\":false},{\"capJavaField\":\"PaperName\",\"columnComment\":\"试卷名称\",\"columnId\":42,\"columnName\":\"paper_name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 19:45:34\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":43,\"columnName\":\"create_time\",\"columnType\":\"timestamp\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2025-04-18 19:45:34\",\"usableColumn\":false},{\"capJavaField\":\"CreatorId\",\"columnComment\":\"创建者ID，可关联 user(id)\",\"columnId\":44,\"columnName\":\"creator_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-04-18 16:52:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncre', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 19:45:51', 27);
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"paper\"}', NULL, 0, NULL, '2025-04-18 19:45:56', 173);
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/paperlist/index\",\"createTime\":\"2025-04-18 19:46:31\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2052,\"menuName\":\"试卷表管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2031,\"path\":\"paperlist\",\"perms\":\"paper:paperlist:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-18 20:38:00', 19);
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"AI大模型\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":2031,\"path\":\"SmartExamPage\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 20:19:55', 51);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-21 20:19:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2058,\"menuName\":\"AI大模型\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":2031,\"path\":\"paper/SmartExamPage/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 20:21:22', 14);
INSERT INTO `sys_oper_log` VALUES (211, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-04-21 20:19:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2058,\"menuName\":\"AI大模型\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2031,\"path\":\"paper/SmartExamPage/index\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 20:21:42', 8);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/SmartExamPage/index\",\"createTime\":\"2025-04-21 20:19:55\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2058,\"menuName\":\"AI大模型\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2031,\"path\":\"SmartExamPage\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-21 20:22:23', 9);
INSERT INTO `sys_oper_log` VALUES (213, '问题表', 3, 'com.ruoyi.testpaper.controller.QuestionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/testpaper/question/95', '127.0.0.1', '内网IP', '[95]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-04-27 23:54:52', 35);
INSERT INTO `sys_oper_log` VALUES (214, '问题表', 3, 'com.ruoyi.testpaper.controller.QuestionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/testpaper/question/93', '127.0.0.1', '内网IP', '[93]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-03 23:08:34', 36);
INSERT INTO `sys_oper_log` VALUES (215, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"二叉树的前序遍历顺序为：先访问根节点，再递归地访问左子树，最后递归地访问右子树。\",\"answer\":\"左子树 右子树\",\"createTime\":\"2025-04-27 23:44:40\",\"creatorId\":1,\"difficulty\":3,\"id\":94,\"imageList\":[],\"knowledgePoints\":[\"第五章 树和二叉树\"],\"optionList\":[],\"params\":{},\"questionType\":\"fill_blank\",\"title\":\"二叉树的前序遍历首先访问的是根节点，然后依次访问___和___\",\"updateTime\":\"2025-05-03 23:08:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-03 23:08:43', 90);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/generator/index\",\"createTime\":\"2025-04-15 23:28:26\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"手动组卷\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"generator\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-04 23:40:58', 31);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"结构化组卷\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2031,\"path\":\"createxam\",\"query\":\"paper/createxam\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-04 23:42:16', 13);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/createxam/index\",\"createTime\":\"2025-05-04 23:42:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"结构化组卷\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2031,\"path\":\"createxam\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-04 23:42:33', 13);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/createExam/index\",\"createTime\":\"2025-05-04 23:42:16\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"结构化组卷\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2031,\"path\":\"createExam\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-04 23:43:07', 16);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/createExam/index\",\"createTime\":\"2025-05-04 23:42:16\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"结构化组卷\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2031,\"path\":\"createExam\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 20:38:48', 26);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"paper/generator/index\",\"createTime\":\"2025-04-15 23:28:26\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"手动组卷\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"generator\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 20:38:56', 10);
INSERT INTO `sys_oper_log` VALUES (222, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-15 21:44:51\",\"creatorId\":1,\"id\":3,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 21:44:51', 15);
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-05 19:55:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"test@qq.com\",\"loginDate\":\"2025-03-05 19:55:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"老师1\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 22:09:34', 132);
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-05 19:55:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2008,2009,2010,2011,2012,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2052,2053,2054,2055,2056,2057,2033,2059,2058],\"params\":{},\"remark\":\"老师\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"老师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 22:11:02', 35);
INSERT INTO `sys_oper_log` VALUES (225, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-05 19:55:48\",\"noticeContent\":\"<p>新版本内容</p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2025-05-01 新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 22:12:47', 10);
INSERT INTO `sys_oper_log` VALUES (226, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-03-05 19:55:48\",\"noticeContent\":\"<p>维护内容</p>\",\"noticeId\":2,\"noticeTitle\":\"维护通知：2025-05-11 维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 22:40:15', 6);
INSERT INTO `sys_oper_log` VALUES (227, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123完成123</p>\",\"noticeTitle\":\"系统调试已基本完成\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 22:40:48', 7);
INSERT INTO `sys_oper_log` VALUES (228, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-15 23:40:52\",\"creatorId\":1,\"id\":4,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 23:40:52', 134);
INSERT INTO `sys_oper_log` VALUES (229, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-15 23:43:48\",\"creatorId\":1,\"id\":5,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 23:43:48', 8);
INSERT INTO `sys_oper_log` VALUES (230, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-15 23:49:45\",\"creatorId\":1,\"id\":6,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 23:49:45', 8);
INSERT INTO `sys_oper_log` VALUES (231, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-15 23:51:16\",\"creatorId\":1,\"id\":7,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-15 23:51:16', 7);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:37:44', 21);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:38:31', 8);
INSERT INTO `sys_oper_log` VALUES (234, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747399312125.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747399312125.png\",\"code\":200}', 0, NULL, '2025-05-16 20:41:52', 469);
INSERT INTO `sys_oper_log` VALUES (235, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-16 20:47:16\",\"creatorId\":1,\"id\":8,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:47:16', 12);
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:52:13', 8);
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"testpaper/question/index\",\"createTime\":\"2025-03-08 11:34:01\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"题目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"question\",\"perms\":\"testpaper:question:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:53:07', 8);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-03-06 17:22:04\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"题库\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"testpaper\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:53:12', 8);
INSERT INTO `sys_oper_log` VALUES (239, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"18985845454@163.com\",\"nickName\":\"刘铠睿\",\"params\":{},\"phonenumber\":\"13333333333\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:54:58', 12);
INSERT INTO `sys_oper_log` VALUES (240, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747400111927.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747400111927.png\",\"code\":200}', 0, NULL, '2025-05-16 20:55:12', 209);
INSERT INTO `sys_oper_log` VALUES (241, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":63,\"imagePath\":\"http://localhost:8080/profile/upload/2025/04/07/96145490_p0_20250407151243A001.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"第二章 线性表\",\"第三章 栈和队列\",\"第六章 图\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-05-16 20:56:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:56:41', 36);
INSERT INTO `sys_oper_log` VALUES (242, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":64,\"imagePath\":\"http://localhost:8080/profile/upload/2025/04/07/96145490_p0_20250407151243A001.jpg\",\"params\":{},\"questionId\":3},{\"id\":65,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/upload/1747400206332_EfcXdxiU4AIx_br.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"第二章 线性表\",\"第三章 栈和队列\",\"第六章 图\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-05-16 20:56:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 20:56:47', 22);
INSERT INTO `sys_oper_log` VALUES (243, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"18985845454@163.com\",\"nickName\":\"刘铠睿\",\"params\":{},\"phonenumber\":\"13344444444\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:13:36', 14);
INSERT INTO `sys_oper_log` VALUES (244, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747401227185.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747401227185.png\",\"code\":200}', 0, NULL, '2025-05-16 21:13:47', 208);
INSERT INTO `sys_oper_log` VALUES (245, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-05 19:55:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"test@qq.com\",\"loginDate\":\"2025-03-05 19:55:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"杨老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"老师\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:14:09', 22);
INSERT INTO `sys_oper_log` VALUES (246, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-03-05 19:55:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2007,2008,2009,2010,2011,2012,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2052,2053,2054,2055,2056,2057,2033,2059,2058],\"params\":{},\"remark\":\"老师\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"老师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:14:36', 24);
INSERT INTO `sys_oper_log` VALUES (247, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>测试</p>\",\"noticeTitle\":\"123\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:15:12', 9);
INSERT INTO `sys_oper_log` VALUES (248, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/11', '127.0.0.1', '内网IP', '[11]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:15:19', 13);
INSERT INTO `sys_oper_log` VALUES (249, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"法国的首都是巴黎\",\"answer\":\"C\",\"createTime\":\"2025-03-15 22:10:35\",\"creatorId\":1001,\"difficulty\":1,\"id\":3,\"imageList\":[{\"id\":66,\"imagePath\":\"http://localhost:8080/profile/upload/2025/04/07/96145490_p0_20250407151243A001.jpg\",\"params\":{},\"questionId\":3},{\"id\":67,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/upload/1747401386907_uqaqhuvavt0.jpg\",\"params\":{},\"questionId\":3}],\"knowledgePoints\":[\"第二章 线性表\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"示例测试题\",\"title\":\"下列哪一项是法国的首都？\",\"updateTime\":\"2025-05-16 21:16:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:16:27', 20);
INSERT INTO `sys_oper_log` VALUES (250, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"B\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":66,\"imageList\":[],\"knowledgePoints\":[\"第三章 栈和队列\"],\"optionList\":[],\"params\":{},\"questionType\":\"single_choice\",\"remarks\":\"来源章节: None\",\"title\":\"对于链表和顺序表，下面哪种情况更适合用链表（____________）。\",\"updateTime\":\"2025-05-16 21:16:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:16:46', 20);
INSERT INTO `sys_oper_log` VALUES (251, '试卷表管理', 3, 'com.ruoyi.paper.controller.PaperController.remove()', 'DELETE', 1, 'admin', '研发部门', '/paper/paperlist/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:17:53', 11);
INSERT INTO `sys_oper_log` VALUES (252, '试卷表管理', 3, 'com.ruoyi.paper.controller.PaperController.remove()', 'DELETE', 1, 'admin', '研发部门', '/paper/paperlist/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:17:55', 6);
INSERT INTO `sys_oper_log` VALUES (253, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-16 21:21:41\",\"creatorId\":1,\"id\":9,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:21:41', 8);
INSERT INTO `sys_oper_log` VALUES (254, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-16 21:46:14\",\"creatorId\":1,\"id\":10,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:46:14', 31);
INSERT INTO `sys_oper_log` VALUES (255, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-16 21:46:16\",\"creatorId\":1,\"id\":11,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-16 21:46:16', 10);
INSERT INTO `sys_oper_log` VALUES (256, '问题表', 1, 'com.ruoyi.testpaper.controller.QuestionController.add()', 'POST', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"analysis\":\"无\",\"answer\":\"A\",\"createTime\":\"2025-05-17 19:04:09\",\"creatorId\":1,\"difficulty\":2,\"id\":196,\"imageList\":[],\"knowledgePoints\":[\"第二章 线性表\"],\"optionList\":[{\"id\":311,\"isCorrect\":1,\"optionContent\":\"123\",\"optionLabel\":\"A\",\"params\":{},\"questionId\":196},{\"id\":312,\"isCorrect\":0,\"optionContent\":\"321\",\"optionLabel\":\"B\",\"params\":{},\"questionId\":196},{\"id\":313,\"isCorrect\":0,\"optionContent\":\"213\",\"optionLabel\":\"C\",\"params\":{},\"questionId\":196},{\"id\":314,\"isCorrect\":0,\"optionContent\":\"312\",\"optionLabel\":\"D\",\"params\":{},\"questionId\":196}],\"params\":{},\"questionType\":\"single_choice\",\"title\":\"测试\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-17 19:04:09', 82);
INSERT INTO `sys_oper_log` VALUES (257, '知识点', 3, 'com.ruoyi.testpaper.controller.KnowledgePointController.remove()', 'DELETE', 1, 'admin', '研发部门', '/testpaper/knowledge_point/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 11:21:02', 23);
INSERT INTO `sys_oper_log` VALUES (258, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatarBycos()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar/cos', '127.0.0.1', '内网IP', '{\"avatar\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747538631757.png\"}', '{\"msg\":\"操作成功\",\"imgUrl\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747538631757.png\",\"code\":200}', 0, NULL, '2025-05-18 11:23:52', 492);
INSERT INTO `sys_oper_log` VALUES (259, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-05-18 11:37:57', 785);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"缓存监控\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"cache\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:07:59', 13);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:08:25', 7);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:09:07', 9);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1020', '127.0.0.1', '内网IP', '1020', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:13:56', 15);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1021', '127.0.0.1', '内网IP', '1021', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:13:59', 8);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1022', '127.0.0.1', '内网IP', '1022', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:00', 10);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1023', '127.0.0.1', '内网IP', '1023', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:02', 8);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1024', '127.0.0.1', '内网IP', '1024', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:04', 7);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1016', '127.0.0.1', '内网IP', '1016', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:08', 7);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1017', '127.0.0.1', '内网IP', '1017', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:10', 8);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1018', '127.0.0.1', '内网IP', '1018', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:12', 12);
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/1019', '127.0.0.1', '内网IP', '1019', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:14:13', 8);
INSERT INTO `sys_oper_log` VALUES (272, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（树4分，后序结果2分）\\n后序遍历结果：EDFGACB\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":82,\"imageList\":[{\"id\":68,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q19_7f5ffc1d892a47c86968e8ea7e88e5870eb11ba0b6af214b366f91ae52fb2aeb.png\",\"params\":{},\"questionId\":82,\"type\":0}],\"knowledgePoints\":[\"第五章 树和二叉树\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"已知二叉树的先序遍历为BCDEAFG，中序遍历为DECFAGB，画出该二叉树，写出该树的后序遍历结果。\\n\\n\\n\\n\\n\\n\\n\",\"updateTime\":\"2025-05-18 12:32:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:01', 43);
INSERT INTO `sys_oper_log` VALUES (273, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（每空2分）\\n树的高度为________4____。叶结点个数为________4____。结点52的兄弟是________8____。\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":83,\"imageList\":[{\"id\":69,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q2_caca1e9700a117382a4e5a079dcf7d11e5694d1f4bf8d0493e12694a2556a9c5.png\",\"params\":{},\"questionId\":83,\"type\":1}],\"knowledgePoints\":[\"第五章 树和二叉树\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"有AVL树如下，依次插入52、53。\\n\\n\\n对于插入后得到的树，树的高度为________。叶结点个数为________。结点52的兄弟是________。\\n\",\"updateTime\":\"2025-05-18 12:32:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:07', 16);
INSERT INTO `sys_oper_log` VALUES (274, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（判定树4分，ASL 2分）\\n或\\nASL=(1*1+2*2+3*4+4*4)/11=33/11=3\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":84,\"imageList\":[{\"id\":70,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q21_5ef26575398be3099eebed2889db0477ee5ccb52595b38739a37ae43d721e9e9.png\",\"params\":{},\"questionId\":84,\"type\":0},{\"id\":71,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q21_fca0daf2876669ca09a5e2c6514043d0127a8d9b28abbf3c4d630bbdda2324eb.png\",\"params\":{},\"questionId\":84,\"type\":0}],\"knowledgePoints\":[\"第五章 树和二叉树\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"已知有序序列3、8、15、17、22、31、35、40、43、59、62存在一维数组中。若采用折半查找，画出判定树，并计算查找成功时的ASL。\\n\\n\\n\\n\",\"updateTime\":\"2025-05-18 12:32:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:11', 15);
INSERT INTO `sys_oper_log` VALUES (275, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（哈希表4分，其中数字每错一个扣1分，扣完为止，ASL的计算2分）\\n\\nASL=(1+1+2+2+3+3+7+1)/8=20/8或5/2\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":85,\"imageList\":[{\"id\":72,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q4_7a246cdb40f5b53011d3f800ed5ff4e6d0ff43603e3f465e9eb66c81481af688.png\",\"params\":{},\"questionId\":85,\"type\":1},{\"id\":73,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q22_fb3304c473ed00d00f7353f5d8d36251dd5fbdb91583e34c0589248e2ff63890.png\",\"params\":{},\"questionId\":85,\"type\":0}],\"knowledgePoints\":[\"第二章 线性表\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"假设哈希表中已有如下元素。现将一组元素12、25、36、48、42、89依次插入空哈希表中，哈希函数为除留余数法，表大小TableSize为11，用开放地址法解决冲突，探测函数采用线性探测（di=1,2,3,...）。\\n（1）插入后的结果填入下表。\\n\\n（2）计算查找成功时的ASL。\\n\\n\\n\",\"updateTime\":\"2025-05-18 12:32:18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:18', 14);
INSERT INTO `sys_oper_log` VALUES (276, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（每空1分）\\n顶点e的最早开始时间为____22____；顶点g的最早开始时间为____46____；\\n顶点b的最晚完成时间为____14____；顶点d的最晚完成时间为____27____；\\n边<a,c>的最多延迟时间为____0____；边<e,f>的最多延迟时间为____14____。\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":86,\"imageList\":[{\"id\":74,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q5_9d0e46ca9c78cb82b33da2059f0aa437cbea38e6798b39146566ccd187b0899d.png\",\"params\":{},\"questionId\":86,\"type\":1}],\"knowledgePoints\":[\"第六章 图\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"有AOE图如下。\\n\\n\\n顶点e的最早开始时间为____；顶点g的最早开始时间为____；\\n顶点b的最晚完成时间为____；顶点d的最晚完成时间为____；\\n边<a,c>的最多延迟时间为____；边<e,f>的最多延迟时间为____。\\n\\n\",\"updateTime\":\"2025-05-18 12:32:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:34', 14);
INSERT INTO `sys_oper_log` VALUES (277, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（每错一个扣1分，扣完为止）\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":87,\"imageList\":[{\"id\":75,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q6_8436626b809241fba4062c8d573e607742f841280644e0509dadcbf958768a61.png\",\"params\":{},\"questionId\":87,\"type\":1},{\"id\":76,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q6_38f82e5b293eb0ddd881106ffcc778876e83f6aa2f103bd775ec9e37a598f392.png\",\"params\":{},\"questionId\":87,\"type\":1},{\"id\":77,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q24_17657c6d4233a4e9ab1f300adb7243973d7489d037257cb415da26d38a2ed547.png\",\"params\":{},\"questionId\":87,\"type\":0}],\"knowledgePoints\":[\"第六章 图\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"对下图，用Floyd算法求最短路径，将会得到方阵序列D-1、D0、D1、D2。将最后得到的方阵D2的内容填入右边的表格中。\\n____________\\n\\n\",\"updateTime\":\"2025-05-18 12:32:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:38', 15);
INSERT INTO `sys_oper_log` VALUES (278, '问题表', 2, 'com.ruoyi.testpaper.controller.QuestionController.edit()', 'PUT', 1, 'admin', '研发部门', '/testpaper/question', '127.0.0.1', '内网IP', '{\"answer\":\"（若不是完全二叉树得0分，若是，每错一个结点扣1分，扣完为止）\",\"createTime\":\"2025-04-16 21:01:10\",\"creatorId\":1,\"difficulty\":1,\"id\":88,\"imageList\":[{\"id\":78,\"imagePath\":\"https://paper-1302415821.cos.ap-chongqing.myqcloud.com/exam_images/q25_aecb701ab920d55cc298926ad33d869704c67b186ad664d3b7a386a0470b7c91.png\",\"params\":{},\"questionId\":88,\"type\":0}],\"knowledgePoints\":[\"第五章 树和二叉树\"],\"optionList\":[],\"params\":{},\"questionType\":\"short_answer\",\"remarks\":\"来源章节: None\",\"title\":\"有序列8、22、17、10、5、34、9、26，用建堆操作构建大顶堆（最大堆），然后删除二次，画出最后得到的堆。\\n\\n\\n\\n\\n\\n\\n\\n\\n\",\"updateTime\":\"2025-05-18 12:32:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 12:32:43', 11);
INSERT INTO `sys_oper_log` VALUES (279, '试卷表管理', 1, 'com.ruoyi.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-18 14:32:12\",\"creatorId\":1,\"id\":12,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-18 14:32:12', 8);
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 2, 'com.systemlkr.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-23 14:34:19', 18);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.systemlkr.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2025-03-05 19:55:48\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-23 14:36:31', 7);
INSERT INTO `sys_oper_log` VALUES (282, '试卷表管理', 1, 'com.systemlkr.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-05-23 14:51:58\",\"creatorId\":1,\"id\":13,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-05-23 14:51:58', 12);
INSERT INTO `sys_oper_log` VALUES (283, '试卷表管理', 1, 'com.systemlkr.paper.controller.PaperController.add()', 'POST', 1, 'admin', '研发部门', '/paper/paperlist', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-06-02 22:23:32\",\"creatorId\":1,\"id\":14,\"paperName\":\"数据结构期末试卷\",\"params\":{},\"remarks\":\"由导出功能添加\",\"totalScore\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-02 22:23:33', 31);
INSERT INTO `sys_oper_log` VALUES (284, '用户管理', 2, 'com.systemlkr.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-03-05 19:55:47\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"test@qq.com\",\"loginDate\":\"2025-03-05 19:55:47\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"X老师\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"老师\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"teacher001\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-06-04 22:51:41', 37);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-03-05 19:55:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-03-05 19:55:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-03-05 19:55:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-03-05 19:55:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-03-05 19:55:47', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '老师', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-03-05 19:55:47', 'admin', '2025-05-16 21:14:36', '老师');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2054);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2057);
INSERT INTO `sys_role_menu` VALUES (2, 2058);
INSERT INTO `sys_role_menu` VALUES (2, 2059);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '刘铠睿', '00', '18985845454@163.com', '13344444444', '0', 'https://paper-1302415821.cos.ap-chongqing.myqcloud.com/avatar/avatar_1747538631757.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-06-04 22:24:36', 'admin', '2025-03-05 19:55:47', '', '2025-06-04 22:24:36', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'teacher001', 'X老师', '00', 'test@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-05 19:55:47', 'admin', '2025-03-05 19:55:47', 'admin', '2025-06-04 22:51:41', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
