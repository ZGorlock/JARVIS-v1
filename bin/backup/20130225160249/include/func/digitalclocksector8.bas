FUNCTION DigitalClockSector8 (x, y, colour)
PSET (x, y), colour
DRAW "BR8 BD10 D2 BD1 BR1 U4 R1 D4 BR1 BU1 U2"
PSET (x, y), 0
END FUNCTION