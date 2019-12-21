FUNCTION HTMLConvResChar$ (text$)
DO
    savetext$ = text$
    IF INSTR(text$, "&#34;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#34;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&#34;") + 5))
    IF INSTR(text$, "&#38;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#38;") - 1)) + "&" + MID$(text$, (INSTR(text$, "&#38;") + 5))
    IF INSTR(text$, "&#39;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#39;") - 1)) + "'" + MID$(text$, (INSTR(text$, "&#39;") + 5))
    IF INSTR(text$, "&#60;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#60;") - 1)) + "<" + MID$(text$, (INSTR(text$, "&#60;") + 5))
    IF INSTR(text$, "&#62;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#62;") - 1)) + ">" + MID$(text$, (INSTR(text$, "&#62;") + 5))
    IF INSTR(text$, "&#174;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#174;") - 1)) + MID$(text$, (INSTR(text$, "&#174;") + 6))
    IF INSTR(text$, "&#225;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#225;") - 1)) + CHR$(160) + MID$(text$, (INSTR(text$, "&#225;") + 6))
    IF INSTR(text$, "&#233;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#233;") - 1)) + CHR$(130) + MID$(text$, (INSTR(text$, "&#233;") + 6))
    IF INSTR(text$, "&#960;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#960;") - 1)) + "3.14" + MID$(text$, (INSTR(text$, "&#960;") + 6))
    IF INSTR(text$, "&#8211;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8211;") - 1)) + "-" + MID$(text$, (INSTR(text$, "&#8211;") + 7))
    IF INSTR(text$, "&#8217;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8217;") - 1)) + "'" + MID$(text$, (INSTR(text$, "&#8217;") + 7))
    IF INSTR(text$, "&#8220;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8220;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&#8220;") + 7))
    IF INSTR(text$, "&#8221;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&#8221;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&#8221;") + 7))
    IF INSTR(text$, "&amp;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&amp;") - 1)) + "&" + MID$(text$, (INSTR(text$, "&amp;") + 5))
    IF INSTR(text$, "&apos;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&apos;") - 1)) + "'" + MID$(text$, (INSTR(text$, "&apos;") + 6))
    IF INSTR(text$, "&gt;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&gt;") - 1)) + ">" + MID$(text$, (INSTR(text$, "&gt;") + 4))
    IF INSTR(text$, "&lt;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&lt;") - 1)) + "<" + MID$(text$, (INSTR(text$, "&lt;") + 4))
    IF INSTR(text$, "&nbsp;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&nbsp;") - 1)) + " " + MID$(text$, (INSTR(text$, "&nbsp;") + 6))
    IF INSTR(text$, "&quot;") > 0 THEN text$ = MID$(text$, 1, (INSTR(text$, "&quot;") - 1)) + CHR$(34) + MID$(text$, (INSTR(text$, "&quot;") + 6))
LOOP UNTIL text$ = savetext$
HTMLConvResChar$ = text$
END FUNCTION