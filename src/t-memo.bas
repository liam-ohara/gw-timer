1 CLS
2 SCREEN 0
4 ON ERROR GOTO 20000
5 CURDATE$ = RIGHT$(DATE$,4)+"-"+LEFT$(DATE$,2)+MID$(DATE$,3,3)+";"
6 RECDATE$ = CHR$(13)+RIGHT$(DATE$,4)+"-"+LEFT$(DATE$,2)+MID$(DATE$,3,3)+";"
7 RECTIME$ = TIME$+";"
8 IF HOURS% < 10 THEN HOURS$ = "0"+RIGHT$(STR$(HOURS%),1) ELSE HOURS$ = RIGHT$(STR$(HOURS%),2)
9 IF MINUTES% < 10 THEN MINUTES$ = "0"+RIGHT$(STR$(MINUTES%),1) ELSE MINUTES$ = RIGHT$(STR$(MINUTES%),2)
10 IF SECONDS% < 10 THEN SECONDS$ = "0"+RIGHT$(STR$(SECONDS%),1) ELSE SECONDS$ = RIGHT$(STR$(SECONDS%),2)
11 DURATION$ = HOURS$+":"+MINUTES$+":"+SECONDS$+";"
20 TITLE$ = "STOPWATCH MEMO"
21 LMARGIN% = (80 - LEN(TITLE$)) / 2
22 LOCATE 1, LMARGIN% : PRINT TITLE$
23 LOCATE 2, 1 : PRINT "Current record:"
24 LOCATE 4, 1 : PRINT "DATE"
25 LOCATE 4, 13 : PRINT "TIME"
26 LOCATE 4, 23 : PRINT "DURATION"
27 LOCATE 5, 1 : FOR I = 1 TO 30 : PRINT "-"; : NEXT I
28 LOCATE 6, 1 : PRINT CURDATE$
29 LOCATE 6, 13 : PRINT RECTIME$
30 LOCATE 6, 23 : PRINT DURATION$
40 COMMAND$ = "COMMANDS"
41 LMARGIN% = (80 - LEN(COMMAND$)) / 2
42 LOCATE 8, LMARGIN% : PRINT COMMAND$
50 SAVECOM$ = "(O) OPEN - Save to existing file | (N) NEW - Save to new file"
51 ABANDON$ = "(A) ABANDON - Erases record and returns to stopwatch"
60 LMARGIN% = (80 - LEN(SAVECOM$)) / 2
61 LOCATE 10, LMARGIN% : PRINT SAVECOM$
62 LMARGIN% = (80 - LEN(ABANDON$)) / 2
63 LOCATE 11, LMARGIN% : PRINT ABANDON$
70 ISWAITING% = 1
71 WHILE ISWAITING%
72 KEYPRESS$ = INKEY$
73 IF KEYPRESS$ = "O" OR KEYPRESS$ = "o" THEN ISWAITING% = 0
74 IF KEYPRESS$ = "N" OR KEYPRESS$ = "n" THEN ISWAITING% = 0
75 IF KEYPRESS$ = "A" OR KEYPRESS$ = "a" THEN ISWAITING% = 0
79 WEND
80 IF KEYPRESS$ = "O" OR KEYPRESS$ = "o" THEN GOTO 1000
81 IF KEYPRESS$ = "N" OR KEYPRESS$ = "n" THEN GOTO 5000
82 IF KEYPRESS$ = "A" OR KEYPRESS$ = "a" THEN CHAIN "timer.bas"
1000 CLS
1010 LMARGIN% = (80 - LEN(TITLE$)) / 2
1020 LOCATE 1, LMARGIN% : PRINT TITLE$
1030 OPENMODE$ = "Save record to existing file. Press (O) to open or (C) to cancel."
1040 LOCATE 2, 1 : PRINT OPENMODE$
1050 ISWAITING% = 1
1060 WHILE ISWAITING%
1070 KEYPRESS$ = INKEY$
1071 IF KEYPRESS$ = "O" OR KEYPRESS$ = "o" THEN ISWAITING% = 0
1072 IF KEYPRESS$ = "C" OR KEYPRESS$ = "c" THEN ISWAITING% = 0
1079 WEND
1080 IF KEYPRESS$ = "O" OR KEYPRESS$ = "o" THEN GOTO 1090 ELSE GOTO 1
1090 INPUT "Please enter filename (witout extension) and hit ENTER: ", FILENAME$
1091 IF LEN(FILENAME$) > 8 THEN PRINT "Filename must be <= 8 characters. Please retry.": GOTO 1090
1092 IF LEN(FILENAME$) < 1 THEN PRINT "Filename cannot be empty. Please retry.": GOTO 1090
1095 PRINT FILENAME$
1100 FILENAME$ = FILENAME$ + ".swd"
1110 OPEN "I",#1,FILENAME$
1300 TRUE% = 1
1310 TOTALROWS% = 0
1320 WHILE TRUE%
1330 IF EOF(1) THEN GOTO 1380
1340 INPUT #1,ROW$
1350 TOTALROWS% = TOTALROWS% + 1
1360 WEND
1380 CLOSE #1
1400 OPEN "R",#2,FILENAME$,80
1410 IF TOTALROWS% = 0 THEN GOSUB 7000
1420 FIELD #2,12 AS DATECOL$,9 AS TIMECOL$,9 AS DURATIONCOL$,50 AS NOTECOL$
1600 NOTE$ = ""
1610 INPUT "Please enter a note for your record (50 characters max.): ", NOTE$
1620 IF LEN(NOTE$) > 50 THEN PRINT "Filename must be <= 50 characters. Please retry.": GOTO 1610
1700 PRINT "NOTE: " + NOTE$
1710 PRINT "Confirm whether note is correct [Y/N]"
1720 ISWAITING% = 1
1730 WHILE ISWAITING%
1740 KEYPRESS$ = INKEY$
1750 IF KEYPRESS$ = "Y" OR KEYPRESS$ = "y" THEN ISWAITING% = 0
1760 IF KEYPRESS$ = "N" OR KEYPRESS$ = "n" THEN ISWAITING% = 0
1770 WEND
1780 IF KEYPRESS$ = "Y" OR KEYPRESS$ = "y" THEN GOTO 1800 ELSE GOTO 1600
1790 NOTE$ = NOTE$+CHR$(13)
1800 LSET DATECOL$ = RECDATE$
1810 LSET TIMECOL$ = RECTIME$
1820 LSET DURATIONCOL$ = DURATION$
1830 LSET NOTECOL$ = NOTE$
1900 PUT #2, (TOTALROWS%+1)
2000 PRINT "Record saved to file '" + FILENAME$ + "'."
2100 PRINT "Press any character key to return to stopwatch."
2110 ISWAITING% = 1
2120 KEYPRESS$ = ""
2120 WHILE ISWAITING%
2130 KEYPRESS$ = INKEY$
2140 IF LEN(KEYPRESS$) > 0 THEN ISWAITING% = 0
2150 WEND
2160 CHAIN "timer.bas"
2170 END
5000 INPUT "Please enter filename (witout extension) and hit ENTER: ", FILENAME$
5010 IF LEN(FILENAME$) > 8 THEN PRINT "Filename must be < 8 characters. Please retry.": GOTO 5000
5015 IF LEN(FILENAME$) < 1 THEN PRINT "Filename cannot be empty. Please retry.": GOTO 5000
5020 PRINT FILENAME$
5030 FILENAME$ = FILENAME$ + ".swd"
5100 OPEN "R",#2,FILENAME$,80
5110 PRINT "New file with filename: '" + FILENAME$ + "' created."
5120 CLOSE #2
5130 GOTO 1110
7000 FIELD #2,11 AS DATECOL$,9 AS TIMECOL$,9 AS DURATIONCOL$,51 AS NOTECOL$
7010 LSET DATECOL$ = "DATE;"
7020 LSET TIMECOL$ = "TIME;"
7030 LSET DURATIONCOL$ = "DURATION;"
7040 LSET NOTECOL$ = "NOTE"
7050 PUT #2, 1
7060 TOTALROWS% = 1
7070 RETURN
20000 PRINT "ERROR #"; : PRINT ERR; : PRINT " caught on line #"; : PRINT ERL
20005 IF ERR = 53 THEN PRINT "File '" + FILENAME$ + "' not found."
20007 IF ERR = 62 THEN RESUME 1380
20010 PRINT "Do you want to create a new file with filename '" + FILENAME$ + "'? [Y/N]"
20060 ISWAITING% = 1
20070 WHILE ISWAITING%
20072 KEYPRESS$ = INKEY$
20073 IF KEYPRESS$ = "Y" OR KEYPRESS$ = "y" THEN ISWAITING% = 0
20074 IF KEYPRESS$ = "N" OR KEYPRESS$ = "n" THEN ISWAITING% = 0
20079 WEND
20080 IF KEYPRESS$ = "Y" OR KEYPRESS$ = "y" THEN RESUME 5100
20081 IF KEYPRESS$ = "N" OR KEYPRESS$ = "n" THEN RESUME 1090
64000 END