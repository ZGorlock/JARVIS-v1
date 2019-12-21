DECLARE DYNAMIC LIBRARY "kernel32"
    FUNCTION GetLastError~& ()
    FUNCTION MultiByteToWideChar& (BYVAL CodePage~&, BYVAL dwFlags~&, BYVAL lpMultiByteStr~%&, BYVAL cbMultiByte&, BYVAL lpWideCharStr~%&, BYVAL cchWideChar&)
    FUNCTION OpenProcess%& (BYVAL dwDesiredAccess~&, BYVAL bInheritHandle&, BYVAL dwProcessId~&)
    FUNCTION TerminateProcess& (BYVAL hProcess%&, BYVAL uExitCode~&)
    FUNCTION WaitForSingleObject~& (BYVAL hHandle%&, BYVAL dwMilliseconds~&)
END DECLARE
DECLARE DYNAMIC LIBRARY "ole32"
    FUNCTION CoCreateInstance& (BYVAL rclsid%&, BYVAL pUnkOuter%&, BYVAL dwClsContext&, BYVAL riid%&, BYVAL ppv%&)
    FUNCTION CoInitializeEx& (BYVAL pvReserved%&, BYVAL dwCoInit~&)
    SUB CoTaskMemFree (BYVAL pv%&)
    SUB CoUninitialize ()
END DECLARE
DECLARE CUSTOMTYPE LIBRARY "..\lib\peekpoke"
    FUNCTION peekb~%% (BYVAL p~%&)
    FUNCTION peekw~% (BYVAL p~%&)
    FUNCTION peekd~& (BYVAL p~%&)
    FUNCTION peekp~%& (BYVAL p~%&)
    FUNCTION peekq~&& (BYVAL p~%&)
    SUB pokeb (BYVAL p~%&, BYVAL n~%%)
    SUB pokew (BYVAL p~%&, BYVAL n~%)
    SUB poked (BYVAL p~%&, BYVAL n~&)
    SUB pokep (BYVAL p~%&, BYVAL n~%&)
    SUB pokeq (BYVAL p~%&, BYVAL n~&&)
END DECLARE
DECLARE DYNAMIC LIBRARY "powrprof"
    FUNCTION SetSuspendState
END DECLARE
DECLARE CUSTOMTYPE LIBRARY "..\lib\text_speak_qb64"
    FUNCTION dABSOLUTEpdddpp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&, BYVAL v2~&, BYVAL v3~&, BYVAL v4%&, BYVAL v5%&)
    FUNCTION dABSOLUTEpdpp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&, BYVAL v2%&, BYVAL v3%&)
    FUNCTION dABSOLUTEpd~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&)
    FUNCTION dABSOLUTEppdp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1%&, BYVAL v2~&, BYVAL v3%&)
    FUNCTION dABSOLUTEppd~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1%&, BYVAL v2~&)
    FUNCTION dABSOLUTEppp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1%&, BYVAL v2%&)
    FUNCTION dABSOLUTEpqp~& (BYVAL pf%&, BYVAL v0%&, BYVAL v1~&&, BYVAL v2%&)
    FUNCTION dABSOLUTEp~& (BYVAL pf%&, BYVAL v0%&)
    SUB vABSOLUTEp ALIAS dABSOLUTEp (BYVAL pf%&, BYVAL v0%&)
END DECLARE
DECLARE DYNAMIC LIBRARY "user32"
    FUNCTION CloseWindow (BYVAL hWnd%&)
    FUNCTION DefWindowProcA& (BYVAL hwnd&, BYVAL wMsg&, BYVAL wParam&, BYVAL lParam&)
    FUNCTION GetCursorPos (BYVAL lpPoint%&)
    FUNCTION GetDesktopWindow%& ()
    FUNCTION GetForegroundWindow%& ()
    FUNCTION GetWindowThreadProcessId~& (BYVAL hWnd%&, BYVAL lpdwProcessId%&)
    FUNCTION GetSystemMetrics (BYVAL nIndex~&)
    FUNCTION LockWorkStation
    FUNCTION OpenInputDesktop%& (BYVAL dwFlags%&, BYVAL fInherit%&, BYVAL dwDesiredAccess%&)
    FUNCTION SendMessageA& (BYVAL hwnd&, BYVAL wMsg&, BYVAL wParam&, BYVAL lParam&)
    FUNCTION SendMessageTimeoutW%& (BYVAL hWnd%&, BYVAL Msg~&, BYVAL wParam%&, BYVAL lParam%&, BYVAL fuFlags~&, BYVAL uTimeout~&, BYVAL lpdwResult%&)
    FUNCTION SetThreadDesktop%& (BYVAL hDesktop%&)
    FUNCTION SystemParametersInfoW& (BYVAL uiAction~&, BYVAL uiParam~&, BYVAL pvParam%&, BYVAL fWinlni~&)
END DECLARE
DECLARE LIBRARY
    FUNCTION GetAsyncKeyState (BYVAL vkey~&)
END DECLARE
DECLARE CUSTOMTYPE LIBRARY
    FUNCTION FindWindow& (BYVAL ClassName%&, WindowName$)
    FUNCTION peekpoke_strnlen~%& ALIAS "strnlen" (BYVAL str~%&, BYVAL numberOfElements~%&)
    FUNCTION ShowWindow& (BYVAL hwnd&, BYVAL nCmdShow&)
    SUB memcpy (BYVAL dest~%&, BYVAL src~%&, BYVAL count~%&)
    SUB peekpoke_memcpy ALIAS "memcpy" (BYVAL dest~%&, BYVAL src~%&, BYVAL count~%&)
END DECLARE