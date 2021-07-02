﻿CREATE TABLE `tbl_item` (
	`it_code`	CHAR(8)	NOT NULL PRIMARY KEY,
	`it_decode`	BIGINT	NOT NULL,
	`it_seid`	VARCHAR(20)	NOT NULL,
	`it_ctcode`	CHAR(4)	NOT NULL,
	`it_title`	VARCHAR(125)	NOT NULL,
	`it_price`	INT	NOT NULL,
	`it_shippingfee`	INT	NOT NULL	DEFAULT 0,
	`it_content`	VARCHAR(2000)	NOT NULL,
	`it_poto`	VARCHAR(100)	NULL
);

CREATE TABLE `tbl_option` (
	`op_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`op_itcode`	BIGINT	NOT NULL,
	`op_name`	VARCHAR(30)	NOT NULL,
	`op_content`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `tbl_select_option` (
	`so_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`so_itcode`	BIGINT	NOT NULL,
	`so_name`	VARCHAR(30)	NOT NULL,
	`so_content`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `tbl_category` (
	`ct_code`	CHAR(4)	NOT NULL PRIMARY KEY,
	`ct_main`	VARCHAR(30)	NOT NULL,
	`ct_sub`	VARCHAR(30)	NOT NULL
);

-- 영진
CREATE TABLE `tbl_member` (
	`mb_id`	VARCHAR(20)	NOT NULL PRIMARY KEY,
	`mb_pw`	VARCHAR(16)	NOT NULL,
	`mb_name`	VARCHAR(10)	NULL,
	`mb_anum`	VARCHAR(20)	NULL,
	`mb_role`	INT DEFAULT 0	NOT NULL,
	`mb_tel`	VARCHAR(20)	NOT NULL,
	`mb_birth`	CHAR(8)	NULL,
	`mb_email`	VARCHAR(50)	NULL,
	`mb_addr`	VARCHAR(200)	NULL,
	`mb_nickname`	VARCHAR(15)	NULL
);

CREATE TABLE `tbl_qna` (
	`q_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`q_writer`	BIGINT	NOT NULL,
	`q_itcode`	CHAR(8)	NOT NULL,
	`q_title`	VARCHAR(100)	NOT NULL,
	`q_content`	VARCHAR(2000)	NOT NULL,
	`q_date`	VARCHAR(30)	NULL
);

CREATE TABLE `tbl_review` (
	`r_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`r_writer`	BIGINT	NOT NULL,
	`r_itcode`	CHAR(8)	NOT NULL,
	`r_content`	VARCHAR(2000)	NULL,
	`r_date`	VARCHAR(30)	NULL,
	`r_score`	INT	NULL
);

CREATE TABLE `tbl_description` (
	`de_code`	BIGINT	NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`de_shippingfee`	VARCHAR(300)	NULL,
	`de_shipping`	VARCHAR(300)	NULL,
	`de_ refund`	VARCHAR(300)	NULL
);

CREATE TABLE `tbl_board` (
	`bd_seq`	BIGINT	NOT NULL PRIMARY KEY,
	`bd_author`	BIGINT	NOT NULL,
	`bd_title`	VARCHAR(125)	NULL,
	`bd_content`	VARCHAR(2000)	NULL,
	`bd_date`	VARCHAR(30)	NULL
);

CREATE TABLE `tbl_comment` (
	`cm_seq`	BIGINT	NOT NULL PRIMARY KEY,
	`cm_bdseq`	BIGINT	NOT NULL,
	`cm_mbid`	BIGINT	NOT NULL,
	`cm_content`	VARCHAR(500)	NULL
);


-- 안됨
ALTER TABLE `tbl_item` 
ADD CONSTRAINT `fk_description` 
FOREIGN KEY (`it_decode`)
REFERENCES `tbl_description` (`de_code`);

ALTER TABLE `tbl_item` 
ADD CONSTRAINT `fk_member` 
FOREIGN KEY (`it_seid`)
REFERENCES `tbl_member` (`mb_id`);

ALTER TABLE `tbl_item` 
ADD CONSTRAINT `fk_category` 
FOREIGN KEY (`it_ctcode`)
REFERENCES `tbl_category` (`ct_code`);

-- 안됨
ALTER TABLE `tbl_option` 
ADD CONSTRAINT `fk_item` 
FOREIGN KEY (`op_itcode`)
REFERENCES `tbl_item` (`it_code`)
ON DELETE CASCADE;

-- 안됨
ALTER TABLE `tbl_select_option` 
ADD CONSTRAINT `fk_item` 
FOREIGN KEY (`so_itcode`)
REFERENCES `tbl_item` (`it_code`)
ON DELETE CASCADE;

-- 안됨
ALTER TABLE `tbl_qna` 
ADD CONSTRAINT `fk_member`
FOREIGN KEY (`q_writer`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;

ALTER TABLE `tbl_qna` 
ADD CONSTRAINT `fk_item` 
FOREIGN KEY (`q_itcode`)
REFERENCES `tbl_item` (`it_code`);

ALTER TABLE `tbl_review` 
ADD CONSTRAINT `fk_member` 
FOREIGN KEY (`r_writer`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE SET NULL;

ALTER TABLE `tbl_review` 
ADD CONSTRAINT `fk_item` 
FOREIGN KEY (`r_itcode`)
REFERENCES `tbl_item` (`it_code`);


-- 영진
ALTER TABLE `tbl_board` 
ADD CONSTRAINT `fk_member` 
FOREIGN KEY (`bd_author`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;

ALTER TABLE `tbl_comment` 
ADD CONSTRAINT `fk_board` 
FOREIGN KEY (`cm_bdseq`)
REFERENCES `tbl_board` (`bd_seq`)
ON DELETE CASCADE;

ALTER TABLE `tbl_comment` 
ADD CONSTRAINT `fk_member` 
FOREIGN KEY (`cm_mbid`)
REFERENCES `tbl_member` (`mb_id`)
ON DELETE CASCADE;
