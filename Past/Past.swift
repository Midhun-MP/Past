/**
 MIT License
 
 Copyright (c) 2016 Midhun MP
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE. 
 */

import Foundation

// MARK: Extension
extension NSDate
{
    @objc public enum PastOptions : Int
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
}

// MARK: Utility Methods
extension NSDate
{
    /// Checks whether the passed NSDate is today or not
    /// - returns: Indicates the status of operation
    public func isToday() -> Bool
    {
        var isToday         = false
        let calendar        = NSCalendar.currentCalendar()
        let today           = NSDate()
        let components      = calendar.components([.Day, .Month, .Year], fromDate: self)
        let todayComponents = calendar.components([.Day, .Month, .Year], fromDate: today)
        
        if (components.day == todayComponents.day && components.month == todayComponents.month && components.year == todayComponents.year)
        {
            isToday = true
        }
        return isToday
    }
    
    /// Checks whether the passed NSDate is yesterday or not
    /// - returns: Indicates the status of operation
    public func isYesterday() -> Bool
    {
        var isYesterday     = false
        let calendar        = NSCalendar.currentCalendar()
        let today           = NSDate()
        let yesterday       = calendar.dateByAddingUnit(.Day, value: -1, toDate: today, options: [])!
        let components      = calendar.components([.Day, .Month, .Year], fromDate: self)
        let yestdComponents = calendar.components([.Day, .Month, .Year], fromDate: yesterday)
        
        if (components.day == yestdComponents.day && components.month == yestdComponents.month && components.year == yestdComponents.year)
        {
            isYesterday = true
        }
        return isYesterday
    }
    
    /// Checks whether the passed NSDate is within this week or not
    /// - returns: Indicates the status of operation
    public func isThisWeek() -> Bool
    {
        var isThisWeek      = false
        let calendar        = NSCalendar.currentCalendar()
        let today           = NSDate()
        let components      = calendar.components([.WeekOfYear, .Year], fromDate: self)
        let todayComponents = calendar.components([.WeekOfYear, .Year], fromDate: today)
        
        if (components.weekOfYear == todayComponents.weekOfYear && components.year == todayComponents.year)
        {
            isThisWeek = true
        }
        return isThisWeek
    }
    
    /// Checks whether the passed NSDate is within the last week or not
    /// - returns: Indicates the status of operation
    public func isLastWeek() -> Bool
    {
        var isLastWeek         = false
        let calendar           = NSCalendar.currentCalendar()
        let today              = NSDate()
        let lastWeekDay        = calendar.dateByAddingUnit(.WeekOfYear, value: -1, toDate: today, options: [])!
        let components         = calendar.components([.WeekOfYear, .Year], fromDate: self)
        let lastWeekComponents = calendar.components([.WeekOfYear, .Year], fromDate: lastWeekDay)
        
        if (components.weekOfYear == lastWeekComponents.weekOfYear && components.year == lastWeekComponents.year)
        {
            isLastWeek = true
        }
        return isLastWeek
    }
    
    /// Checks whether the passed NSDate is within this month or not
    /// - returns: Indicates the status of operation
    public func isThisMonth() -> Bool
    {
        var isThisMonth     = false
        let calendar        = NSCalendar.currentCalendar()
        let today           = NSDate()
        let components      = calendar.components([.Month, .Year], fromDate: self)
        let todayComponents = calendar.components([.Month, .Year], fromDate: today)
        
        if (components.month == todayComponents.month && components.year == todayComponents.year)
        {
            isThisMonth = true
        }
        return isThisMonth
    }
    
    /// Checks whether the passed NSDate is within the last month or not
    /// - returns: Indicates the status of operation
    public func isLastMonth() -> Bool
    {
        var isLastMonth         = false
        let calendar            = NSCalendar.currentCalendar()
        let today               = NSDate()
        let lastMonth           = calendar.dateByAddingUnit(.Month, value: -1, toDate: today, options: [])!
        let components          = calendar.components([.Month, .Year], fromDate: self)
        let lastMonthComponents = calendar.components([.Month, .Year], fromDate: lastMonth)
        
        if (components.month == lastMonthComponents.month && components.year == lastMonthComponents.year)
        {
            isLastMonth = true
        }
        return isLastMonth
    }
    
    /// Checks whether the passed NSDate is within this year or not
    /// - returns: Indicates the status of operation
    public func isThisYear() -> Bool
    {
        var isThisYear      = false
        let calendar        = NSCalendar.currentCalendar()
        let today           = NSDate()
        let components      = calendar.components([.Year], fromDate: self)
        let todayComponents = calendar.components([.Year], fromDate: today)
        
        if (components.year == todayComponents.year)
        {
            isThisYear = true
        }
        return isThisYear
    }
    
    /// Checks whether the passed NSDate is within the last year or not
    /// - returns: Indicates the status of operation
    public func isLastYear() -> Bool
    {
        var isLastYear         = false
        let calendar           = NSCalendar.currentCalendar()
        let today              = NSDate()
        let lastYear           = calendar.dateByAddingUnit(.Year, value: -1, toDate: today, options: [])!
        let components         = calendar.components([.Year], fromDate: self)
        let lastYearComponents = calendar.components([.Year], fromDate: lastYear)
        
        if (components.year == lastYearComponents.year)
        {
            isLastYear = true
        }
        return isLastYear
    }
    
    /// Returns the moment difference between current time and the passed object's date
    /// - parameter option: PastOptions enum value
    /// - returns: String representation of the moment
    public func getMoment(inTermsOf option : PastOptions) -> String
    {
        var moment = ""
        switch option
        {
        case .Seconds:
            moment = getStringRepresentation(getElapsedSeconds(), option: option)
        case .Minutes:
            moment = getStringRepresentation(getElapsedMinutes(), option: option)
        case .Hours:
            moment = getStringRepresentation(getElapsedHours(), option: option)
        case .Days:
            moment = getStringRepresentation(getElapsedDays(), option: option)
        case .Weeks:
            moment = getStringRepresentation(getElapsedWeeks(), option: option)
        case .Months:
            moment = getStringRepresentation(getElapsedMonths(), option: option)
        case .Years:
            moment = getStringRepresentation(getElapsedYears(), option: option)
        }
        
        return moment
    }
    
    // Returns the elapsed seconds
    public func getElapsedSeconds() -> Int
    {
        let seconds = NSCalendar.currentCalendar().components(.Second, fromDate: self, toDate: NSDate(), options: []).second
        return seconds
    }
    
    // Returns the elapsed minutes
    public func getElapsedMinutes() -> Int
    {
        let minutes = NSCalendar.currentCalendar().components(.Minute, fromDate: self, toDate: NSDate(), options: []).minute
        return minutes
    }
    
    // Returns the elapsed hours
    public func getElapsedHours() -> Int
    {
        let hours = NSCalendar.currentCalendar().components(.Hour, fromDate: self, toDate: NSDate(), options: []).hour
        return hours
    }
    
    // Returns the elapsed days
    public func getElapsedDays() -> Int
    {
        let days = NSCalendar.currentCalendar().components(.Day, fromDate: self, toDate: NSDate(), options: []).day
        return days
    }
    
    // Returns the elapsed weeks
    public func getElapsedWeeks() -> Int
    {
        let week = NSCalendar.currentCalendar().components(.WeekOfYear, fromDate: self, toDate: NSDate(), options: []).weekOfYear
        return week
    }
    
    // Returns the elapsed months
    public func getElapsedMonths() -> Int
    {
        let month = NSCalendar.currentCalendar().components(.Month, fromDate: self, toDate: NSDate(), options: []).month
        return month
    }
    
    // Returns the elapsed years
    public func getElapsedYears() -> Int
    {
        let minutes = NSCalendar.currentCalendar().components(.Year, fromDate: self, toDate: NSDate(), options: []).year
        return minutes
    }
}

// MARK: Private Methods
extension NSDate
{
    // Returns the string representation of moment
    private func getStringRepresentation(time : Int, option : PastOptions) -> String
    {
        var momentAsString = "Now"
        
        switch option
        {
        case .Seconds:
            momentAsString = time > 0 ? "\(time) seconds ago" : "After \(abs(time)) seconds"
        case .Minutes:
            momentAsString = time > 0 ? "\(time) minutes ago" : "After \(abs(time)) minutes"
        case .Hours:
            momentAsString = time > 0 ? "\(time) hours ago"   : "After \(abs(time)) hours"
        case .Days:
            momentAsString = time > 0 ? "\(time) days ago"    : "After \(abs(time)) days"
        case .Weeks:
            momentAsString = time > 0 ? "\(time) weeks ago"   : "After \(abs(time)) weeks"
        case .Months:
            momentAsString = time > 0 ? "\(time) months ago"  : "After \(abs(time)) months"
        case .Years:
            momentAsString = time > 0 ? "\(time) years ago"   : "After \(abs(time)) years"
        }
        
        momentAsString = time == 0 ? "Now" : momentAsString
        
        return momentAsString
    }
}
