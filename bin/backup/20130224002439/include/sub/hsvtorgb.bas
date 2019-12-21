SUB HSVtoRGB (h, s, v, r, g, b)
r = 0
g = 0
b = 0
hi = (h / 60)
c = v * s
x = c * (1 - ABS(hi - (2 * INT(hi / 2)) - 1))
SELECT CASE INT(hi)
    CASE 0
        r = c
        g = x
    CASE 1
        r = x
        g = c
    CASE 2
        g = c
        b = x
    CASE 3
        g = x
        b = c
    CASE 4
        r = x
        b = c
    CASE 5
        r = c
        b = x
END SELECT
M = v - c
r = r + M
r = r * 255
g = g + M
g = g * 255
b = b + M
b = b * 255
END SUB