SELECT TRUNC (hh24) daydate,
       SUM (CASE WHEN hh24 = TRUNC (hh24) THEN numswitches ELSE 0 END) AS "00",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (1 / 24) THEN numswitches ELSE 0 END) AS "01",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (2 / 24) THEN numswitches ELSE 0 END) AS "02",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (3 / 24) THEN numswitches ELSE 0 END) AS "03",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (4 / 24) THEN numswitches ELSE 0 END) AS "04",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (5 / 24) THEN numswitches ELSE 0 END) AS "05",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (6 / 24) THEN numswitches ELSE 0 END) AS "06",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (7 / 24) THEN numswitches ELSE 0 END) AS "07",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (8 / 24) THEN numswitches ELSE 0 END) AS "08",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (9 / 24) THEN numswitches ELSE 0 END) AS "09",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (10 / 24) THEN numswitches ELSE 0 END) AS "10",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (11 / 24) THEN numswitches ELSE 0 END) AS "11",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (12 / 24) THEN numswitches ELSE 0 END) AS "12",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (13 / 24) THEN numswitches ELSE 0 END) AS "13",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (14 / 24) THEN numswitches ELSE 0 END) AS "14",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (15 / 24) THEN numswitches ELSE 0 END) AS "15",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (16 / 24) THEN numswitches ELSE 0 END) AS "16",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (17 / 24) THEN numswitches ELSE 0 END) AS "17",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (18 / 24) THEN numswitches ELSE 0 END) AS "18",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (19 / 24) THEN numswitches ELSE 0 END) AS "19",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (20 / 24) THEN numswitches ELSE 0 END) AS "20",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (21 / 24) THEN numswitches ELSE 0 END) AS "21",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (22 / 24) THEN numswitches ELSE 0 END) AS "22",
       SUM (CASE WHEN hh24 = TRUNC (hh24) + (23 / 24) THEN numswitches ELSE 0 END) AS "23"
  FROM (SELECT TRUNC (l.first_time, 'hh24') AS hh24, COUNT (*) AS numswitches
          FROM v$log_history l
        GROUP BY TRUNC (l.first_time, 'hh24'))
GROUP BY TRUNC (hh24)
ORDER BY TRUNC (hh24) DESC