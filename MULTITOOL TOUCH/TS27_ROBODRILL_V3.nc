%
O9016(MULTI TOOL TOUCH TS27) 
(PRM 6066 = 100) 
 
G49(CANCEL TOOL OFFSET)
G5.1Q0(LOOK AHEAD OFF) 
G0G53Z0(Z HOME)
 
IF[#1EQ#0]GOTO10(NO A VALUE) 
GOTO100(JUMP TO SEQUNCE LOOP)
 
N10(INITIAL CHECK) 
IF[#4EQ#0]GOTO900(NO I OR A JUMP TO SINGLE TOOL) 
GOTO200(JUMP TO RANDOM LOOP) 
 
N100(SEQUENCE TOOL SECTION)
#170=#1(CAPTURE FIRST TOOL)
#171=#2(CAPTURE LAST TOOL) 
IF[#2EQ#0]GOTO300(IF NO LAST TOOL JUMP)
 
WHILE[#170LE#171]DO1(SEQUENCE LOOP)
G49(CANCEL TOOL OFFSET)
T#170M6(TOOL CHANGE) 
G65P9857B1.D0.(TOOL TOUCH OFF) 
#170=#170+1(INCREMENT TOOL)
G0G53Z0(Z HOME)
END1(END SEQUENCE LOOP)
GOTO9999(JUMP TO END)
 
N200(RANDOM VALUE TOUCH OFF) 
#171=4.(STARTING # VARIABLE TOOL OFFSET) 
#170=ADP[#[#171]](CAPTURE INITIAL I VALUE) 
IF[#[#171+3.]EQ#3]GOTO300(IF SINGLE TOOL JUMP) 
 
WHILE[#[#171]NE#0]DO1(RANDOM LOOP) 
G49(CANCEL TOOL OFFSET)
T#170M6(TOOL CHANGE) 
G65P9857B1.D0.(TOOL TOUCH OFF) 
G0G53Z0(Z HOME)
#171=#171+3.(INCREMENT FOR NEXT VARIABLE SET)
#170=ADP[#[#171]](CAPTURE NEW I VALUE) 
END1(END RANDOM LOOP)
GOTO9999(JUMP TO END)
 
N300(SINGLE TOOL A VALUE)
G49(CANCEL TOOL OFFSET)
T#170M6(TOOL CHANGE) 
G65P9857B1.D0.(TOOL TOUCH OFF) 
G0G53Z0(Z HOME)
GOTO9999(JUMP TO END)
 
N900(TOUCH TOOL IN SPINDLE)
#170=#4120(CAPTURE CURRENT TOOL) 
IF[#4120EQ#0]GOTO9898(JUMP IF NO T VALUE)
G49(CANCEL TOOL OFFSET)
T#170M6(TOOL CHANGE) 
G65P9857B1.D0.(TOOL TOUCH OFF) 
G0G53Z0(Z HOME)
N9999(END PROGRAM) 
G0G53Z0(Z HOME)
G49(CANCEL TOOL OFFSET)
M99(BACK TO MAIN)
 
N9898(ALARM SECTION) 
G0G53Z0(Z HOME)
#3000=1(NO HEIGHT OFFSET)
%
