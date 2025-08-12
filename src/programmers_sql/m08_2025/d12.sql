--https://school.programmers.co.kr/learn/courses/30/lessons/301650
--특정 세대의 대장균 찾기

SELECT
    G3.ID
FROM ECOLI_DATA G1
    INNER JOIN ECOLI_DATA G2
    ON G2.PARENT_ID = G1.ID
    INNER JOIN ECOLI_DATA G3
    ON G3.PARENT_ID = G2.ID
WHERE G1.PARENT_ID IS NULL
ORDER BY G3.ID

--문제는 3세대의 대장균 ID를 찾으라고 하는데, WHERE절이 없을 경우에는 4세대도 나오게된다.
--여기서 WHERE절을 통해 G1의 부모 세대가 NULL인 것으로 걸러내어야 4세대를 제외할 수 있다.