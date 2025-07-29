--https://school.programmers.co.kr/learn/courses/30/lessons/164670
--조건에 맞는 사용자 정보 조회하기

SELECT
    USER_ID,
    NICKNAME,
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS 전체주소,
    CASE
        WHEN LENGTH(TLNO) = 11 THEN CONCAT(
            SUBSTR(TLNO, 1, 3), '-',
            SUBSTR(TLNO, 4, 4), '-',
            SUBSTR(TLNO, 8, 4)
        )
        WHEN LENGTH(TLNO) = 10 THEN CONCAT(
            SUBSTR(TLNO, 1, 3), '-',
            SUBSTR(TLNO, 4, 3), '-',
            SUBSTR(TLNO, 7, 4)
        )
        ELSE TLNO
    END AS 전화번호
FROM USED_GOODS_USER
WHERE USER_ID IN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID
    HAVING COUNT(*) >= 3
)
ORDER BY USER_ID DESC

--IN() 통해서 해당 조건에 맞는 USER_ID 찾음
--문자열 나누기 SUBSTR()