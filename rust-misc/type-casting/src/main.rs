fn main() {
    let x: i8 = 3;
    let y: u8 = x as u8;
    println!("Casting positive i8 (x = 3) to u8 (y):");
    println!("   x: {}, y: {}", x, y);

    let x: i8 = -3;
    let y: u8 = x as u8;
    println!("Casting negative i8 (x = 3) to u8 (y):");
    println!("   x: {}, y: {}", x, y);

    let x: u8 = 3;
    let y: f32 = (x as f32) / 2.0;
    println!("Casting u8 x=3 to f32 x/2:");
    println!("   x: {}, y: {}", x, y);

}
