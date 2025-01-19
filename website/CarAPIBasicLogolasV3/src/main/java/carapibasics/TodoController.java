// package carapibasics;

// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.List;

// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
// import org.springframework.http.HttpStatus;
// import org.springframework.http.ResponseEntity;
// import org.springframework.validation.annotation.Validated;
// import org.springframework.web.bind.annotation.DeleteMapping;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PathVariable;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.PutMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;

// import carapibasics.exception.CarNotFoundException;
// import jakarta.validation.Valid;
// import jakarta.validation.constraints.Min;

// @RestController
// @RequestMapping("/todo/modify/2")
// @Validated
// public class TodoController {
//     private final List<Todo> todoList = new ArrayList<>(Arrays.asList(
//             // new Todo(1L, "Ferrari", "SF90 Spider", 2024),
//             // new Todo(2L, "Mercedes", "GLC 63 luxury SUV", 2020)
//     ));

//     @GetMapping
//     public Object getAllTodos() {
//         return todoList.isEmpty() ? "Nem található autó a listában." : todoList;
//     }

//     @PostMapping
//     public ResponseEntity<Todo> createTodo(@RequestBody @Valid Todo todo) {
//         todo.setId(generateTodoId());
//         todoList.add(todo);
//         return ResponseEntity.status(HttpStatus.CREATED).body(todo);
//     }

//     private Long generateTodoId() {
//         return todoList.stream().mapToLong(Todo::getId).max().orElse(0) + 1;
//     }

//     @GetMapping("/{id}")
//     public Todo getTodoById(@PathVariable("id") @Min(1) Long id) {
//         return findTodoById(id, "Lekérdezési hiba. Az ID=" + id + " autó nem található.");
//     }
    
//     @PutMapping("/{id}")
//     public ResponseEntity<Todo> updateTodo(@PathVariable("id") @Min(1) Long id, @RequestBody @Valid Todo updatedTodo) {
//         Todo car = findTodoById(id, "Frissítési hiba. Az ID=" + id + " autó nem található.");
//         car.setBrand(updatedTodo.getBrand());
//         car.setModel(updatedTodo.getModel());
//         car.setYear(updatedTodo.getYear());
//         return ResponseEntity.ok(car);
//     }

//     @DeleteMapping("/{id}")
//     public ResponseEntity<?> deleteCar(@PathVariable("id") @Min(1) Long id) {
//         Todo car = findTodoById(id, "Törlési hiba. Az ID=" + id + " autó nem található.");
//         todoList.remove(car);
//         return ResponseEntity.ok("Az ID: " + id + " autó sikeresen törölve.");
//     }

//     private Todo findTodoById(Long id, String errorMessage) {
//         // Logoláshoz szükséges objektum
//         final Logger logError = LoggerFactory.getLogger("fileLoggerError");
//         return todoList.stream().filter(car -> car.getId().equals(id)).findFirst().orElseThrow(() -> {
//             logError.error(errorMessage);
//             return new CarNotFoundException(errorMessage);
//         });
//     }
// }
package carapibasics;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import carapibasics.exception.TodoNotFoundException;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;

@RestController
@RequestMapping("/todo/modify/2")
@Validated
public class TodoController {
    private final List<Todo> todoList = new ArrayList<>(Arrays.asList(
            // new Todo(1L, "Feladat 1", "Leírás 1", "2024-10-18", 1, "user1"),
            // new Todo(2L, "Feladat 2", "Leírás 2", "2024-10-19", 2, "user2")
        new Todo("Wash the dishes", "Wash the dishes throughoutly.", "2024-10-19", 3, "mom123"),
        new Todo("Buy groceries", "Go to Tesco and buy milk.", "2024-10-19", 1, "dad123")
    ));

    private Long generateTodoId() {
        return todoList.stream().mapToLong(Todo::getId).max().orElse(0) + 1;
    }

    private Todo findTodoById(Long id, String errorMessage) {
        final Logger logError = LoggerFactory.getLogger("fileLoggerError");
        return todoList.stream().filter(todo -> todo.getId().equals(id)).findFirst().orElseThrow(() -> {
            logError.error(errorMessage);
            return new TodoNotFoundException(errorMessage);
        });
    }

    // Lekérdezés
    @GetMapping
    public Object getAllTodos() {
        return todoList.isEmpty() ? "Nem található feladat a listában." : todoList;
    }

    // Lekérdezés
    @GetMapping("/{id}")
    public Todo getTodoById(@PathVariable("id") @Min(1) Long id) {
        return findTodoById(id, "Lekérdezési hiba. Az ID=" + id + " feladat nem található.");
    }

    // Új végpont az 1-es prioritású feladatok lekérdezéséhez
    @GetMapping("/priority/1")
    public ResponseEntity<List<Todo>> getTodosWithPriority1() {
        List<Todo> priority1Todos = new ArrayList<>();
        for (Todo todo : todoList) {
            if (todo.getPriority() == 1) {
                priority1Todos.add(todo);
            }
        }
        if (priority1Todos.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build(); // Ha nincs 1-es prioritású feladat
        }
        return ResponseEntity.ok(priority1Todos); // Visszaadja az 1-es prioritású feladatokat
    }

    // Hozzáadás
    @PostMapping
    public ResponseEntity<Todo> createTodo(@RequestBody @Valid Todo todo) {
        todo.setId(generateTodoId());
        todoList.add(todo);
        return ResponseEntity.status(HttpStatus.CREATED).body(todo);
    }

    // Módosítás
    @PutMapping("/{id}")
    public ResponseEntity<Todo> updateTodo(@PathVariable("id") @Min(1) Long id, @RequestBody @Valid Todo updatedTodo) {
        Todo todo = findTodoById(id, "Frissítési hiba. Az ID=" + id + " feladat nem található.");
        todo.setName(updatedTodo.getName());
        todo.setDescription(updatedTodo.getDescription());
        todo.setDate(updatedTodo.getDate());
        todo.setPriority(updatedTodo.getPriority());
        todo.setUserName(updatedTodo.getUserName());
        return ResponseEntity.ok(todo);
    }

    // Törlés
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTodo(@PathVariable("id") @Min(1) Long id) {
        Todo todo = findTodoById(id, "Törlési hiba. Az ID=" + id + " feladat nem található.");
        todoList.remove(todo);
        return ResponseEntity.ok("Az ID: " + id + " feladat sikeresen törölve.");
    }
}
