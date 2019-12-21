makesodukobg:
FOR drawx = 176 TO 464 STEP 32
    PSET (drawx, 96), 7
    DRAW "D289"
NEXT drawx
FOR drawy = 96 TO 384 STEP 32
    PSET (176, drawy), 7
    DRAW "R289"
NEXT drawy
FOR darken1x = 175 TO 463 STEP 96
    PSET (darken1x, 96), 7
    DRAW "D288"
NEXT darken1x
FOR darken2x = 177 TO 465 STEP 96
    PSET (darken2x, 96), 7
    DRAW "D288"
NEXT darken2x
FOR darken1y = 95 TO 383 STEP 96
    PSET (176, darken1y), 7
    DRAW "R288"
NEXT darken1y
FOR darken2y = 97 TO 385 STEP 96
    PSET (176, darken2y), 7
    DRAW "R288"
NEXT darken2y
PCOPY 0, 1
RETURN