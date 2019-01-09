
pub fn add_one(add_to: &mut i8) {
    *add_to += 1;
}

pub fn add_element_to_vec(vec: &mut Vec<u8>) {
    vec.push(2);
}

fn main() {
    let mut x: i8 = 0;
    println!("Before add_one() x: {}", x);
    add_one(&mut x);
    println!("After add_one() x: {}", x);

    let mut vec: Vec<u8> = Vec::new();
    vec.push(1);
    println!("Before add_element_to_vec() vec: {:?}", vec);
    add_element_to_vec(&mut vec);
    println!("After add_element_to_vec() vec: {:?}", vec);
}
