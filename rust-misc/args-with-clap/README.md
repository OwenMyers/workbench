I like the YAML file to configure. Much cleaner.

To test the behavior correctly you need to run the executable, not `cargo run`.
Do:
```
target/debug/args-with-clap <args>
```
If you are developing. Otherwise find it in release.