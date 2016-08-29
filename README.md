# Past
NSDate extension for easily getting the difference between two dates in terms of Year, Month, Week, Day, Hour, Minute and Second

###Cocoapod
```
pod 'Past'
```

###Constants

    enum PastOptions : Int
    {
        case Seconds
        case Minutes
        case Hours
        case Days
        case Weeks
        case Months
        case Years
        
        static let AllValues = [Seconds, Minutes, Hours, Days, Weeks, Months, Years]
    }

Defines in which type the result should be given (Whether the difference should be given in terms of seconds or minutes or etc)

###Available Methods

   - `isToday() -> Bool`
    <p>Checks whether the date is today or not</p>
   
   - `isYesterday() -> Bool`
    <p>Checks whether the date was yesterday or not</p>
   
   - `isThisWeek() -> Bool`
   <p>Checks whether the date is in this current week or not</p> 
   
   - `isLastWeek() -> Bool`
  <p>Checks whether the date was in last week or not</p>
   
   - `isThisMonth() -> Bool`
    <p>Checks whether the date is in this current month or not</p>
   
   - `isLastMonth() -> Bool`
    <p>Checks whether the date was in the last month or not</p>
   
   - `isThisYear() -> Bool`
   <p>Checks whether the date is in this year or not</p>

   - `isLastYear() -> Bool`
   <p>Checks whether the date was in last year or not</p>

   - `getMoment(inTermsOf option : PastOptions) -> String`
   <p>Returns a formatted moment in terms of passed past option. If the date is two days ago and the passed option is `Days` then the result will be <b>2 days ago</b></p> 
   
   - `getElapsedSeconds() -> Int`
   <p>Returns the elapsed seconds</p>

   - `getElapsedMinutes() -> Int`
   <p>Returns the elapsed minutes</p>

   - `getElapsedHours() -> Int`
   <p>Returns the elapsed hours</p>

   - `getElapsedDays() -> Int`
   <p>Returns the elapsed days</p>

   - `getElapsedWeeks() -> Int`
   <p>Returns the elapsed weeks</p>

   - `getElapsedMonths() -> Int`
   <p>Returns the elapsed months</p>
   
   - `getElapsedYears() -> Int`
   <p>Returns the elapsed years</p>
    
   
