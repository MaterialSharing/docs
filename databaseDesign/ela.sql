/*
 Navicat Premium Data Transfer

 Source Server         : elaLocal
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : ela

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 04/04/2022 20:02:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cet4_words_req
-- ----------------------------
DROP TABLE IF EXISTS `cet4_words_req`;
CREATE TABLE `cet4_words_req`  (
  `wordOrder` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词在考纲中的序号\r\n',
  `spelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼写',
  PRIMARY KEY (`wordOrder`) USING BTREE,
  INDEX `spelling`(`spelling`) USING BTREE,
  CONSTRAINT `spelling` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cet6_words_req
-- ----------------------------
DROP TABLE IF EXISTS `cet6_words_req`;
CREATE TABLE `cet6_words_req`  (
  `wordOrder` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词在考纲中的序号\r\n',
  `spelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼写',
  PRIMARY KEY (`wordOrder`) USING BTREE,
  INDEX `spelling`(`spelling`) USING BTREE,
  CONSTRAINT `cet6_words_req_ibfk_1` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exam_req
-- ----------------------------
DROP TABLE IF EXISTS `exam_req`;
CREATE TABLE `exam_req`  (
  `examType` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`examType`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examwords
-- ----------------------------
DROP TABLE IF EXISTS `examwords`;
CREATE TABLE `examwords`  (
  `WID` int(11) NOT NULL,
  `wordSpelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `examType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`WID`) USING BTREE,
  INDEX `wordSpelling`(`wordSpelling`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feed_back
-- ----------------------------
DROP TABLE IF EXISTS `feed_back`;
CREATE TABLE `feed_back`  (
  `UID` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`UID`) USING BTREE,
  CONSTRAINT `UID` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for long_sentences
-- ----------------------------
DROP TABLE IF EXISTS `long_sentences`;
CREATE TABLE `long_sentences`  (
  `SID` int(11) NOT NULL COMMENT '句子id',
  `contentEN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '句子内容(英文)',
  `explainCN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '句子中文翻译',
  PRIMARY KEY (`SID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for neep_words_req
-- ----------------------------
DROP TABLE IF EXISTS `neep_words_req`;
CREATE TABLE `neep_words_req`  (
  `wordOrder` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词在考纲中的序号\r\n',
  `spelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼写',
  PRIMARY KEY (`wordOrder`) USING BTREE,
  INDEX `spelling`(`spelling`) USING BTREE,
  CONSTRAINT `neep_words_req_ibfk_1` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rate_difficulty
-- ----------------------------
DROP TABLE IF EXISTS `rate_difficulty`;
CREATE TABLE `rate_difficulty`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rates` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `fk_rate_word`(`spelling`) USING BTREE,
  CONSTRAINT `fk_rate_user` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_rate_word` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for study_cet4
-- ----------------------------
DROP TABLE IF EXISTS `study_cet4`;
CREATE TABLE `study_cet4`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `progress` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `fk_cet4_word`(`spelling`) USING BTREE,
  CONSTRAINT `fk_cet4_user` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cet4_word` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for study_cet6
-- ----------------------------
DROP TABLE IF EXISTS `study_cet6`;
CREATE TABLE `study_cet6`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `progress` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `fk_cet6_word`(`spelling`) USING BTREE,
  CONSTRAINT `fk_cet6_user` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cet6_word` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for study_neep
-- ----------------------------
DROP TABLE IF EXISTS `study_neep`;
CREATE TABLE `study_neep`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `progress` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `fk_neep_word`(`spelling`) USING BTREE,
  CONSTRAINT `fk_neep_user` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_neep_word` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for study_sentence
-- ----------------------------
DROP TABLE IF EXISTS `study_sentence`;
CREATE TABLE `study_sentence`  (
  `SID` int(11) NOT NULL,
  `UID` int(8) NOT NULL,
  `studyProgress` int(11) NOT NULL COMMENT '学习进度',
  PRIMARY KEY (`SID`, `UID`) USING BTREE,
  INDEX `userID`(`UID`) USING BTREE,
  CONSTRAINT `SID` FOREIGN KEY (`SID`) REFERENCES `long_sentences` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `userID` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UID` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户号\r\n',
  `signIn` int(8) NOT NULL COMMENT '累计签到次数\r\n',
  `examType` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试类型',
  `examDate` datetime NULL DEFAULT NULL COMMENT '考试日期',
  PRIMARY KEY (`UID`) USING BTREE,
  INDEX `UID`(`UID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for word_notes
-- ----------------------------
DROP TABLE IF EXISTS `word_notes`;
CREATE TABLE `word_notes`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `fk_note_word`(`spelling`) USING BTREE,
  CONSTRAINT `fk_note_user` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_note_word` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for word_search_history
-- ----------------------------
DROP TABLE IF EXISTS `word_search_history`;
CREATE TABLE `word_search_history`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `fk_history_word`(`spelling`) USING BTREE,
  CONSTRAINT `fk_history_user` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_history_word` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for word_star
-- ----------------------------
DROP TABLE IF EXISTS `word_star`;
CREATE TABLE `word_star`  (
  `UID` int(11) NOT NULL,
  `spelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`UID`, `spelling`) USING BTREE,
  INDEX `spelling_star`(`spelling`) USING BTREE,
  CONSTRAINT `UID_star` FOREIGN KEY (`UID`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `spelling_star` FOREIGN KEY (`spelling`) REFERENCES `words` (`spelling`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wordnotes
-- ----------------------------
DROP TABLE IF EXISTS `wordnotes`;
CREATE TABLE `wordnotes`  (
  `wordSpelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单词拼写',
  `UID` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批注内容',
  `difficultyAssess` int(255) NULL DEFAULT NULL COMMENT '难度评价'
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for words
-- ----------------------------
DROP TABLE IF EXISTS `words`;
CREATE TABLE `words`  (
  `spelling` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phonetic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `explainCN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `explainEN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `plurality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pastTense` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presentParticiple` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pastParticiple` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`spelling`) USING BTREE,
  INDEX `wordSpelling`(`spelling`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
