1000 CLS
1010 SCREEN 2
1100 LOCATE 1, 34
1300 PRINT " STOPWATCH "
1400 DIM HANDS(59,1)
1410 FOR I=0 TO 59:READ HANDS(I,0),HANDS(I,1)
1420 NEXT I
1500 LOCATE 3, 39: PRINT "00"
1510 LOCATE 5, 29: PRINT "55"
1520 LOCATE 5, 49: PRINT "5"
1530 LOCATE 8, 22: PRINT "50"
1540 LOCATE 8, 54: PRINT "10"
1550 LOCATE 12, 19: PRINT "45"
1560 LOCATE 12, 39: PRINT "*"
1570 LOCATE 12, 58: PRINT "15"
1580 LOCATE 16, 22: PRINT "40"
1590 LOCATE 16, 54: PRINT "20"
1600 LOCATE 20, 29: PRINT "35"
1610 LOCATE 20, 49: PRINT "25"
1620 LOCATE 22, 39: PRINT "30"
1700 DATA 308,25
1710 DATA 323,28
1720 DATA 337,31
1730 DATA 353,34
1740 DATA 368,38
1750 DATA 380,43
1760 DATA 391,46
1770 DATA 400,50
1780 DATA 409,53
1790 DATA 419,57
1800 DATA 424,61
1810 DATA 433,67
1820 DATA 439,73
1830 DATA 444,79
1840 DATA 450,86
1850 DATA 455,92
1860 DATA 450,98
1870 DATA 444,104
1880 DATA 439,110
1890 DATA 433,117            
1900 DATA 420,123
1910 DATA 412,129
1920 DATA 405,135
1930 DATA 398,141
1940 DATA 391,148
1950 DATA 382,154
1960 DATA 368,156
1970 DATA 353,159
1980 DATA 337,162
1990 DATA 323,164
2000 DATA 308,167
2010 DATA 293,163
2020 DATA 278,160
2030 DATA 263,157
2040 DATA 249,153
2050 DATA 234,150
2060 DATA 225,144
2070 DATA 215,139
2080 DATA 206,134
2090 DATA 197,128
2100 DATA 188,123
2110 DATA 182,117
2120 DATA 177,110
2130 DATA 172,104
2140 DATA 166,98
2150 DATA 161,92
2160 DATA 166,86
2170 DATA 172,79
2180 DATA 177,73
2190 DATA 182,67
2200 DATA 188,61
2210 DATA 197,57
2220 DATA 207,53
2230 DATA 217,50
2240 DATA 226,46
2250 DATA 236,43
2260 DATA 250,38
2270 DATA 265,34
2280 DATA 279,31
2290 DATA 293,28
20000 HOURS = 0
30000 MINUTES = 0
40000 SECONDS = 0
40100 LINE (308,92)-(HANDS(SECONDS,0),HANDS(SECONDS,1))
50000 T! = TIMER + 1: WHILE TIMER < T!: WEND
60000 SECONDS = SECONDS + 1
60100 IF SECONDS = 60 THEN MINUTES = MINUTES + 1: SECONDS = 0
60200 IF MINUTES = 60 THEN HOURS = HOURS + 1: MINUTES = 0
60210 IF SECONDS-1 => 0 THEN LINE (308,92)-(HANDS(SECONDS-1,0),HANDS(SECONDS-1,1)),0,BF ELSE LINE (308,92)-(293,28),0,BF
60215 LOCATE 12, 39: PRINT "*"
60220 LINE (308,92)-(HANDS(SECONDS,0),HANDS(SECONDS,1))
60230 LOCATE 24, 24
60300 PRINT "TIME ELAPSED (HH:MM:SS): ";
60400 PRINT USING "##"; HOURS;
60500 PRINT ":";
60600 PRINT USING "##"; MINUTES;
60700 PRINT ":";
60800 PRINT USING "##"; SECONDS;
60900 GOTO 50000
61000 END