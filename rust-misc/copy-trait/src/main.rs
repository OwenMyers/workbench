
#[derive(Debug, Clone)]
pub struct Point {
    pub x: u8,
    pub y: u8
}

#[derive(Debug, Clone)]
pub struct Lattice { 
    pub x: u8,
    pub y: u8,
    pub points: Vec<Point>
}
//impl Copy for Lattice {
//}

fn main() {
    let mut lat = Lattice{
        x: 3,
        y: 3,
        points: vec![Point {x: 2, y: 2}, Point {x: 3, y: 3}]
    };
    //let ref_lat: &mut Lattice = &mut lat.clone();
    let lat2: &mut Lattice = &mut lat.clone();

    //let mut lat2: Lattice = ref_lat.clone();

    lat.x = 8;
    println!("lat {:?}", lat);
    println!("lat2 {:?}", lat2);
}
