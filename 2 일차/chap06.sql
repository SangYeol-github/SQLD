-- 6-2
SELECT * FROM EXAM6_2;

UPDATE EXAM6_2 SET VAL=200 WHERE ID='001';
COMMIT; -- SERVER에 저장.
ROLLBACK;
INSERT INTO EXAM6_2 VALUES(3,300);
ROLLBACK;
INSERT INTO EXAM6_2 VALUES(3,300);
CREATE TABLE EXAM6_2_1(A NUMBER(10));
SELECT * FROM EXAM6_2_1;
ROLLBACK;

-- 6-4
SELECT * FROM EXAM6_4;
INSERT INTO EXAM6_4(품목ID, 단가) VALUES('005',2000);
COMMIT;
DELETE EXAM6_4 WHERE 품목ID='002';
ROLLBACK;
SELECT COUNT(품목ID) FROM EXAM6_4 WHERE 단가
=2000;

-- 6-32
SELECT * FROM 상품;
UPDATE 상품 SET 상품명 = 'LCD-TV' WHERE 상품ID = '001';
SAVEPOINT SP1;
COMMIT;
UPDATE 상품 SET 상품명 = '평면-TV' WHERE 상품ID = '001';
ROLLBACK SP1;
ROLLBACK SAVEPOINT SP1;