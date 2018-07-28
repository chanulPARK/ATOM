CREATE TABLE Employee
(
    EMP_ID        VARCHAR2(20)     NOT NULL, 
    EMP_PW        VARCHAR2(300)    NOT NULL, 
    EMP_NAME      VARCHAR2(20)     NOT NULL, 
    EMP_RRN        VARCHAR2(20)     NOT NULL, 
    EMAIL         VARCHAR2(50)     NOT NULL, 
    PHONE         VARCHAR2(20)     NOT NULL, 
    ADDR          VARCHAR2(100)     NULL, 
    DEPT_CODE     CHAR(3)          NULL, 
    JOB_CODE      CHAR(3)          NULL, 
    MANAGER_ID    VARCHAR2(20)     NULL, 
    ADMIN_CODE    CHAR(3)          NULL,
    HIRE_DATE     DATE             NOT NULL, 
    ENT_DATE      DATE             NULL, 
    ENT_YN        CHAR(1)          NULL, 
    EMP_PR        VARCHAR2(300)    NULL, 
    EMP_IMG       VARCHAR2(20)     NULL, 
    CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EMP_ID)
);

INSERT INTO Employee VALUES ('user', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', '���', '930232-1294837', 'user@kh.com', '01029837261', '����Ư���� ������', 'N', 'N', 'MANAGER_ID 01', '0', sysdate, null, 'Y', '�ߺ�Ź�帳�ϴ�', 'EMP_IMG 01');
INSERT INTO Employee VALUES ('admin', '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==', '������', '000000-0000000', 'admin@atom.com', '01029385748', '����', 'N', 'N', 'MANAGER_ID 02', '1', sysdate, null, 'Y', 'EMP_PR 02', 'EMP_IMG 02');
commit;

select * from employee;
CREATE SEQUENCE TASK_SEQ
START WITH 1
INCREMENT BY 1;
/

CREATE OR REPLACE TRIGGER TASK_TASK_NO_AI_TRG
BEFORE INSERT ON TASK 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT TASK_SEQ.NEXTVAL
    INTO: NEW.TASK_NO
    FROM DUAL;
END;
/
CREATE TABLE board
(
    board_no NUMBER,
    title VARCHAR2(150),
    content VARCHAR2(3000),
    writer VARCHAR2(30),
    write_date DATE,
    visits NUMBER
);
CREATE TABLE board_code
(
    board_code VARCHAR2(10),
    board_name VARCHAR2(50)
);
ALTER TABLE board ADD board_code VARCHAR2(10);
-- DROP TABLE board;
CREATE SEQUENCE seq_board_no
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;
-- DROP SEQUENCE seq_board_no;
CREATE TABLE board_reply
(
    reply_no NUMBER,
    board_no NUMBER,
    writer VARCHAR2(30),
    content VARCHAR2(3000),
    write_date DATE,
    reply_code VARCHAR2(30)
);
select * from board;
CREATE TABLE board_code
(
    board_code VARCHAR2(10) PRIMARY KEY,
    board_name VARCHAR2(50) NOT NULL,
    CONSTRAINTS fk_board_code FOREIGN KEY(board_code)
    REFERENCES board(board_code)
);
INSERT INTO board_code VALUES('NOTICE', '��������');
INSERT INTO board_code VALUES('DEPT01', '�μ� 1��');
INSERT INTO board_code VALUES('DEPT02', '�μ� 2��');
INSERT INTO board_code VALUES('DATA', '�ڷ��');
INSERT INTO board_code VALUES('QUESTION', '��������');
INSERT INTO board_code VALUES('CREATE', '�Խ��� ����');
INSERT INTO board_code VALUES('DELETE', '�Խ��� ����');
commit;