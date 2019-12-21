FUNCTION timebetween&& (y1, m1, d1, h1, n1, s1, y2, m2, d2, h2, n2, s2)
IF y2 < 0 THEN y2 = y1
IF m2 < 0 THEN m2 = m1
IF d2 < 0 THEN d2 = d1
IF h2 < 0 THEN h2 = h1
IF n2 < 0 THEN n2 = n1
IF s2 < 0 THEN s2 = s1
t1&& = (31536000 * y1)
FOR month = 1 TO (m1 - 1)
    SELECT CASE month
        CASE 2
            isleap = (y1 MOD 4 = 0 AND y1 MOD 100 <> 0) OR y1 MOD 400 = 0
            dayinmonth = 29 - isleap
        CASE 4, 6, 9, 11
            dayinmonth = 30
        CASE ELSE
            dayinmonth = 31
    END SELECT
    t1&& = t1&& + (86400 * dayinmonth)
NEXT month
t1&& = t1&& + (86400 * d1) + (3600 * h1) + (60 * n1) + s1
t2&& = (31536000 * y2)
FOR month = 1 TO (m2 - 1)
    SELECT CASE month
        CASE 2
            isleap = (y2 MOD 4 = 0 AND y2 MOD 100 <> 0) OR y2 MOD 400 = 0
            dayinmonth = 29 - isleap
        CASE 4, 6, 9, 11
            dayinmonth = 30
        CASE ELSE
            dayinmonth = 31
    END SELECT
    t2&& = t2&& + (86400 * dayinmonth)
NEXT month
t2&& = t2&& + (86400 * d2) + (3600 * h2) + (60 * n2) + s2
timebetween&& = INT(t2&& - t1&&)
END FUNCTION