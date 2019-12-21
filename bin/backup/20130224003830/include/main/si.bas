ON ERROR GOTO sierr
OPEN "temp\si.tmp" FOR OUTPUT AS #3
LOCK #3
sierrpass:
ON ERROR GOTO 0