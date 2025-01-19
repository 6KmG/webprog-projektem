// Main application class
public class App {
    public static void main(String[] args) {
        // Test the DurationFormatService with different durations
        System.out.println(DurationFormatService.formatSeconds(1732789643 + DurationFormatService.YEAR * 1970)); // Large duration
        System.out.println(DurationFormatService.formatSeconds(0)); // No duration
        System.out.println(DurationFormatService.formatSeconds(62)); // A small duration of 62 seconds
    }
}