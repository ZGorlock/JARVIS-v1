TYPE GUID
    Data1 AS _UNSIGNED LONG
    Data2 AS _UNSIGNED INTEGER
    Data3 AS _UNSIGNED INTEGER
    data4 AS _UNSIGNED _INTEGER64
END TYPE
TYPE LPPOINT
    x AS _UNSIGNED LONG
    y AS _UNSIGNED LONG
END TYPE
TYPE RECT
    left AS LONG
    top AS LONG
    right AS LONG
    bottom AS LONG
END TYPE
TYPE SPEVENT
    eEventId AS _UNSIGNED INTEGER
    elParamType AS _UNSIGNED INTEGER
    ulStreamNum AS _UNSIGNED LONG
    ullAudioStreamOffset AS _UNSIGNED _INTEGER64
    wParam AS _OFFSET
    lParam AS _OFFSET
END TYPE
TYPE SPVOICESTATUS
    ulCurrentStream AS _UNSIGNED LONG
    ulLastStreamQueued AS _UNSIGNED LONG
    hrLastResult AS _UNSIGNED LONG
    dwRunningState AS _UNSIGNED LONG
    ulInputWordPos AS _UNSIGNED LONG
    ulInputWordLen AS _UNSIGNED LONG
    ulInputSentPos AS _UNSIGNED LONG
    ulInputSentLen AS _UNSIGNED LONG
    lBookmarkId AS LONG
    PhonemeId AS _UNSIGNED INTEGER
    padding AS INTEGER
    VisemeId AS LONG
    dwReserved1 AS _UNSIGNED LONG
    dwReserved2 AS _UNSIGNED LONG
END TYPE