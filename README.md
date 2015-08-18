<center>
go-cron
===
</center>

<h3>   <a href="http://godoc.org/github.com/hotei/go-cron">
<img src="https://godoc.org/github.com/hotei/go-cron?status.png" alt="GoDoc" />
</a>Travis <a href="http://travis-ci.org/hotei/go-cron">
<img src="https://secure.travis-ci.org/hotei/go-cron.png" alt="Build Status" /></a>
</h1>


This "README" document is (c) 2015 David Rook. 

```
go-cron is (c) Robert Kosek, portions (c) 2015 David Rook - all rights reserved.
```

The program
and related files in this repository are released under BSD 2-Clause License.
License details are at the end of this document. Bugs/issues can be reported on github.
Comments can be sent to <hotei1352@gmail.com>. "Thank you"s, constructive 
criticism and job offers are always welcome.

### Overview

_go-cron_ allows you to initiate and repeat tasks at regular intervals.  It's 
similar in some ways to _cron_, but there are important differences.  More detail
about the difference will be given later, but first note that you can use
the package in more than one way.  

One method is to call it inside a long running
program to perform some task such as refreshing an internal data structure or 
producing a status report at regular "wall-clock-time" specific intervals as
opposed to just sleeping for a fixed time.

The other method is more similar to _cron_, where a "reminder" program is run
at system startup.  Tasks are performed by local functions and main() just
schedules the tasks and goes to sleep indefinitely. With appropriate extensions
the program can mail reminders, run security checks or anything you can write.

### Installation

If you have a working go installation on a Unix-like OS:

> ```go get github.com/hotei/go-cron```

If you don't have go installed you can always download the git repository as
a zipfile and extract it. If you just want to see what the package internals
look like, take a look at this godoc.org link <a href="http://godoc.org/github.com/hotei/go-cron">
<img src="https://godoc.org/github.com/hotei/ansiterm?status.png" alt="GoDoc" /></a>.


### Features

* Probably the biggest feature is the simplicty of the solution.  It's easy
to understand what the program does and to modify it for your needs.
* Tasks can be done every second if required, whereas _cron_ has a minimum of
one minute between tasks.
* Because of the one second resolution _go-cron_ can waste CPU time if active 
events are scheduled at long intervals (once a month for example). You can
customize the minimum delay between checks if desired.
* you can schedule tasks that are "shell" commands using os.exec 

### Issues
* None known

### Development Environment
	Mint 17.1 Linux on i7/2500 mhz 8 'core' (4+4HT) HP Envy Laptop
	X11/R6
	gnu g++ compiler gcc version 4.8.2 (Ubuntu 4.8.2-19ubuntu1)
	go 1.5rc1
	
### Change Log

* 2015-08-18 rebuilt with go 1.5rc1
  * added Travis builder testing
* 2013-04-19 forked go-cron from github.com/rk/go-cron

### References

* [Source for hotei/go-cron on github] [3]
* [Source for rk/go-cron on github] [9]
* [go language reference] [1] 
* [go standard library package docs] [2]
* [Excellent godoc howto by Nate Finch] [8]
* [Go projects list(s)] [7]

[1]: http://golang.org/ref/spec/ "go reference spec"
[2]: http://golang.org/pkg/ "go package docs"
[3]: http://github.com/hotei/go-cron "github.com/hotei/go-cron"
[4]: http://golang.org/doc/go1compat.html "Go 1.x API contract"
[5]: http://blog.golang.org/2011/06/profiling-go-programs.html "Profiling go code"
[6]: http://golang.org/doc/articles/godoc_documenting_go_code.html "GoDoc HowTo"
[7]: https://github.com/golang/go/wiki/Projects "go project list"
[8]: https://github.com/natefinch/godocgo "Nate Finch's Tutorial for GoDoc"
[9]: http://github.com/rk/go-cron "github.com/rk/go-cron"

Comments can be sent to David Rook  <hotei1352@gmail.com>  Any issues/bugs
can be mentioned in email to me or filed on github.

### Disclaimer
Any trademarks mentioned herein are the property of their respective owners.

### License

The 'go-cron' go program/package and demo programs are distributed under the Simplified BSD License:

> Copyright (c) Robert Kosek, portions (c) 2015 David Rook. All rights reserved.
> 
> Redistribution and use in source and binary forms, with or without modification, are
> permitted provided that the following conditions are met:
> 
>    1. Redistributions of source code must retain the above copyright notice, this list of
>       conditions and the following disclaimer.
> 
>    2. Redistributions in binary form must reproduce the above copyright notice, this list
>       of conditions and the following disclaimer in the documentation and/or other materials
>       provided with the distribution.
> 
> THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER ``AS IS'' AND ANY EXPRESS OR IMPLIED
> WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
> FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> OR
> CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
> NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
> ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----

<center>
# Automatically Generated Documentation Follows
</center>


DO NOT EDIT BELOW - Generated by [godoc2md](http://godoc.org/github.com/davecheney/godoc2md)

# cron
    import "."


	  This package implements a simplistic Cron Job system that calls functions and
	  closures on given days/times. If you need events that fire more often than
	  once a second, use time.Ticker or time.After instead. The event must be able
	  to accept a Time object (though it doesn't have to use it).
	
	  ---------------------------------------------------------------------------------------
	
	  Copyright 2011 Robert Kosek <thewickedflea@gmail.com>. All rights reserved.
	
	  Redistribution and use in source and binary forms, with or without modification, are
	  permitted provided that the following conditions are met:
	
	     1. Redistributions of source code must retain the above copyright notice, this list of
	        conditions and the following disclaimer.
	
	     2. Redistributions in binary form must reproduce the above copyright notice, this list
	        of conditions and the following disclaimer in the documentation and/or other materials
	        provided with the distribution.
	
	  THIS SOFTWARE IS PROVIDED BY ROBERT KOSEK ``AS IS'' AND ANY EXPRESS OR IMPLIED
	  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
	  FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL ROBERT KOSEK OR
	  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
	  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
	  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
	  ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
	  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
	  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	  The views and conclusions contained in the software and documentation are those of the
	  authors and should not be interpreted as representing official policies, either expressed
	  or implied, of Robert Kosek.
	
	 Portions (c) 2012-2015 David Rook see git blame for attribution
	
	 This is my fork of github.com/rk/go-cron by Robert Kosek
	
	  1)	Replaced -1 by any for readability improvement
	  2)	Changed *time.Time to time.Time  WHY: pointer to time struct useful if you
	  need to change something that gets back to the caller.  Not the case here. Otherwise
	  go style (as I understand it) suggests not using pointers if not required.
	  3)	Added cron_test.go example of usage
	  4) 	Added yearly job (just for completeness)
	  5)	Added a little more to docs
	  6)	Unexport ANY --> any
	  7)	Make resolution (CheckDelay) an exported variable
	
	  A sample task looks like this:
	
	  func mytask(t time.Time) {
		fmt.Printf("time = %s\n", t.String())
	  }
	
	  A skeletal main program that will run for at least a year looks like this:
	
	  func main() {
	  	NewDailyJob(any,any,5,mytask)
	  	time.Sleep(366 * 24 * time.Hour)
	  }





## Variables
``` go
var (
    CheckDelay = time.Duration(1 * time.Second) // minimum delay between checks
)
```

## func NewCronJob
``` go
func NewCronJob(month, day, weekday, hour, minute, second int8, task func(time.Time))
```
This function creates a new job that occurs at the given day and the given
24hour time. Any of the values may be -1 as an "any" match, so passing in
a day of -1, the event occurs every day; passing in a second value of -1, the
event will fire every second that the other parameters match.


## func NewDailyJob
``` go
func NewDailyJob(hour, minute, second int8, task func(time.Time))
```
NewDailyJob creates a job that fires daily at a specified time.


	Take a vitamin pill reminder.


## func NewMonthlyJob
``` go
func NewMonthlyJob(day, hour, minute, second int8, task func(time.Time))
```
NewMonthlyJob creates a job that fires monthly at a given time on a given day.


	Pay the rent on the 5th of the month.


## func NewWeeklyJob
``` go
func NewWeeklyJob(weekday, hour, minute, second int8, task func(time.Time))
```
NewWeeklyJob creates a job that fires on the given day of the week and time.


	Go to spinning class at the Y on Tuesday.


## func NewYearlyJob
``` go
func NewYearlyJob(month, day, hour, minute, second int8, task func(time.Time))
```
NewYearlyJob creates a job that fires yearly at a given time on a given month and day.


	Birthday reminder.









- - -
DO NOT EDIT ABOVE - Generated by [godoc2md](http://godoc.org/github.com/davecheney/godoc2md)

github.com/hotei/go-cron imports 
```
	errors
	runtime
	sync
	sync/atomic
	syscall
	time
	unsafe
```
```
deadcode results:

```
