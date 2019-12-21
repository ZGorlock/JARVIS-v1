speechoutput:
IF speechsetup = 0 THEN
    txt2guid _OFFSET(CLSID_SpVoice), "96749377-3391-11D2-9EE3-00C04F797396"
    txt2guid _OFFSET(IID_ISpVoice), "6C44DF74-72B9-4992-A1EC-EF996E0422D4"
    txt2guid _OFFSET(CLSID_SpSharedRecoContext), "47206204-5ECA-11D2-960F-00C04F8EE628"
    txt2guid _OFFSET(IID_ISpRecoContext), "F740A62F-7C15-489E-8234-940A33D9272D"
    COMinit& = -1
    Voiceinit& = -1
    Graminit& = -1
    Recinit& = -1
    COMinit& = CoInitializeEx(0, COINIT_MULTITHREADED OR COINIT_SPEED_OVER_MEMORY)
    checkHR COMinit&, -1, "CoInitializeEx"
    Voiceinit& = CoCreateInstance(_OFFSET(CLSID_SpVoice), 0, CLSCTX_ALL, _OFFSET(IID_ISpVoice), _OFFSET(pVoice%&))
    checkHR Voiceinit&, -1, "CoCreateInstance"
    Recinit& = CoCreateInstance(_OFFSET(CLSID_SpSharedRecoContext), 0, CLSCTX_ALL, _OFFSET(IID_ISpRecoContext), _OFFSET(pReco%&))
    checkHR Recinit&, -1, "CoCreateInstance"
    Graminit& = dABSOLUTEpqp(peekp(peekp(pReco%&) + 56), pReco%&, 0, _OFFSET(pGrammar%&))
    checkHR hr&, -1, "CreateGrammar"
    hr& = dABSOLUTEppd(peekp(peekp(pGrammar%&) + 80), pGrammar%&, 0, 0)
    checkHR hr&, -1, "LoadDictation"
    hr& = dABSOLUTEpd(peekp(peekp(pGrammar%&) + 88), pGrammar%&, 1)
    checkHR hr&, -1, "SetDictationState"
    dwFlags~& = 1
    speechsetup = 1
END IF
IF speechoutput$ <> "" THEN
    ut$ = MKI$(0)
    FOR i& = LEN(speechoutput$) TO 1 STEP -1
        ut$ = MKI$(ASC(MID$(speechoutput$, i&, 1))) + ut$
    NEXT
    ut$ = ut$ + MKI$(0)
    hr& = dABSOLUTEppdp(peekp(peekp(pVoice%&) + 80), pVoice%&, _OFFSET(ut$), dwFlags~&, 0)
    IF 0 > hr& THEN
        error$ = "Speak failed: 0x" + hexd(hr&)
        GOSUB xcleanup
    END IF
    outputrecord = outputrecord + 1
    outputrecord$(outputrecord) = speechprint$
    speechoutput$ = ""
END IF
hr& = dABSOLUTEppp(peekp(peekp(pVoice%&) + 88), pVoice%&, _OFFSET(voiceStatus), 0)
checkHR hr&, 0, "GetStatus"
IF VAL(hexd(voiceStatus.dwRunningState)) = 1 THEN
    nowspeaking = 0
ELSE
    nowspeaking = 1
    startactive = TIMER
END IF
RETURN