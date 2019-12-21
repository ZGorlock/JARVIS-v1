FUNCTION GetRadColor& (rad, cx, a)
SELECT CASE colour
    CASE 0
        GetRadColor& = c(cx)
    CASE 1
        deg = (((rad - 50) / (200 - 50)) * 360)
        HSVtoRGB deg, 1, 1, r, g, b
        GetRadColor& = _RGBA32(r, g, b, a)
END SELECT
END FUNCTION