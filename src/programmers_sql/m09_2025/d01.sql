--https://school.programmers.co.kr/learn/courses/30/lessons/131116
--식품분류별 가장 비싼 식품의 정보 조회하기

SELECT
    F1.CATEGORY,
    F1.PRICE AS MAX_PRICE,
    F1.PRODUCT_NAME
FROM FOOD_PRODUCT F1
WHERE
    F1.PRICE = (
    SELECT MAX(F2.PRICE)
    FROM FOOD_PRODUCT F2
    WHERE F2.CATEGORY = F1.CATEGORY)
        AND CATEGORY IN ('과자', '국', '김치', '식용유')
ORDER BY MAX_PRICE DESC