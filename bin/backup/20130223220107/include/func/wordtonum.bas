FUNCTION WordToNum (num$)
SELECT CASE word$
    CASE "zero"
        WordToNum = 0
    CASE "one"
        WordToNum = 1
    CASE "two"
        WordToNum = 2
    CASE "three"
        WordToNum = 3
    CASE "four"
        WordToNum = 4
    CASE "five"
        WordToNum = 5
    CASE "six"
        WordToNum = 6
    CASE "seven"
        WordToNum = 7
    CASE "eight"
        WordToNum = 8
    CASE "nine"
        WordToNum = 9
    CASE "ten"
        WordToNum = 10
    CASE "eleven"
        WordToNum = 11
    CASE "twelve"
        WordToNum = 12
    CASE "thirteen"
        WordToNum = 13
    CASE "fourteen"
        WordToNum = 14
    CASE "fifteen"
        WordToNum = 15
    CASE "sixteen"
        WordToNum = 16
    CASE "seventeen"
        WordToNum = 17
    CASE "eighteen"
        WordToNum = 18
    CASE "nineteen"
        WordToNum = 19
    CASE "twenty"
        WordToNum = 20
    CASE ELSE
        WordToNum = -1
END SELECT
END FUNCTION