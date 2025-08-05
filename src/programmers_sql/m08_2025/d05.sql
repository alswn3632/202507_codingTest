--https://school.programmers.co.kr/learn/courses/30/lessons/131123
--즐겨찾기가 가장 많은 식당 정보 출력하기

SELECT
    FOOD_TYPE,
    REST_ID,
    REST_NAME,
    FAVORITES
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY FOOD_TYPE ORDER BY FAVORITES DESC) AS rnk
    FROM REST_INFO
) ranked
WHERE rnk = 1
ORDER BY FOOD_TYPE DESC