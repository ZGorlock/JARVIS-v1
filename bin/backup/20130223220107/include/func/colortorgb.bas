FUNCTION colortorgb& (c)
SELECT CASE c
    CASE 0
        r = 0
        g = 0
        b = 0
    CASE 1
        r = 0
        g = 0
        b = 168
    CASE 2
        r = 0
        g = 168
        b = 0
    CASE 3
        r = 0
        g = 168
        b = 168
    CASE 4
        r = 168
        g = 0
        b = 0
    CASE 5
        r = 168
        g = 0
        b = 168
    CASE 6
        r = 168
        g = 84
        b = 0
    CASE 7
        r = 168
        g = 168
        b = 168
    CASE 8
        r = 84
        g = 84
        b = 84
    CASE 9
        r = 84
        g = 84
        b = 252
    CASE 10
        r = 84
        g = 252
        b = 84
    CASE 11
        r = 84
        g = 252
        b = 252
    CASE 12
        r = 252
        g = 84
        b = 84
    CASE 13
        r = 252
        g = 84
        b = 252
    CASE 14
        r = 252
        g = 252
        b = 84
    CASE 15
        r = 252
        g = 252
        b = 252
END SELECT
colortorgb& = _RGB32(r, g, b)
END FUNCTION