-- 2
CREATE VIEW V_TBL
AS 
SELECT * FROM EXAM2
WHERE C1='B' OR C1 IS NULL;

SELECT * FROM V_TBL;

SELECT SUM(C2) C2
FROM V_TBL
WHERE C2>=200 AND C1='B';

-- 3
SELECT ���Ű�, ���ſ�, COUNT(*) "�� ���Ű�", SUM(���űݾ�) "�� ���ž�" 
FROM EXAM03_1
GROUP BY ROLLUP (���Ű�, ���ſ�);

SELECT ���Ű�, ���ſ�, COUNT(*) "�� ���Ű�", SUM(���űݾ�) "�� ���ž�" 
FROM EXAM03_1
GROUP BY GROUPING SETS(���Ű�, ���ſ�);

SELECT ���Ű�, ���ſ�, COUNT(*) "�� ���Ű�", SUM(���űݾ�) "�� ���ž�" 
FROM EXAM03_1
GROUP BY CUBE(���Ű�, ���ſ�);

-- 4
SELECT * FROM EXAM04_2;
SELECT * FROM EXAM04_1;
SELECT ����ID, �������ڵ�, SUM(��뷮) AS ��뷮�հ�
FROM EXAM04_2
GROUP BY CUBE (����ID, �������ڵ�)
ORDER BY ����ID;

SELECT B.����ID, B.�������ڵ�, SUM(B.��뷮) AS ��뷮�հ�
FROM EXAM04_1 A JOIN EXAM04_2 B
ON A.����ID = B.����ID
GROUP BY CUBE (B.����ID, B.�������ڵ�)
ORDER BY ����ID;

-- 5  --> ����� �ٸ�.
SELECT * FROM EXAM05;
SELECT ��ǰID, ��, SUM(�����) AS �����
FROM EXAM05
WHERE �� BETWEEN '2014.10' AND '2014.12'
GROUP BY GROUPING SETS(��ǰID, ��);



SELECT ��ǰID, ��, SUM(�����) AS �����
FROM EXAM05
WHERE �� BETWEEN '2014.10' AND '2014.12'
GROUP BY GROUPING SETS(��ǰID, ��)
ORDER BY ��ǰID, ��;

DROP TABLE EXAM05;

-- 7 
SELECT ��õ���, ��õ��, ����õ��, ��õ����
FROM (SELECT ��õ���, ��õ��, ����õ��, ��õ����, ROW_NUMBER( ) 
 OVER (PARTITION BY ��õ��� ORDER BY ��õ���� DESC) AS RNUM
 FROM EXAM07)
WHERE RNUM=1;

-- 9
SELECT Y.���ID, Y.�μ�ID, Y.�����, Y.����
FROM (SELECT ���ID, MAX(����) OVER(PARTITION BY �μ�ID) AS �ְ���
FROM EXAM09) X, EXAM09 Y
WHERE X.���ID = Y.���ID
AND X.�ְ���=Y.����;
