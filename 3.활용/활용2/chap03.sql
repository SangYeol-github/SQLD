-- EXAM8_2
CREATE VIEW V_TBL
AS 
SELECT * FROM EXAM8_2
WHERE C1='B' OR C1 IS NULL;

SELECT * FROM V_TBL;

SELECT SUM(C2) C2
FROM V_TBL
WHERE C2>=200 AND C1='B';

-- EXAM8_3
SELECT ���Ű�, ���ſ�, COUNT(*) "�� ���Ű�", SUM(���űݾ�) "�� ���ž�" 
FROM EXAM8_3
GROUP BY ROLLUP (���Ű�, ���ſ�);

SELECT ���Ű�, ���ſ�, COUNT(*) "�� ���Ű�", SUM(���űݾ�) "�� ���ž�" 
FROM EXAM8_3
GROUP BY GROUPING SETS(���Ű�, ���ſ�);

SELECT ���Ű�, ���ſ�, COUNT(*) "�� ���Ű�", SUM(���űݾ�) "�� ���ž�" 
FROM EXAM8_3
GROUP BY CUBE(���Ű�, ���ſ�);

-- EXAM8_4
SELECT * FROM EXAM8_4_1;
SELECT * FROM EXAM8_4_2;

SELECT B.����ID, B.�������ڵ�, SUM(B.��뷮) AS ��뷮�հ�
FROM EXAM8_4_1 A JOIN EXAM8_4_2 B
ON A.����ID = B.����ID
GROUP BY CUBE (B.����ID, B.�������ڵ�)
ORDER BY ����ID;

-- EXAM8_5
SELECT * FROM EXAM8_5;

SELECT ��ǰID, ��, SUM(�����) AS �����
FROM EXAM8_5
WHERE �� BETWEEN '2014.10' AND '2014.12'
GROUP BY GROUPING SETS(��ǰID, ��);

SELECT ��ǰID, ��, SUM(�����) AS �����
FROM EXAM8_5
WHERE �� BETWEEN '2014.10' AND '2014.12'
GROUP BY GROUPING SETS(��ǰID, ��)
ORDER BY ��ǰID, ��;


-- EXAM8_7 
SELECT * FROM EXAM8_7;

SELECT ��õ���, ��õ��, ����õ��, ��õ����
FROM (SELECT ��õ���, ��õ��, ����õ��, ��õ����, ROW_NUMBER( ) 
 OVER (PARTITION BY ��õ��� ORDER BY ��õ���� DESC) AS RNUM
 FROM EXAM8_7)
WHERE RNUM=1;

-- EXAM8_9
SELECT * FROM EXAM8_9;

SELECT Y.���ID, Y.�μ�ID, Y.�����, Y.����
FROM (SELECT ���ID, MAX(����) OVER(PARTITION BY �μ�ID) AS �ְ���
FROM EXAM8_9) X, EXAM8_9 Y
WHERE X.���ID = Y.���ID
AND X.�ְ���=Y.����;
