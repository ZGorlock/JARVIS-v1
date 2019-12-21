activity:
GOSUB keyboard
GOSUB mousepos
IF keys > 0 OR xmouse& <> oldxmouse& OR ymouse& <> oldymouse& THEN activetimer&& = jarvistimer&&
oldxmouse& = xmouse&
oldymouse& = ymouse&
RETURN