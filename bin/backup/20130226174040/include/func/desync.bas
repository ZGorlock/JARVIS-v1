FUNCTION DeSync~& (value)
mask = &H7F
DO
    outv = value AND NOT mask
    outv = outv \ 2
    outv = outv OR (value AND mask)
    mask = ((mask + 1) * (2 ^ 8)) - 1
    value = outv
LOOP UNTIL mask = &H7FFFFFFF
DeSync = outv
END FUNCTION