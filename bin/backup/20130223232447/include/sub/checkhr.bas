SUB checkHR (hr&, action&, nam$)
IF hr& < 0 THEN
    error$ = nam$ + " failed. Error: 0x" + hexd(hr&)
    IF action& THEN ERROR 97
END IF
END SUB