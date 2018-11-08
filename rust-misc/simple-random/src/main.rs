extern crate rand;
use rand::prelude::*;

fn main() {
    let mut rng = thread_rng();
    
    let mut x: u64;
    for _ in 0..10{
        x = rng.gen_range(0, 3);
        println!("Random (integer?) number: {}", x);
    }

    for _ in 0..10{
        // This function only generates numbers in [0,1)
        let num: f64 = rng.gen();
        println!("Random between 0 and 1 {}", num);
    }

}
