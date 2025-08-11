--https://school.programmers.co.kr/learn/courses/30/lessons/59042
--없어진 기록 찾기

SELECT
    AO.ANIMAL_ID,
    AO.NAME
FROM ANIMAL_OUTS AO
LEFT OUTER JOIN ANIMAL_INS AI
    ON AO.ANIMAL_ID = AI.ANIMAL_ID
WHERE AI.ANIMAL_ID IS NULL

--'LEFT OUTER JOIN'을 통해 한쪽만 누락된 데이터를 찾아냄. 누락되었을 테이블의 기본키를 통해 NULL 검사
--프로그래머스 MySQL LEVEL 3 끝!