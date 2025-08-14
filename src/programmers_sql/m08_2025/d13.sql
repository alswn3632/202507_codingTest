--http://school.programmers.co.kr/learn/courses/30/lessons/301651
--멸종위기의 대장균 찾기

WITH RECURSIVE GEN AS (
    SELECT
        ID,
        PARENT_ID,
        1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL

    UNION ALL

    SELECT
        E.ID,
        E.PARENT_ID,
        G.GENERATION + 1
    FROM ECOLI_DATA E
    INNER JOIN GEN G ON E.PARENT_ID = G.ID
)

SELECT
    COUNT(*) AS COUNT,
    G1.GENERATION
FROM GEN G1
LEFT JOIN GEN G2 ON G1.ID = G2.PARENT_ID
WHERE G2.ID IS NULL
GROUP BY G1.GENERATION
ORDER BY G1.GENERATION

--'WITH RECURSIVE GEN AS ()'를 통해 계층형 쿼리를 만들고, 첫번째 SELECT단이 1세대
--'WHERE G2.ID IS NULL'을 통해 문제에서 제시한 자식이 없는 개체를 찾아냄