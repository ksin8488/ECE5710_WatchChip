# RTL

## Nick

Time-counter modules (6) for HH, MM, SS for current time and stopwatch.

* input clk
* input reset
* input increment
* input decrement (to allow setting the time)
* input time\_set (ie, low when it's counting time but pull high when you want to set the time for that module)
* input enable
* parameter OVERFLOW\_VALUE (24 or 60)
* output [5:0] current\_time
* output overflow 

## Kashish

7-segment display controller.

* input clk
* input seconds\_clk
* input [2:0??] state - work with ella on this
* input [5:0] current\_s
* input [5:0] current\_m
* input [5:0] current\_h
* input [5:0] stopwatch\_s
* input [5:0] stopwatch\_m
* input [5:0] stopwatch\_h
* output [7:0] display\_s
* output [7:0] display\_m
* output [7:0] display\_h
* output second - if we want to blink the : every second

## Ella

State controller

* input clk
* input reset
* input btn\_mode
* input btn\_time\_set
* input btn\_increment
* input btn\_decrement
* output [2:0] state
* output run\_stopwatch 
* output reset\_stopwatch
* output run\_time
* output inc\_m
* output dec\_m
* output inc\_h
* output dec\_h

Backlight controller
* input clk
* input reset
* input start\_light
* output light

Clock divider
* input clk
* input reset
* output seconds\_clk
