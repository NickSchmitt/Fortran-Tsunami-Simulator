# Ch3 Notes

### When to use subroutine over a function?

* If your procedure will cause side effects, use a subroutine.
* If you need to return more than one variable, you must use a subroutine (functions only return one).
* Always use a function unless a subroutine is necessary.

### Refactoring, part 2: Defining the initialization in an external procedure

instead of defining `icenter` and `decay` parameters, followed by the `do concurrent` loop, we can abstract this logic to a `call set_gaussian` subroutine.

### Pure Procedures

* Helps avoid side effects
* Side effects are any changes to the program outside of the procedure aside from the result that it returns.
* Using the `pure` attribute, if the compiler detects side effects it will report an error.

#### Restrictions of Pure Procedures
* Pure *functions* can't alter input arguments. All dummy arguments must be declared with `intent(in)` (why?).
* No write access to global variables.
* Can't contain `stop`, which would stop the whole program.

#### Importance of Pure Functions
* Easier to debug
* Enables the compiler to execute the procedure in the most efficient way

**Write pure procedures whenever possible**

### Writing procedures that operate on both scalars (single values) and arrays

* The `elemental` attribute allows the dummy scalar arguments<sup>*</sup> to be treated as arrays if the arguments passed in are arrays.
* This then maintains the shape of the procedure.

<sup>*</sup> dummy arguments are any arguments used during function definition e.g. `function sum(a,b)` <-- those are dummy arguments

With `elemental`, the following occurs:
* `sum(3,5)` evaluates to `8`
* `sum([1, 2], 3)` evalutes to `[4,5]`
* `sum(1, [2, 3, 4])` evalutes to `[3,4,5]`
* `sum([1, 2, 3], [2, 3, 4])` evalutes to `[3,5,7]`
* `sum([1, 2], [2, 3, 4])` is *illegal* because they are not the same shape.

* `Pure` is automatically assumed when `elemental` is used.
* You don't need to use `pure` but it's good practice.
* `impure elemental` is possible for `elemental` functionality that's not permitted in pure procedures such as I/O.

### Optional Arguments

* Optional arguments can be passed to functions and subroutines.
* Within the procedure, specify an argument as optional with:
  * `logical, intent(in), optional :: argument_name`
  * `if (present(argument_name))`
* It can then be invoked as so:
  * `call add(x, y)` (missing entirely)
  * `call add(x, y, .true)` (specifying its presence with .true)
  * `call add(x, y, argument_name=.true.)` (explicitly naming the argument and specifying its presence with true)


### Summary

* Functions
  * Invoked from expressions
  * Return only one value
  * No side effects
  * Opt for functions over subroutines whenever possible
* Subroutines
  * Invoked with `call` statements
  * Use when procedure causes side effects
  * Use when the procedure produces multiple outputs
* `Contains` to define procedures within the body of a program
* `intent` to specify intention of each procedure argument
  * `intent(in)`
  * `intent(out)`
  * `intent(in out)`
* `pure` to prohibit side effects
  * Pure procedures are easier to debug
  * Pure procedures are auto-optimized by the compiler
* `elemental` to allow both scalars and arrays. Multiple array arguments must be the same shape.
* Optional arguments
* Built-in functions
  * `real` converts numerical to real
  * `size` returns integer size of array
  * `present` checks for optional argument

Next up... MODULES!!!

