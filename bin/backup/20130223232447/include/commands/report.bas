IF usercommand$(runcommands) = "report" THEN
    speechoutput$ = "thank you for taking the time to send us a report, please fill in the form that will pop up and it will be sent to us"
    speechprint$ = speechoutput$
    GOSUB textprint
    GOSUB speechoutput
    SHELL _DONTWAIT _HIDE "start tools\report.exe"
    usercommands = -1
END IF
