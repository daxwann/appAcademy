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
    
  }

  _formatTime(timeInt) {
    return (timeInt > 9) ? `${timeInt}` : `0${timeInt}`;
  }

  printTime() {
    // Format the time in HH:MM:SS
    const hour = _formatTime(this.time.hour); 
    const minute = _formatTime(this.time.minute);
    const second = _formatTime(this.time.second);

    // Use console.log to print it.
    console.log(`${hour}:${minute}:${second}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    if (this.sec < 59) {
      this.sec++;
    } else {
      this.sec = 0;
      if (this.min < 59) {
        this.min++;
      } else {
        this.min = 0;
        if (this.hour < 23) {
          this.hour++;
        } else {
          this.hour = 0;
        }
      }
    }
    // 2. Call printTime.
    printTime();
  }
}

const clock = new Clock();
