
#[macro_use]
extern crate clap;
use clap::App;

fn main() {
    let yaml = load_yaml!("cli.yml");
    let matches = App::from_yaml(yaml).get_matches();

    // Get the value of config or, if nothing is provided, returns 'default.conf'.
    let config = matches.value_of("config").unwrap_or("default.conf");
    println!("Value for config: {}", config);

    let int_in_str = matches.value_of("intin").unwrap_or("0");
    let int_in: i32 = int_in_str.parse().unwrap();
    println!("int_in_str {}", int_in_str);
    println!("int_in {}", int_in);

    println!("Done");
}
