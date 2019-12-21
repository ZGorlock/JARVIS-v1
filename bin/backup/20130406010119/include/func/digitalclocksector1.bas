FUNCTION DigitalClockSector1 (x, y, colour)
PSET (x, y), colour
DRAW "BR3 R14 BR1 BD1 L16 BD1 BR1 R14"
PSET (x, y), 0
END FUNCTION