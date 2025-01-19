// Custom ArrayList with additional formatting functionality
import java.util.ArrayList;

public class MyArrayList<E> extends ArrayList<E> {
    // Converts the list into a human-readable formatted string
    public String toFormattedString() {
        if (this.isEmpty()) throw new IllegalArgumentException("Empty array."); // Handle empty lists
        String myArrayListString = this.get(0).toString(); // Start with the first element

        if (this.size() == 1) return myArrayListString; // Single element case

        // Append intermediate elements separated by commas
        for (Integer i = 1; i < this.size() - 1; i++) {
            myArrayListString += ", " + this.get(i).toString();
        }

        // Append the last element preceded by "and"
        myArrayListString += " and " + this.getLast().toString();
        
        return myArrayListString;
    }
}