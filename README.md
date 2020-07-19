# An Console Application Template

This is an Elixir console application template that contains some example math operations functionality. It parses command line arguments to run some simple mathematica operations and contains some example unit tests. It's intended to both provide an example for you to learn from as well as a starting point for building your own Elixir console application.

## Building and Running

Assuming you have Elixir already installed, run `mix deps.get` to retrieve the dependencies, `mix escript.build` to build the application, and `./elixir_console_template` to run the application. Here's what that looks like.

```
> mix deps.get
All dependencies are up to date
> mix escript.build
Compiling 5 files (.ex)
Generated elixir_console_template app
Generated escript elixir_console_template with MIX_ENV=dev
> ./elixir_console_template --operation mult 3 5
The result is 15
>
```

Tests can be run using `mix test`.

```
> mix test
Compiling 5 files (.ex)
Generated elixir_console_template app
..............................

Finished in 0.3 seconds
4 doctests, 26 tests, 0 failures

Randomized with seed 636730
>
```

The application takes three arguments. The first one is the operation (add, sub, mult, div), which is specified with the `--operation` flag and the next two arguments are the numbers to be applied to the operation. Here are some examples.

```
> ./elixir_console_template --operation mult 3 5
The result is 15
> ./elixir_console_template --operation mult 3.2 5
The result is 16.0
> ./elixir_console_template --operation mult 3.3 5
The result is 16.5
> ./elixir_console_template --operation mult 3.112 5
The result is 15.56
> ./elixir_console_template --operation add 4.2 2.34
The result is 6.54
> ./elixir_console_template --operation mult 4.2 2.34
The result is 9.828
> ./elixir_console_template --operation div 4.2 2.34
The result is 1.7948717948717952
> ./elixir_console_template --operation div 16 3
The result is 5.333333333333333
> ./elixir_console_template --operation div 16 4
The result is 4.0
> ./elixir_console_template --operation div 0 4
The result is 0.0
> ./elixir_console_template --operation div 4 0
** (ArithmeticError) bad argument in arithmetic expression
    (elixir_console_template 0.1.0) lib/operations.ex:58: ElixirConsoleTemplate.Operations.divide/2
    (elixir_console_template 0.1.0) lib/elixir_console_template.ex:39: ElixirConsoleTemplate.process/1
    (elixir 1.10.4) lib/kernel/cli.ex:124: anonymous fn/3 in Kernel.CLI.exec_fun/2
```

This simple functionality is intended to give you an example of a console application with command line arguments while providing a template to use to quickly get your own application up and running.