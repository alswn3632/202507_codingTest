--https://school.programmers.co.kr/learn/courses/30/lessons/293261
--물고기 종류 별 대어 찾기

SELECT
    FI.ID,
    FN.FISH_NAME,
    FI.LENGTH
FROM FISH_INFO FI
INNER JOIN FISH_NAME_INFO FN ON FI.FISH_TYPE = FN.FISH_TYPE
WHERE (FI.FISH_TYPE, FI.LENGTH) IN (
    SELECT FISH_TYPE, MAX(LENGTH)
    FROM FISH_INFO
    WHERE LENGTH > 10
    GROUP BY FISH_TYPE
)
ORDER BY FI.ID

--"물고기 종류별 가장 큰 물고기는 1마리만 있으며 10cm 이하의 물고기가 가장 큰 경우는 없습니다." 라는 조건이 있어서 가능한 방식
--위 조건이 없다면, GROUP_CONCAT()을 활용하면 될 것 같다. 오라클에서의 LISTAGG와 같은 함수