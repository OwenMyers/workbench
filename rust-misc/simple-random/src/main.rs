use rand::Rng;
use rand;

fn main() {
    
    let mut x: u64;
    for _ in 0..10{
        x = rand::thread_rng().gen_range(0, 3);
        println!("Random number: {}", x);
    }

}
