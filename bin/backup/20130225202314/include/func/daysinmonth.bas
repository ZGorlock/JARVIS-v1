FUNCTION Daysinmonth (month)
SELECT CASE month
    CASE 2
        isleap = (year MOD 4 = 0 AND year MOD 100 <> 0) OR year MOD 400 = 0
        Daysinmonth = 29 - isleap
    CASE 4, 6, 9, 11
        Daysinmonth = 30
    CASE ELSE
        Daysinmonth = 31
END SELECT
END FUNCTION