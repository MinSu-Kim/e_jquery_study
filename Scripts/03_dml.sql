-- 접속자 확인
SELECT USER FROM DUAL;

INSERT INTO DEPARTMENT VALUES(1, '영업', 8);
INSERT INTO DEPARTMENT VALUES(2, '기획', 10);
INSERT INTO DEPARTMENT VALUES(3, '개발', 9);
INSERT INTO DEPARTMENT VALUES(4, '총무', 7);

INSERT INTO TITLE VALUES (1, '사장');
INSERT INTO TITLE VALUES (2, '부장');
INSERT INTO TITLE VALUES (3, '과장');
INSERT INTO TITLE VALUES (4, '대리');
INSERT INTO TITLE VALUES (5, '사원');

/*    
    EMP_NO   NUMBER,
    EMP_NAME VARCHAR2(20) NOT NULL,
    TNO      NUMBER,
    MANAGER  NUMBER,
    SALARY   NUMBER,
    DNO      NUMBER,
    EMAIL    varchar2(60) NOT NULL,
    PASSWD   varchar2(60) NOT NULL,
    REGDATE  DATE DEFAULT SYSDATE,
  */  
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(4377, '이성래', 1, NULL, 5000000, 2, 'test@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3426, '박영권', 3, 4377, 3000000, 1, 'test1@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3011, '이수민', 2, 4377, 4000000, 3, 'test2@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3427, '최종철', 5, 3011, 1500000, 3, 'test3@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1003, '조민희', 3, 4377, 3000000, 2, 'test4@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(2106, '김창섭', 4, 1003, 2500000, 2, 'test5@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1365, '김상원', 5, 3426, 1500000, 1, 'test6@test.co.kr', '1234');


SELECT * FROM TITLE;
SELECT * FROM DEPARTMENT;
SELECT * FROM EMPLOYEE;