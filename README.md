# Stopwatch
This application was a written as a simple demonstration of a two-dimensional array, animated graphics and a user interface in GW-BASIC.

When run, this application prints a representation of an analogue stopwatch, and a table containing the three accepted commands. The application will wait until the user starts the stopwatch.

## Installation
### Prerequisites
* BASIC interpreter compatible with GW-BASIC/BASICA dialects of BASIC ([PC-BASIC](http://robhagemans.github.io/pcbasic/) is a cross-platform interpreter)

### Installation
1. Download `timer.bas` from the `/src/` directory.
2. Move the downloaded file to another local directory of your choosing.
3. Open your BASIC interpreter and using the `CHDIR` command, change the current working directory to the local path of `timer.bas`.
4. Type `LOAD"timer.bas` to load the code into the interpreter.
5. Type `LIST` to confirm the code has loaded.
   
## Usage
Once you have loaded `timer.bas` into your BASIC interpreter, type `RUN` to run the screensaver program.

The user has the three following commands available:
1. Start/stop via the `S` key to (re)start or stop/pause the timer.
2. Reset via the `R` to restart the application, and thus reset the stopwatch to zero.
3. Quit via the `Q` key to close the application.

Should the application become unresponsive, press `CONTROL + C` to force the interpreter to stop.

### Screenshot
Screenshot of stopwatch awaiting the start command, either on first run or after reset.
![Screenshot of stopwatch awaiting the start command](/screenshots/start.png "Stopwatch awaiting start")

Screenshot of stopwatch running or stopped.
![Screenshot of stopwatch running / stopped](/screenshots/running.png "Stopwatch running / stopped")