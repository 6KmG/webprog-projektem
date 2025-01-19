// Utility class to reverse a LinkedHashMap
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ReverseLinkedHashMap extends LinkedHashMap {
    // Reverses the order of entries in a LinkedHashMap
    public static <K, V> LinkedHashMap<K, V> reverseLinkedHashMap(LinkedHashMap<K, V> original) {
        LinkedHashMap<K, V> reversed = new LinkedHashMap<>();
        
        // Step 1: Extract entries as a list
        List<Map.Entry<K, V>> entries = new ArrayList<>(original.entrySet());
        
        // Step 2: Reverse the list
        Collections.reverse(entries);
        
        // Step 3: Insert reversed entries into the new LinkedHashMap
        for (Map.Entry<K, V> entry : entries) {
            reversed.put(entry.getKey(), entry.getValue());
        }
        
        return reversed;
    }
}