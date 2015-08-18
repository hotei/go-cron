
DO NOT EDIT BELOW - Generated by [godoc2md](http://godoc.org/github.com/davecheney/godoc2md)

# cron
    import "."




## Constants
``` go
const ANY = -1
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


	Pay the rent.


## func NewWeeklyJob
``` go
func NewWeeklyJob(weekday, hour, minute, second int8, task func(time.Time))
```
NewWeeklyJob creates a job that fires on the given day of the week and time.


	Go to spinning class at the Y.


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
