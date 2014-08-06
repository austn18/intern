CREATE SEQUENCE SEQ_T_BOARD_FILE_NO;

CREATE TABLE T_BOARD_FILE (
   NO             NUMBER(10)       PRIMARY KEY,
   BOARD_NO       NUMBER(6)       NOT NULL,
   FILE_ORI_NAME    VARCHAR2(100),
   FILE_SAVE_NAME    VARCHAR2(100),
   FILE_SIZE       NUMBER(10),
   REG_DATE        DATE DEFAULT SYSDATE
);

COMMIT;

CREATE SEQUENCE seq_t_board_no;

CREATE TABLE t_board(
   NO         NUMBER(6)      PRIMARY KEY,
   writer 	VARCHAR2(20) NOT NULL,
    title      VARCHAR2(200)   NOT NULL,
    CONTENT    VARCHAR2(4000)   NOT NULL,
    view_cnt   NUMBER(6)      DEFAULT 0,
    reg_date   DATE         DEFAULT sysdate
);

INSERT INTO T_BOARD(NO, title, content)VALUES(SEQ_T_BOARD_NO.NEXTVAL, '제목1', '내용1');
SELECT * FROM t_board;

CREATE TABLE t_member(
ID             VARCHAR2(20)       PRIMARY KEY,
NAME          VARCHAR2(20)       NOT NULL,
PASSWORD       VARCHAR2(20)       NOT NULL,
EMAIL_ID       VARCHAR2(30),
EMAIL_DOMAIN    VARCHAR2(20),
TEL1          CHAR(3),
TEL2          CHAR(4),
TEL3          CHAR(4),
POST          CHAR(7),
BASIC_ADDR       VARCHAR2(200),
DETAIL_ADDR    VARCHAR2(200),
TYPE            CHAR(1)             default 'U',
REG_DATE       DATE              default SYSDATE
);
CREATE SEQUENCE t_reply_no;

CREATE TABLE t_reply(
	NO NUMBER(6) PRIMARY KEY,
    link_no NUMBER(6),
    board_no number(6) NOT NULL,
    SPACE NUMBER(6) DEFAULT 0,
    writer VARCHAR2(20) NOT NULL,
    CONTENT VARCHAR2(200),
    REG_DATE DATE default SYSDATE
);


CREATE SEQUENCE T_GUESTBOOK_NO;
CREATE TABLE T_GUESTBOOK(
	guestbook_id NUMBER(6) PRIMARY KEY,
    register DATE DEFAULT SYSDATE,
    NAME VARCHAR2(40) NOT NULL,
    email VARCHAR2(80) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    content VARCHAR2(2000) NOT null
);

COMMIT;
UPDATE t_member SET TYPE = 'S';
SELECT * FroM t_member;

