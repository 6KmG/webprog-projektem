fn sqrt_int(n: i32) -> i32 {
    if n == 0 { return 0; }
    let mut x = n;
    let mut y = (x + 1) / 2;  // Initial guess
    while y < x {
        x = y;
        y = (x + n / x) / 2;  // Newton's method for integer square root
    }
    x
}

fn main() {
    let mut count = 1;  // Count the number of primes
    let mut is_prime: bool;
    let mut square: i32;

    let mut i = 3;
    while i < 10_000_000 {
        is_prime = true;
        square = sqrt_int(i);

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
