
pub fn add_one(add_to: &mut i8) {
    *add_to += 1;
}

fn main() {
    let mut x: i8 = 0;
    println!("Before add_one() x: {}", x);
    add_one(&mut x);
    println!("After add_one() x: {}", x);
}
