# Linter project

This project is a C++ linter that flags basic errors to include readablity.

Listed below are the methods built in this project:

-   `check_trailing` 
-   `check_semi_colon`
-   `check_paranthesis`
-   `check_empty_space` 
-   `check_empty_line`
-   `check_below_line`
-   `check_indentation` 


## Built With
-   Ruby

## C++ linter cases

`Good code`

```bash
cout<<"Hello";

if(a>1) {
    cout<<a;
}

cout<<"Bye";

```

`Bad code`

```bash
cout<<"Hello"

if(a>1) {
    cout<<a;
}

cout<<"Bye"

```

`Good code`

```bash

if(a>1) {
    cout<<a;
}

```

`Bad code`

```bash

if(a>1) {
    cout<<a;
}

```

`Good code`

```bash
cout<<"Hello";

if(a>1) {
    cout<<a;
}

cout<<"Bye";
```

`Bad code`

```bash
cout<<"Hello";
if(a>1) {
    cout<<a;
}
cout<<"Bye";
```

`Good code`
```bash
if(a>1) {
    cout<<a;
}
```
`Bad code`
if(a>1) {
cout<<a;
}
```

## Getting Started

To get a local copy of the repository please run the following commands on your terminal:

    1. git clone https://github.com/NtwaliHeritier/linters-project
    2. cd linters-project

## Run the linter project
    1. cd bin
    2. run ruby main.rb
    3. Enter the path to the directory where the project is located
    4. press Enter


## Test
    1. Open a terminal
    2. Run 'gem install rspec'
    3. Run 'cd linters-project'
    4. Run rspec --init to install rspec in directory
    5. Run 'rspec' in the terminal

## Authors
👤  **Ntwali Heritier**

- Github: [@NtwaliHeritier](https://github.com/NtwaliHeritier)
- Twitter: [@NtwaliHeritier](https://twitter.com/NtwaliHeritier)
- Linkedin: [Ntwali Heritier](https://linkedin.com/in/ntwali-heritier-9950001a2)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!
