--https://school.programmers.co.kr/learn/courses/30/lessons/157340
--자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기

SELECT
    CAR_ID,
    CASE
        WHEN SUM(CASE
                    WHEN START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16'
                    THEN 1 ELSE 0
                 END) > 0
        THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY CAR_ID
ORDER BY CAR_ID DESC

--"SUM(CASE WHEN 조건 THEN 1 ELSE 0 END)"을 통해 조건을 만족하는 행이 하나라도 존재하는지 확인한다.