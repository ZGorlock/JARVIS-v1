FUNCTION DigitalClockSector2 (x, y, colour)
PSET (x, y), colour
DRAW "BD3 D14 BD1 BR1 U16 BR1 BD1 D14"
PSET (x, y), 0
END FUNCTION