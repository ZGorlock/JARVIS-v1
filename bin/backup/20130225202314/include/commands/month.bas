IF usercommand$(runcommands) = "month" THEN
    month$ = LEFT$(DATE$, 2)
    month = VAL(month$)
    SELECT CASE month
        CASE 1
            monthsay$ = "January"
        CASE 2
            monthsay$ = "February"
        CASE 3
            monthsay$ = "March"
        CASE 4
            monthsay$ = "April"
        CASE 5
            monthsay$ = "May"
        CASE 6
            monthsay$ = "June"
        CASE 7
            monthsay$ = "July"
        CASE 8
            monthsay$ = "August"
        CASE 9
            monthsay$ = "September"
        CASE 10
            monthsay$ = "October"
        CASE 11
            monthsay$ = "November"
        CASE 12
            monthsay$ = "December"
    END SELECT
    speechoutput$ = "it is currently the month of " + monthsay$
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
END IF
