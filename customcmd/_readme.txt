READ THIS ENTIRE DOCUMENT BEFORE ATTEMPTING TO CREATE YOUR OWN COMMANDS!
You really shouldn't try to make your own commands unless you have a background in QB64 or at least some form of programming, or are really abitious.

Make sure to have command words that do not conflict with the current commands, you can se a list of command words in jarvis.ini
At the first line of each command, have a line that reads like follows:

'command,new,add,delete,remove,load

but instead of those words, have the commands words that your command will use (seperated by commas, no spaces), make sure there is a remark ' at the beginning

If you make a command, feel free to send it to me, it might show up in the next update. Credits to you of course.

These are example commands from the program source, use them as references when making your own commands.


Make sure you always have this minimum:

            IF usercommand$(runcommands) = "%commandword%" THEN
                speechprint$ = speechoutput$
                GOSUB textprint
                tempclipboard$ = speechoutput$
                usercommands = -1
            END IF

and if it is asked to speak something:

            IF usercommand$(runcommands) = "%commandword%" THEN
                speechoutput$ = "%speechstring%"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                tempclipboard$ = speechoutput$
                usercommands = -1
            END IF


This one uses only one command word and sets a variable, it does not speak anything.

            IF usercommand$(runcommands) = "cyan" THEN
                textcolor = 11
                speechprint$ = speechoutput$
                GOSUB textprint
                tempclipboard$ = speechoutput$
                usercommands = -1
            END IF


This one does use speech, the speechoutput$ variable is what will be spoken.

            IF usercommand$(runcommands) = "date" THEN
                speechoutput$ = "it is currently " + DATE$
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                tempclipboard$ = speechoutput$
                usercommands = -1
            END IF


To use a SHELL command, put it in this location:

            IF usercommand$(runcommands) = "defragment" THEN
                speechoutput$ = "launching defragment tool"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                SHELL _DONTWAIT _HIDE "start %SystemRoot%\system32\dfrg.msc"
                tempclipboard$ = speechoutput$
                usercommands = -1
            END IF


You can make JARVIS inactive by setting the active variable to 0, it is set to one again when you call 'jarvis' or 'computer'. Make sure you also set status$ to "INACTIVE" if you make him inactive.

            IF usercommand$(runcommands) = "deactivate" THEN
                active = 0
                speechoutput$ = "standing by"
                status$ = "INACTIVE"
                speechprint$ = speechoutput$
                GOSUB textprint
                GOSUB speechoutput
                tempclipboard$ = speechoutput$
                usercommands = -1
            END IF


To print characters to the screen, use _SCREENPRINT in this location:
Also, set useroutputuse$ to "" if you print characters to the screen so it is ignored by the dictation command if it is enabled.
The DO LOOP is used to exit the command if there is something unacceptable, in this case 'IF usercommands <> 1 THEN EXIT DO' The command will be exited if 'delete' is not the only command that was spoken.

            IF usercommand$(runcommands) = "delete" THEN
                DO
                    IF usercommands <> 1 THEN EXIT DO
                    speechoutput$ = "deleting"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    _SCREENPRINT (CHR$(0) + CHR$(83))
                    useroutputuse$ = ""
                    tempclipboard$ = speechoutput$
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF


This is an example of how a number can be gotten from the userinput$

            IF usercommand$(runcommands) = "cosecant" THEN
                DO
                    FOR runcommands2 = 1 TO usercommands
                        FOR runcommands3 = 1 TO commandcount
                            IF usercommand$(runcommands2) = commands$(runcommands3) AND usercommand$(runcommands2) <> "cosecant" THEN EXIT DO
                        NEXT runcommands3
                    NEXT runcommands2
                    containnum = 0
                    DO
                        FOR numcheck = 1 TO userinputs
                            IF VAL(userinputcopy$(numcheck)) <> 0 THEN
                                num##(1) = VAL(userinputcopy$(numcheck))
                                containnum = 1
                                EXIT DO
                            END IF
                        NEXT numcheck
                        EXIT DO
                    LOOP
                    IF containnum = 0 THEN EXIT DO
                    containnum = 0
                    IF anglepref = 1 THEN
                        answer## = 1 / (SIN((num##(1) * ((4 * (ATN(1))) / 180))))
                        speechoutput$ = STR$(answer##) + " degrees"
                    END IF
                    IF anglepref = 0 THEN
                        answer## = 1 / (SIN(num##(1)))
                        speechoutput$ = STR$(answer##) + " radians"
                    END IF
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    tempclipboard$ = speechoutput$
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF


To use multiple words in a command use runcommands2 as the counter:
Also, make sure you use a DO LOOP so you can exit the command in certain circumstances.

            IF usercommand$(runcommands) = "degree" OR usercommand$(runcommands) = "degrees" THEN
                DO
                    FOR runcommands2 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "set" THEN
                            anglepref = 1
                            speechoutput$ = "setting angles to degree"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            tempclipboard$ = speechoutput$
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands2
                    EXIT DO
                LOOP
            END IF


You can have it check for multiple words, but if it doesnt find it then execute a different function.
In this example, if you use the commands 'desktop' and 'open' then it will open you desktop folder, but if you do not use 'open' then it will show the desktop.

            IF usercommand$(runcommands) = "desktop" THEN
                DO
                    FOR runcommands2 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "open" OR usercommand$(runcommands2) = "explore" THEN
                            speechoutput$ = "opening desktop"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            SHELL _DONTWAIT _HIDE "start shell:Desktop"
                            tempclipboard$ = speechoutput$
                            usercommands = -1
                            EXIT DO
                        END IF
                    NEXT runcommands2
                    speechoutput$ = "showing desktop"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start showdesktop.scf"
                    tempclipboard$ = speechoutput$
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF


You can get JARVISboard to pop up and ask for an input like this:
request$ is the variable of the question JARVISboard will ask you, PRINT it to #jarvisboard
Usually you would want to wait for a response, the DO LOOP
response$ is the variable INPUTed from #jarvisboard, you can do whatever you want with it after that, if the query was blank, it JARVISboard returns CHR$(255)

            IF usercommand$(runcommands) = "favorite" OR usercommand$(runcommands) = "favorites" THEN
                DO
                    FOR runcommands2 = 1 TO usercommands
                        IF usercommand$(runcommands2) = "add" THEN
                            request$ = "Enter the website you want to favorite" + CHR$(13) + "ex/ 'http://www.google.com'"
                            PRINT #jarvisboard, request$
                            speechoutput$ = "Enter the data for the website into the box, when you are done press Enter, if the box is empty the query will be discarded"
                            speechprint$ = speechoutput$
                            GOSUB textprint
                            GOSUB speechoutput
                            tempclipboard$ = speechoutput$
                            usercommands = -1
                            DO
                                _LIMIT 1
                                INPUT #jarvisboard, response$
                            LOOP UNTIL response$ <> ""
                            IF response$ <> CHR$(255) THEN
                                webaddress$ = response$
                                request$ = "Enter the title of the favorite" + CHR$(13) + "ex/ 'Google'"
                                PRINT #jarvisboard, request$
                                DO
                                    _LIMIT 1
                                    INPUT #jarvisboard, response$
                                LOOP UNTIL response$ <> ""
                                IF response$ <> CHR$(255) THEN
                                    webname$ = response$
                                    speechoutput$ = "Adding favorite '" + webname$ + "' target '" + webaddress$ + "'"
                                    speechprint$ = speechoutput$
                                    GOSUB textprint
                                    GOSUB speechoutput
                                    SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\nircmd.exe" + CHR$(34) + " urlshortcut " + CHR$(34) + webaddress$ + CHR$(34) + " " + CHR$(34) + "~$folder.favorites$\Links" + CHR$(34) + " " + CHR$(34) + webname$ + CHR$(34)
                                    tempclipboard$ = speechoutput$
                                END IF
                            END IF
                            EXIT DO
                        END IF
                    NEXT runcommands2
                    speechoutput$ = "opening favorites"
                    speechprint$ = speechoutput$
                    GOSUB textprint
                    GOSUB speechoutput
                    SHELL _DONTWAIT _HIDE "start shell:Favorites"
                    tempclipboard$ = speechoutput$
                    usercommands = -1
                    EXIT DO
                LOOP
            END IF


Here is an example of a more complex command that uses several of the previous statements:

            IF usercommand$(runcommands) = "drive" THEN
                DO
                    FOR drivevol = 97 TO 122
                        IF INSTR(useroutput$, (" " + CHR$(drivevol) + " ")) <> 0 OR INSTR(useroutput$, (CHR$(drivevol) + ".")) <> 0 OR INSTR(useroutput$, (" " + CHR$(drivevol))) = (LEN(useroutput$) - 1) THEN
                            drivevol$ = CHR$(drivevol) + ":"
                            FOR runcommands2 = 1 TO usercommands
                                IF usercommand$(runcommands2) = "open" OR usercommand$(runcommands2) = "explore" THEN
                                    DO
                                        FOR runcommands3 = 1 TO usercommands
                                            IF usercommand$(runcommands3) = "door" THEN
                                                DO
                                                    FOR runcommands4 = 1 TO usercommands
                                                        IF usercommand$(runcommands4) = "close" OR usercommand$(runcommands4) = "shut" THEN
                                                            speechoutput$ = "shutting door to " + drivevol$
                                                            speechprint$ = speechoutput$
                                                            GOSUB textprint
                                                            GOSUB speechoutput
                                                            SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\nircmd.exe" + CHR$(34) + " cdrom close " + drivevol$
                                                            tempclipboard$ = speechoutput$
                                                            usercommands = -1
                                                            EXIT DO
                                                        END IF
                                                    NEXT runcommands4
                                                    speechoutput$ = "opening door to " + drivevol$
                                                    speechprint$ = speechoutput$
                                                    GOSUB textprint
                                                    GOSUB speechoutput
                                                    SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\nircmd.exe" + CHR$(34) + " cdrom open " + drivevol$
                                                    tempclipboard$ = speechoutput$
                                                    usercommands = -1
                                                    EXIT DO
                                                LOOP
                                                EXIT DO
                                            END IF
                                        NEXT runcommands3
                                        speechoutput$ = "opening " + drivevol$
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        SHELL _DONTWAIT "explorer " + drivevol$
                                        tempclipboard$ = speechoutput$
                                        usercommands = -1
                                        EXIT DO
                                    LOOP
                                    EXIT DO
                                END IF
                                IF usercommand$(runcommands2) = "door" THEN
                                    DO
                                        FOR runcommands3 = 1 TO usercommands
                                            IF usercommand$(runcommands3) = "close" OR usercommand$(runcommands3) = "shut" THEN
                                                speechoutput$ = "shutting door to " + drivevol$
                                                speechprint$ = speechoutput$
                                                GOSUB textprint
                                                GOSUB speechoutput
                                                SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\nircmd.exe" + CHR$(34) + " cdrom close " + drivevol$
                                                tempclipboard$ = speechoutput$
                                                usercommands = -1
                                                EXIT DO
                                            END IF
                                        NEXT runcommands3
                                        speechoutput$ = "opening door to " + drivevol$
                                        speechprint$ = speechoutput$
                                        GOSUB textprint
                                        GOSUB speechoutput
                                        SHELL _DONTWAIT _HIDE CHR$(34) + jarvisloc$ + "\nircmd.exe" + CHR$(34) + " cdrom open " + drivevol$
                                        tempclipboard$ = speechoutput$
                                        usercommands = -1
                                        EXIT DO
                                    LOOP
                                    EXIT DO
                                END IF
                            NEXT runcommands2
                            EXIT DO
                        END IF
                    NEXT drivevol
                    EXIT DO
                LOOP
            END IF

After you write a command, ask Jarvis to 'add' 'command' and then find the txt file of your command. He will then ask you if you want to add more commands, and close himself. He will then recompile, this will incorporate the new command/commands into his code. If you no longer want a command you can ask him to 'remove' 'command' and specify, or you can do it manually by following these steps:

add:
-Close Jarvis
-Write your command in a txt file in customcmd\
-Open customcmd.bas in notepad and include the name of your file 'customcmd\x.txt'
-Open jarvis.ini and scroll to the bottom of [Command Words] and add the command words for your command
-Run compile.bat

remove:
-Close Jarvis
-Open customcmd.bas in notepad and remove the include for the name of the file 'customcmd\x.txt'
-Open jarvis.ini and scroll to the bottom of [Command Words] and remove the command words for your command
-Run compile.bat

You can change his settings parameters by changing the following variables in a command:
jarvisloc$ - the location of the jarvis folder, I would not recomend changing this
bootdate$ - the saved date of your computer's last boot, I would not recomend changing this
boottime$ - the saved time of your computer's last boot, I would not recomend changing this
boottime - the saved timer from your computer's last boot, this variable is not currently used
id$ - the id of the user, must not be changed
username$ - the name he calls you
recognition - if he listens or not, 1=listen, 0=does not listen
textcolor - the color of his text, http://qb64.net/wiki/index.php?title=COLOR
standbytoggle - if he stands by or not, 1=does not auto standby, 0=does auto standby
standbytime## - the time he waits before auto standing by if it is enabled
timepref - if you prefer 12hr or 24hr time outputs, 1=12hr time, 0=24hr time
anglepref - if you prefer radians or degrees outputs, 1=degrees, 0=radians
afirmpref - whether he tells you when he doesnt understand or not (very annoying imo) 1=afirmation, 0=no afirmation
alertpref - whether he alerts you 1=yes, 0=no
volincr - the increments that he increases or decreases your volume by X/65536
ssloc$ - the folder where he will save your screenshots
ssfile$ - the file type of your screenshots, I recommend .png
speed& - the number of loops per second preformed, I recommend 32 or 16
buffer& - cant really remember what this does, you probably shouldnt mess with it
screenx - the size in pixles of the width of your screen
screeny - the size in pixels of the height of your screen
workareax - the size in pixels of the width of the workable area of your screen
workareay - the size in pixels of the height of the workable area of your screen
screenpos - a number 1 through 9 that defines where the window will open at startup, changed using 'position'
transparency - the amount of transparency at startup, 255=no transparency, 1=full transparency
mdpath$ - the path to My Documents
downloadpath$ - the path to your Downloads folder
updatecheck - wether or not JARVIS checks for updates, 1=checks, 0=does not check
skipversion# - the version file that JARVIS is skipping updating to, if any, 0=no version skipping
You do not need to specifically write these to the jarvis.ini, the program will automatically save its settings when it is closed.

Depending on how complex your commands are you might need to add code in places other than the commands section. This can be done by maunally editing the files in include\ before a recompilation. There are 10 included files:
array.bas - contains arrays that you will need in the syntax 'REDIM a$(x)' or 'REDIM a(x)'
const.bas - contains the constants you need for your commands in the sytax 'CONST THING_ON = &H10'
customcmd.bas - this will be automatically updated when you 'load' a command in JARVIS
dim.bas - contains the DIM functions for your commands in the syntax 'DIM x as INTEGER'
func.bas - contains the functions your commands may call, it should be written just as you would a normal function
lib.bas - contains the libraries that your command might need, DECLARE the library just as you normally would
sound.bas - contains the sounds that need to be loaded for your command in the syntax 'audiofile = _SNDOPEN("audiofile.ogg")'
sub.bas - contains the subs that your commands may call, it should be written just as you would a normal sub
tcpip.bas - contains the tcp/ip connection functions that JARVIS will use to connect to other programs
type.bas - contains the TYPE declaration, write it as you normally would a TYPE declaration

DO NOT use SYSTEM to close the program, use GOSUB xcleanup, this will safely close JARVISboard, and the log, and will rewrite the settings in jarvis.ini
Unless you know what you are doing do not try to add new sectors to the jarvis.ini file, if you need to store data from one run to another, just write a seperate file.

Have fun making custom commands!