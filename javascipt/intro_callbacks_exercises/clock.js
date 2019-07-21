/* Use `setInterval` to build a small clock in your terminal. It should display the current time every second. However, you can only query the system time once. Your clock must store that time, increment it, and display it in HH:MM:SS (use 24hr format). */

class Clock {
  constructor() {
    // 1. Create a Date object.
    const date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.time = {
      hour: date.getHours(),
      minute: date.getMinutes(),
      second: date.getSeconds()
    };
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    global.setInterval(() => {
      this._tick();
    }, 1000); 
  }

  _formatTime(timeInt) {
    return (timeInt > 9) ? `${timeInt}` : `0${timeInt}`;
  }

  printTime() {
    // Format the time in HH:MM:SS
    const hour = this._formatTime(this.time.hour); 
    const minute = this._formatTime(this.time.minute);
    const second = this._formatTime(this.time.second);

    // Use console.log to print it.
    console.log(`${hour}:${minute}:${second}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    if (this.time.second < 59) {
      this.time.second++;
    } else {
      this.time.second = 0;
      if (this.time.minute < 59) {
        this.time.minute++;
      } else {
        this.time.minute = 0;
        if (this.time.hour < 23) {
          this.time.hour++;
        } else {
          this.time.hour = 0;
        }
      }
    }
    // 2. Call printTime.
    this.printTime();
  }
}

const clock = new Clock();
