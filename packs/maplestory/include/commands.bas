OPEN "packs\maplestory\data\commands.txt" FOR INPUT AS #1
DO
    packcommands = packcommands + 1
    commandcount = commandcount + 1
    LINE INPUT #1, inputcommand$
    packcommands$(packcommands) = inputcommand$
    commands$(commandcount) = inputcommand$
LOOP UNTIL EOF(1) = -1
CLOSE #1