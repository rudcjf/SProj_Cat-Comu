
/* Drop Tables */

DROP TABLE CAT_MEMBER_AUT_REL CASCADE CONSTRAINTS;
DROP TABLE CAT_AUTHORITY CASCADE CONSTRAINTS;
DROP TABLE CAT_BOARD_IMG_REL CASCADE CONSTRAINTS;
DROP TABLE CAT_BOARD CASCADE CONSTRAINTS;
DROP TABLE CAT_BOARD_IMG CASCADE CONSTRAINTS;
DROP TABLE CAT_ITEM_CATE_REL CASCADE CONSTRAINTS;
DROP TABLE CAT_ITEM_IMG_REL CASCADE CONSTRAINTS;
DROP TABLE CAT_ITEM CASCADE CONSTRAINTS;
DROP TABLE CAT_BUY CASCADE CONSTRAINTS;
DROP TABLE CAT_ITEM_CATE CASCADE CONSTRAINTS;
DROP TABLE CAT_ITEM_IMG CASCADE CONSTRAINTS;
DROP TABLE CAT_MEMBER CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE CAT_AUTHORITY
(
	AUT_SEQ varchar2(40) NOT NULL,
	AUT_NAME varchar2(20),
	PRIMARY KEY (AUT_SEQ)
);


CREATE TABLE CAT_BOARD
(
	BOARD_SEQ varchar2(40) NOT NULL,
	TITLE varchar2(50),
	BOARD_CONTENTS varchar2(500),
	BOARD_STATUS varchar2(10),
	MEMBER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (BOARD_SEQ)
);


CREATE TABLE CAT_BOARD_IMG
(
	BOARD_IMG_SEQ varchar2(40) NOT NULL,
	BOARD_IMG_NAME varchar2(30),
	PRIMARY KEY (BOARD_IMG_SEQ)
);


CREATE TABLE CAT_BOARD_IMG_REL
(
	BOARD_SEQ varchar2(40) NOT NULL,
	BOARD_IMG_SEQ varchar2(40) NOT NULL
);


CREATE TABLE CAT_BUY
(
	BUY_SEQ varchar2(40) NOT NULL,
	BUY_METHOD varchar2(20),
	CARDNUMBER varchar2(16),
	BUY_PRICE number,
	BUY_COUNT number,
	MEMBER_ID varchar2(20) NOT NULL,
	PRIMARY KEY (BUY_SEQ)
);


CREATE TABLE CAT_ITEM
(
	ITEM_SEQ varchar2(40) NOT NULL,
	ITEM_NAME varchar2(40),
	PRICE number,
	DETAIL varchar2(500),
	COUNT number,
	BUY_SEQ varchar2(40) NOT NULL,
	PRIMARY KEY (ITEM_SEQ)
);


CREATE TABLE CAT_ITEM_CATE
(
	ITEM_CATE_SEQ varchar2(40) NOT NULL,
	ITEM_CATE_NAME varchar2(30),
	PRIMARY KEY (ITEM_CATE_SEQ)
);


CREATE TABLE CAT_ITEM_CATE_REL
(
	ITEM_CATE_SEQ varchar2(40),
	ITEM_SEQ varchar2(40) NOT NULL
);


CREATE TABLE CAT_ITEM_IMG
(
	ITEM_IMG_SEQ varchar2(40) NOT NULL,
	ITEM_IMG_NAME varchar2(30),
	PRIMARY KEY (ITEM_IMG_SEQ)
);


CREATE TABLE CAT_ITEM_IMG_REL
(
	ITEM_IMG_SEQ varchar2(40),
	ITEM_SEQ varchar2(40)
);


CREATE TABLE CAT_MEMBER
(
	MEMBER_ID varchar2(20) NOT NULL,
	PASSWORD varchar2(20),
	MEMBER_NAME varchar2(10),
	TEL varchar2(20),
	RESIDENCE varchar2(20),
	HOBBY varchar2(20),
	MEMBER_STATUS varchar2(10),
	PRIMARY KEY (MEMBER_ID)
);


CREATE TABLE CAT_MEMBER_AUT_REL
(
	MEMBER_ID varchar2(20) NOT NULL,
	AUT_SEQ varchar2(40) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE CAT_MEMBER_AUT_REL
	ADD FOREIGN KEY (AUT_SEQ)
	REFERENCES CAT_AUTHORITY (AUT_SEQ)
;


ALTER TABLE CAT_BOARD_IMG_REL
	ADD FOREIGN KEY (BOARD_SEQ)
	REFERENCES CAT_BOARD (BOARD_SEQ)
;


ALTER TABLE CAT_BOARD_IMG_REL
	ADD FOREIGN KEY (BOARD_IMG_SEQ)
	REFERENCES CAT_BOARD_IMG (BOARD_IMG_SEQ)
;


ALTER TABLE CAT_ITEM
	ADD FOREIGN KEY (BUY_SEQ)
	REFERENCES CAT_BUY (BUY_SEQ)
;


ALTER TABLE CAT_ITEM_CATE_REL
	ADD FOREIGN KEY (ITEM_SEQ)
	REFERENCES CAT_ITEM (ITEM_SEQ)
;


ALTER TABLE CAT_ITEM_IMG_REL
	ADD FOREIGN KEY (ITEM_SEQ)
	REFERENCES CAT_ITEM (ITEM_SEQ)
;


ALTER TABLE CAT_ITEM_CATE_REL
	ADD FOREIGN KEY (ITEM_CATE_SEQ)
	REFERENCES CAT_ITEM_CATE (ITEM_CATE_SEQ)
;


ALTER TABLE CAT_ITEM_IMG_REL
	ADD FOREIGN KEY (ITEM_IMG_SEQ)
	REFERENCES CAT_ITEM_IMG (ITEM_IMG_SEQ)
;


ALTER TABLE CAT_BOARD
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES CAT_MEMBER (MEMBER_ID)
;


ALTER TABLE CAT_BUY
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES CAT_MEMBER (MEMBER_ID)
;


ALTER TABLE CAT_MEMBER_AUT_REL
	ADD FOREIGN KEY (MEMBER_ID)
	REFERENCES CAT_MEMBER (MEMBER_ID)
;


