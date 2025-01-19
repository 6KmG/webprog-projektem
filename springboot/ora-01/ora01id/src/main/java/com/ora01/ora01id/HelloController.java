  // package com.ora01.ora01id;

  // import org.springframework.web.bind.annotation.RestController;
  // import org.springframework.web.server.ResponseStatusException;

  // import java.util.*;

  // import org.springframework.http.HttpStatus;
  // import org.springframework.web.bind.annotation.CrossOrigin;
  // import org.springframework.web.bind.annotation.DeleteMapping;
  // import org.springframework.web.bind.annotation.GetMapping;
  // import org.springframework.web.bind.annotation.PathVariable;
  // import org.springframework.web.bind.annotation.PostMapping;
  // import org.springframework.web.bind.annotation.PutMapping;
  // import org.springframework.web.bind.annotation.RequestBody;

  // @RestController
  // public class HelloController {
  //   protected ArrayList<Employee> employees = new ArrayList<Employee>();

  //   @GetMapping("/users")
  //   public Iterable<Employee> getAllEmployees() {
  //     employees.add(new Employee("John Doe", "To be John")); // Add the object to the ArrayList

  //     return employees;
  //   }

  //   @GetMapping("/users/{uuid}")
  //   public Employee getEmployee(@PathVariable String uuid) {
  //     for (Employee employee : employees) {
  //       if (employee.getId().toString().equals(uuid)) {

  //         return employee;
  //       }
  //     } 
  //     throw new ResponseStatusException(
  //       HttpStatus.NOT_FOUND, "entity not found"
  //     );        
  //   }
    
  //   @PostMapping("/")
  //   public Employee postMethodName(@RequestBody Employee employee) {
  //     employees.add(employee); // Add the object to the ArrayList
  //     return employee;
  //   }
    
  // }
