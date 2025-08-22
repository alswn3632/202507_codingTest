--https://school.programmers.co.kr/learn/courses/30/lessons/132204
--취소되지 않은 진료 예약 조회하기

SELECT
    A.APNT_NO,
    P.PT_NAME,
    A.PT_NO,
    A.MCDP_CD,
    D.DR_NAME,
    A.APNT_YMD
FROM APPOINTMENT A
    INNER JOIN DOCTOR D ON D.DR_ID = A.MDDR_ID
    INNER JOIN PATIENT P ON P.PT_NO = A.PT_NO
WHERE A.APNT_CNCL_YN = 'N'
    AND D.MCDP_CD = 'CS'
    AND A.APNT_YMD >= '2022-04-13 00:00:00'
    AND A.APNT_YMD <  '2022-04-14 00:00:00'
ORDER BY A.APNT_YMD ASC

--날짜는 비교문 발고 범주로 조건 걸어주기