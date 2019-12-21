tone1 = _SNDOPEN("resources\tone1.ogg", "VOL, SYNC")
tone2 = _SNDOPEN("resources\tone2.ogg", "VOL, SYNC")
tone3 = _SNDOPEN("resources\tone3.ogg", "VOL, SYNC")
defaultalarm = _SNDOPEN("resources\defaultalarm.ogg", "VOL,SYNC")
DO
    IF _FILEEXISTS("resources\alarm.mp3") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.mp3", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.ogg") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.ogg", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.wav") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.wav", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.mod") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.mod", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.voc") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.voc", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.aif") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.aif", "VOL,SYNC")
        EXIT DO
    END IF
    IF _FILEEXISTS("resources\alarm.rif") = -1 THEN
        alarm = _SNDOPEN("resources\alarm.rif", "VOL,SYNC")
        EXIT DO
    END IF
    EXIT DO
LOOP