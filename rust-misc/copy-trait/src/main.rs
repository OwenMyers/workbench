
#[derive(Debug, Copy, Clone)]
pub struct Lattice { 
    pub x: u8,
    pub y: u8,
}
//impl Copy for Lattice {
//}

fn main() {
    let lat: Lattice = Lattice{
        x: 3,
        y: 3,
    };

    let mut lat2: Lattice = lat;

    lat2.x = 8;
    println!("lat {:?}", lat);
    println!("lat2 {:?}", lat2);
}
