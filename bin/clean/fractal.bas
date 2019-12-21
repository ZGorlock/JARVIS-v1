_TITLE "Fractal"
SCREEN 13
icon = _LOADIMAGE("..\resources\jarvis.png")
_ICON icon
OPEN "..\temp\fractaltype.tmp" FOR INPUT AS #1
INPUT #1, selecter
CLOSE #1
IF selecter = 5 THEN
    RANDOMIZE TIMER
    selecter = INT(RND * 5)
END IF
SELECT CASE selecter
    CASE 0 'david
        SCREEN 12
        RANDOMIZE TIMER
        cr = INT(RND * 1200 - 600) / 1000
        DO
            RANDOMIZE TIMER
            ct = INT(RND * 1200 - 600) / 1000
            IF (ct > cr AND (cr < 0 AND ct < 0)) THEN
                xa = 1
                EXIT DO
            END IF
            IF (ct < cr AND (cr > 0 AND ct > 0)) THEN
                xa = 2
                EXIT DO
            END IF
        LOOP
        ar = 1
        DO
            k$ = INKEY$
            _LIMIT 10
            IF ar = 1 AND xa = 1 THEN cr = cr + .001
            IF ar = 2 AND xa = 2 THEN cr = cr - .001
            IF ar = 1 AND cr >= ct THEN ar = 2
            IF ar = 2 AND cr <= ct THEN ar = 1
            FOR ix = 1 TO 640
                FOR iy = 1 TO 480
                    zor = ix / 200 - 1.6
                    zoi = iy / 220 - 1.1
                    ci = cr
                    WHILE ABS(zoi) - ABS(ci) < 2 AND ABS(zor) - ABS(cr) < 2 AND k < 32
                        znr = zor * zor - zoi * zoi + cr
                        zni = 2 * zoi * zor + ci
                        zor = znr
                        zoi = zni
                        k = k + 1
                    WEND
                    IF k < 4 THEN k = 0
                    k = k MOD 16
                    PSET (ix, iy), k
                    zoi = 0
                    zor = 0
                    k = 0
                NEXT iy
            NEXT ix
            LOCATE 1, 1
            COLOR 15, 0
            PRINT cr
            _DISPLAY
        LOOP UNTIL k$ <> ""
    CASE 1 'DeeBee
        hScreen& = _NEWIMAGE(1000, 700, 32)
        SCREEN hScreen&
        _SCREENMOVE _MIDDLE
        xx = 0
        yy = 0
        Green& = _RGB(0, 128, 0)
        RANDOMIZE TIMER
        FOR i& = 1 TO 1000000
            rr = RND
            IF rr <= 0.1 THEN
                AA = 0
                BB = 0
                CC = 0
                DD = 0.16
                EE = 0
                FF = 0
            ELSEIF rr > 0.1 AND rr <= 0.86 THEN
                AA = .85
                BB = .04
                CC = -.04
                DD = .85
                EE = 0
                FF = 1.6
            ELSEIF rr > 0.86 AND rr <= 0.93 THEN
                AA = .2
                BB = -.26
                CC = .23
                DD = .22
                EE = 0
                FF = 1.6
            ELSE
                AA = -.15
                BB = .28
                CC = .26
                DD = .24
                EE = 0
                FF = .44
            END IF
            newX = AA * xx + BB * yy + EE
            newY = CC * xx + DD * yy + FF
            xx = newX
            yy = newY
            LINE (16 + 96 * yy, 300 + 96 * xx)-(16 + 96 * yy, 300 + 96 * xx), Green&
        NEXT i&
    CASE 2 'DarthWho
        SCREEN 12
        DIM a(100), b(100), c(100), d(100), e(100), f(100)
        RANDOMIZE TIMER
        fractal = INT(RND * 3 + 1)
        DATA .5,0,0,.5,0,0
        DATA .5,0,0,.5,.5,0
        DATA .5,0,0,.5,0,.5
        DATA 0,-.5,.5,0,.5,0
        DATA 0,.5,-.5,0,.5,0
        DATA .5,0,0,.5,.25,.5
        DATA 0,.577,-.577,0,.0951,.5893
        DATA 0,.577,-.577,0,.4219,.7893
        DATA 0,.577,-.577,0,.0951,.9893
        left = 40
        w = 400
        wl = w + left
        xleft(level) = 0
        yleft(level) = 0
        xright(level) = w
        yright(level) = 0
        xtop(level) = .5 * w
        ytop(level) = w
        parts = 3
        FOR j = 1 TO fractal
            FOR I = 1 TO parts
                READ a(I)
                READ b(I)
                READ c(I)
                READ d(I)
                READ e(I)
                READ f(I)
                e(I) = e(I) * w
                f(I) = f(I) * w
            NEXT I
        NEXT
        CLS
        DO
            k$ = INKEY$
            map = RND * 3
            x2 = a(map) * x + b(map) * y + e(map)
            y2 = c(map) * x + d(map) * y + f(map)
            x = x2
            y = y2
            PSET (x, y), POINT(x, y) + 1
        LOOP UNTIL k$ <> ""
    CASE 3 'Mrwhy
        SCREEN 12
        DEFDBL A-Z
        DIM a(1000), b(1000)
        RANDOMIZE TIMER
        r = INT(RND * 1000 + 1000) / 1000
        DO
            RANDOMIZE TIMER
            m = INT(RND * 2500 + 1000) / 1000
        LOOP UNTIL m > r
        p2 = 8 * ATN(1)
        DO
            k$ = INKEY$
            RANDOMIZE TIMER
            FOR j = 1 TO m
                a(j) = SIN(p2 * j / m)
                b(j) = COS(p2 * j / m)
            NEXT j
            x = RND
            y = RND
            WHILE q < 100
                n = n + 1
                j = INT(m * RND) + 1
                IF n MOD 2 = 1 THEN
                    xx = x / r + b(j)
                    yy = y / r + a(j)
                    x = xx: y = yy
                ELSE
                    xx = (x * x - y * y) / r + b(j)
                    yy = 2 * x * y / r + a(j)
                    x = xx / r: y = yy / r
                END IF
                PSET (110 * (x + 3), 90 * (y + 3)), TIMER * 3
                q = q + .0002
            WEND
            r = r + .01
            q = 0
            LOCATE 1, 1
            PRINT USING "##.##"; r, m
            IF r > m THEN
                DO
                    k$ = INKEY$
                LOOP UNTIL k$ <> ""
            END IF
        LOOP UNTIL k$ <> ""
    CASE 4 'Mrwhy
        SCREEN 12
        DEFINT I-K
        FOR ix = 1 TO 640
            FOR iy = 1 TO 480
                cr = (ix - 430) / 215
                ci = (iy - 240) / 200
                WHILE (ABS(zoi) - ABS(ci) + ABS(zor) - ABS(cr) < 25) AND k < 128
                    znr = zor * zor - zoi * zoi + cr
                    zni = 2 * zoi * zor + ci
                    zor = znr
                    zoi = zni
                    k = k + 1
                WEND
                IF k < 8 THEN k = 1
                WHILE k > 16
                    k = k - 16
                WEND
                PSET (ix, iy), k
                zoi = 0
                zor = 0
                k = 0
            NEXT iy
        NEXT ix
END SELECT
DO
    k$ = INKEY$
LOOP UNTIL k$ <> ""
SYSTEM