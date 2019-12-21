DO
    highest = 0
    FOR elementcheck = 1 TO NumOfElement
        elecheck = Compare(elements$(elementcheck, 1), userinput$(runinput))
        IF elecheck > highest THEN
            highest = elecheck
            elechecknum = elementcheck
        END IF
    NEXT elementcheck
    IF highest < 85 THEN EXIT DO
    speechoutput$ = ""
    FOR checkspec = 1 TO userinputs
        spec$ = userinput$(checkspec)
        SELECT CASE spec$
            CASE "abbreviation", "symbol"
                speechoutput$ = elements$(elechecknum, 2)
            CASE "number", "proton", "protons", "electron", "electrons"
                speechoutput$ = elements$(elechecknum, 3)
            CASE "weight", "mass"
                speechoutput$ = elements$(elechecknum, 4)
            CASE "melting", "melt"
                spec$ = "melting point"
                speechoutput$ = elements$(elechecknum, 5)
            CASE "boiling", "boil"
                spec$ = "boiling point"
                speechoutput$ = elements$(elechecknum, 6)
            CASE "density", "dense"
                speechoutput$ = elements$(elechecknum, 7)
            CASE "state", "phase"
                spec$ = spec$ + " at room temperature"
                speechoutput$ = elements$(elechecknum, 8)
            CASE "classification", "class"
                spec$ = "elemental " + spec$
                speechoutput$ = elements$(elechecknum, 9)
            CASE "period", "row"
                spec$ = spec$ + " number"
                speechoutput$ = elements$(elechecknum, 10)
            CASE "group", "column"
                IF spec$ = "group" THEN
                    oldspec$ = spec$
                    spec$ = userinput$(checkspec + 1)
                    SELECT CASE spec$
                        CASE "number"
                            spec$ = "group number"
                            speechoutput$ = elements$(elechecknum, 11)
                        CASE "name"
                            spec$ = "group name"
                            speechoutput$ = elements$(elechecknum, 12)
                    END SELECT
                END IF
                IF speechoutput$ = "" THEN
                    spec$ = spec$ + " number"
                    speechoutput$ = elements$(elechecknum, 11)
                END IF
            CASE "crust", "crustal"
                spec$ = "estimated crustal abundance"
                speechoutput$ = elements$(elechecknum, 13)
            CASE "oceanic", "ocean"
                spec$ = "estimated oceanic abundance"
                speechoutput$ = elements$(elechecknum, 14)
            CASE "isotopes", "isotope", "stable"
                spec$ = "number of stable isotopes"
                speechoutput$ = elements$(elechecknum, 15)
            CASE "ionization", "ion", "energy"
                spec$ = "ionization energy"
                speechoutput$ = elements$(elechecknum, 16)
            CASE "oxidation"
                spec$ = "oxidation states"
                speechoutput$ = elements$(elechecknum, 17)
            CASE "configuration", "shell"
                spec$ = "electron shell configuration"
                speechoutput$ = elements$(elechecknum, 18)
            CASE "origin", "etymology"
                speechoutput$ = elements$(elechecknum, 19)
            CASE "history", "uses", "use"
                speechoutput$ = elements$(elechecknum, 20)
        END SELECT
        IF speechoutput$ > "" THEN
            speechoutput$ = "The " + spec$ + " of " + elements$(elechecknum, 1) + " is " + speechoutput$
            EXIT FOR
        END IF
    NEXT checkspec
    IF speechoutput$ = "" THEN speechoutput$ = "For the element " + elements$(elechecknum, 1) + ", symbol is " + elements$(elechecknum, 2) + ", atomic number is " + elements$(elechecknum, 3) + ", atomic weight is " + elements$(elechecknum, 4) + ", melting point is " + elements$(elechecknum, 5) + ", boiling point is " + elements$(elechecknum, 6) + ", density is " + elements$(elechecknum, 7) + ", phase at room temperature is " + elements$(elechecknum, 8) + ", elemental classification is " + elements$(elechecknum, 9) + ", period number is " + elements$(elechecknum, 10) + ", group number is " + elements$(elechecknum, 11) + ", group name is " + elements$(elechecknum, 12) + ", estimated crustal abundance is " + elements$(elechecknum, 13) + ", estimated oceanic abundance is " + elements$(elechecknum, 14) + ", number of stable isotopes is " + elements$(elechecknum, 15) + ", ionization energy is " + elements$(elechecknum, 16) + ", oxidation states is " + elements$(elechecknum, 17) + ", electron shell configuration is " + elements$(elechecknum, 18) + ", origin is " + elements$(elechecknum, 19) + ", history and uses: " + elements$(elechecknum, 20)
    speechprint$ = speechoutput$
    speechcopy$ = UCASE$(elements$(elechecknum, 1)) + CHR$(13) + "Symbol: " + elements$(elechecknum, 2) + CHR$(13) + "Atomic Number: " + elements$(elechecknum, 3) + CHR$(13) + "Atomic Weight: " + elements$(elechecknum, 4) + CHR$(13) + "Melting Point: " + elements$(elechecknum, 5) + CHR$(13) + "Boiling Point: " + elements$(elechecknum, 6) + CHR$(13) + "Density: " + elements$(elechecknum, 7) + CHR$(13) + "Phase at Room Temperature: " + elements$(elechecknum, 8) + CHR$(13) + "Elemental Classification: " + elements$(elechecknum, 9) + CHR$(13) + "Period Number: " + elements$(elechecknum, 10) + CHR$(13) + "Group Number: " + elements$(elechecknum, 11) + CHR$(13) + "Group Name: " + elements$(elechecknum, 12) + CHR$(13) + "Estimated Crustal Abundance: " + elements$(elechecknum, 13) + CHR$(13) + "Estimated Oceanic Abundance: " + elements$(elechecknum, 14) + CHR$(13) + "Number of Stable Isotopes: " + elements$(elechecknum, 15) + CHR$(13) + "Ionization Energy: " + elements$(elechecknum, 16) + CHR$(13) + "Oxidation States: " + elements$(elechecknum, 17) + CHR$(13) + "Electron Shell Configuration: " + elements$(elechecknum, 18) + CHR$(13) + "Origin of Name: " + elements$(elechecknum, 19) + CHR$(13) + "History and Uses: " + elements$(elechecknum, 20)
    GOSUB textprint
    GOSUB speechoutput
    usercommands = -1
    EXIT DO
LOOP