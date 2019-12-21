FUNCTION MonthToNum (month$)
SELECT CASE UCASE$(month$)
    CASE "JAN", "JAN.", "JANUARY"
        MonthToNum = 1
    CASE "FEB", "FEB.", "FEBRUARY"
        MonthToNum = 2
    CASE "MAR", "MAR.", "MARCH"
        MonthToNum = 3
    CASE "APR", "APR.", "APRIL"
        MonthToNum = 4
    CASE "MAY"
        MonthToNum = 5
    CASE "JUN", "JUN.", "JUNE"
        MonthToNum = 6
    CASE "JUL", "JUL.", "JULY"
        MonthToNum = 7
    CASE "AUG", "AUG.", "AUGUST"
        MonthToNum = 8
    CASE "SEP", "SEP.", "SEPTEMBER"
        MonthToNum = 9
    CASE "OCT", "OCT.", "OCTOBER"
        MonthToNum = 10
    CASE "NOV", "NOV.", "NOVEMBER"
        MonthToNum = 11
    CASE "DEC", "DEC.", "DECEMBER"
        MonthToNum = 12
    CASE ELSE
        MonthToNum = 0
END SELECT
END FUNCTION