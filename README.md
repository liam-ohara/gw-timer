# Stopwatch
This application was a written as a simple demonstration of a two-dimensional array, animated graphics and a user interface in GW-BASIC.

When run, this application prints a representation of an analogue stopwatch, and a table containing the three accepted commands. The application will wait until the user starts the stopwatch. 

## Installation
### Prerequisites
* BASIC interpreter compatible with GW-BASIC/BASICA dialects of BASIC ([PC-BASIC](http://robhagemans.github.io/pcbasic/) is a cross-platform interpreter)

### Installation
1. Download `timer.bas` and `t-memo.bas` from the `/src/` directory.
2. Move the downloaded files to another local directory of your choosing.
3. Open your BASIC interpreter and using the `CHDIR` command, change the current working directory to the local path of `timer.bas`.
4. Type `LOAD"timer.bas` to load the code into the interpreter.
5. Type `LIST` to confirm the code has loaded.
   
## Features
The application of the two combined programs has the following features:
>- User-initiated recording in hours, minutes and seconds
>- Pause and continue an existing recording
>- Reset the timer
>- Save the recording along with the date, time (end of recording), duration and note (comment/memo) to file

## Usage
Once you have loaded `timer.bas` into your BASIC interpreter, type `RUN` to run the screensaver program.

The user has the three following commands available:
1. Start/stop via the `S` key to (re)start or stop/pause the timer.
2. Reset via the `R` to restart the application, and thus reset the stopwatch to zero.
3. Save the timing with a memo to file via `S` and then `M`.
4. Quit via the `Q` key to close the application.

Should the application become unresponsive, press `CONTROL + C` to force the interpreter to stop.

### Memo feature usage
Once you have stopped the timer by pressing the `S` key, you can save the timing with a note (memo/comment) to a file by then pressing the `M` key.

This will run the 'chained' program `t-memo.bas`, but will transfer the variables from `timer.bas` so that these are available to save to file.

Initially, you will be presented with the date, time and duration of the timing, and a list of commands:

>1. (O) OPEN - Save to existing file
>2. (N) NEW - Save to new file
>3. (A) ABANDON - Erases record and returns to stopwatch

If you choose to save to an existing file, you will first be prompted to enter the filename (without the extension). `8.3` filenames apply, so only an input of between 1 and 8 characters will be accepted. The program will search for the file in the present working directory (same directory as where the program is stored). If the file is not found, you will be told and then asked whether you want to create a new file with the filename you entered. 

If you answered yes, or the file was found first time, then you will then be prompted to enter a note (the memo) of up to 50 characters to be saved along with your timing. You will be asked to confirm that your note is correct. If you select `No`, then you will be prompted to re-enter a note. Once you have confirmed your note, the whole record will be saved to a comma separated values (`;` as the delimiter) file with the `swd` (short for StopWatch Data) suffix. The file includes the following column headers:

>- DATE
>- TIME
>- DURATION
>- NOTE

### Screenshots
Screenshot of stopwatch awaiting the start command, either on first run or after reset.
![Screenshot of stopwatch awaiting the start command](/screenshots/start.png "Stopwatch awaiting start")

Screenshot of stopwatch running or stopped.
![Screenshot of stopwatch running / stopped](/screenshots/running.png "Stopwatch running / stopped")

Screenshot of memo feature initial screen.
![Screenshot of memo feature initial screen](/screenshots/t-memo-first-scrn.png "Memo feature")

Screenshot of save procedure.
![Screenshot of save procedure](/screenshots/save_procedure.png "Save procedure")
