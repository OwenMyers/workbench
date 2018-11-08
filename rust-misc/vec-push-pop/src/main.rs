use std::vec::Vec;

fn main() {

    let mut v = Vec::new();
    for i in 0..3 {
        v.push((1.4, 1));
    }

    while let Some(top) = v.pop() {
        println!("{:?}", top);
    }

}
