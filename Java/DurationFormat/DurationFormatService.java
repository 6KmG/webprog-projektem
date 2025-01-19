// Your task in order to complete this Kata is to write a function which formats a duration, 
// given as a number of seconds, in a human-friendly way.

// The function must accept a non-negative integer. If it is zero, it just returns "now". 
// Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

// It is much easier to understand with an example:

// * For seconds = 62, your function should return 
//     "1 minute and 2 seconds"
// * For seconds = 3662, your function should return
//     "1 hour, 1 minute and 2 seconds"

// For the purpose of this Kata, a year is 365 days and a day is 24 hours.

// Note that spaces are important.
// Detailed rules

// The resulting expression is made of components like 4 seconds, 1 year, etc. In general, 
// a positive integer and one of the valid units of time, separated by a space. The unit of 
// time is used in plural if the integer is greater than 1.

// The components are separated by a comma and a space (", "). Except the last component, 
// which is separated by " and ", just like it would be written in English.

// A more significant units of time will occur before than a least significant one. 
// Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.

// Different components have different unit of times. 
// So there is not repeated units like in 5 seconds and 1 second.

// A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds

// is not valid, but it should be just 1 minute.

// A unit of time must be used "as much as possible". It means that the function should not return 61 seconds, 
// but 1 minute and 1 second instead. Formally, the duration specified by of a component must not be 
// greater than any valid more significant unit of time.



// Utility class to format durations in seconds into human-readable formats
import java.util.HashMap;
import java.util.LinkedHashMap;

public class DurationFormatService {
    // Define constants for different time units in seconds
    public static long SECOND = 1;
    public static long MINUTE = SECOND * 60;
    public static long HOUR = MINUTE * 60;
    public static long DAY = HOUR * 24;
    public static long WEEK = DAY * 7;
    public static long MONTH = DAY * 30;
    public static long YEAR = DAY * 365;
    public static long DECADE = YEAR * 10;
    public static long CENTURY = DECADE * 10;
    public static long MILLENNIUM = CENTURY * 10;

    // Formats the given duration in seconds into a human-readable format
    public static String formatSeconds(long seconds) {
        if (seconds < 0) throw new IllegalArgumentException("Seconds cannot be negative."); // Negative durations are invalid
        if (seconds == 0) return "now"; // Special case for zero seconds

        // LinkedHashMap to preserve the order of time components
        LinkedHashMap<String, Long> timeComponents = new LinkedHashMap<String, Long>();

        // Add relevant time components for formatting
        timeComponents.put("second", SECOND);
        timeComponents.put("minute", MINUTE);
        timeComponents.put("hour", HOUR);
        timeComponents.put("day", DAY);
        // Uncomment below lines if weeks and months should also be included
        // timeComponents.put("week", WEEK);
        // timeComponents.put("month", MONTH);
        timeComponents.put("year", YEAR);

        // Custom array list to store formatted time components
        MyArrayList<String> timeArray = new MyArrayList<String>();

        // Reverse the order of time components (from largest to smallest)
        timeComponents = ReverseLinkedHashMap.reverseLinkedHashMap(timeComponents);

        // Iterate over time components and calculate their counts
        for (HashMap.Entry m : timeComponents.entrySet()) {    
            String timeComponent = (String) m.getKey();
            if (seconds >= timeComponents.get(timeComponent)) {
                // Determine if it's singular or plural and format accordingly
                if (seconds >= timeComponents.get(timeComponent) * 2) {
                    timeArray.add(Long.toString(seconds / timeComponents.get(timeComponent)) + " " + timeComponent + "s");
                } else {
                    timeArray.add("1 " + timeComponent);
                }
                // Reduce seconds by the processed time component
                seconds = seconds % timeComponents.get(timeComponent);
            }
        }  

        // Return the formatted string representation of the duration
        return timeArray.toFormattedString();
    }
}