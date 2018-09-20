
#[derive(Debug)]
pub struct Lattice {
    x: u8,
    y: u8
}

fn main() {
    let lat: Lattice = Lattice {
        x: 3,
        y: 3
    };
    println!("Before lat {:?}", lat);
    let mut outside_x = lat.x;
    println!("After lat {:?}", lat);
    println!("outside x {}", outside_x);
    println!("print change outside_x from 3 to 4");
    outside_x += 1; 
    println!("outside x {}", outside_x);
    println!("Did the lattice change? lat: {:?}", lat);
}
