fn main() {
    let mut count = 1; // Count the number of primes
    let mut is_prime: bool;
    let mut square: i32;

    let mut i = 3;
    while i < 200_000_000 {
        is_prime = true;
        square = f32::sqrt(i as f32) as i32; // Use Rust's built-in square root function

        // Check divisibility from 3 to the square root of i
        for j in (3..=square).step_by(2) {
            if i % j == 0 {
                is_prime = false;
                break;
            }
        }

        // If no divisors found, it's prime
        if is_prime {
            count += 1;
        }

        i += 2;
    }

    println!("The result: {}", count);
}
