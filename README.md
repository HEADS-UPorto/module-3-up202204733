<!-- README.md is generated from README.Rmd. Please edit that file -->

<img src=".assets/figures/logo.png" align="right" style="float:right;"/>

<!-- start badges -->

<img src="https://github.com/HEADS-UPorto/${{env.REPOSITORY_SLUG}}/workflows/Building%20Binder/badge.svg" alt="Building Binder"/>
<a href="https://mybinder.org/v2/gh/HEADS-UPorto/Rstudio_Env/main?urlpath=git-pull%3Frepo%3Dhttps%253A%252F%252Fgithub.com%252FHEADS-UPorto%252F${{env.REPOSITORY_SLUG}}%26targetPath%3Dheads%26urlpath%3Drstudio%252F%26branch%3Dmaster"><img src="https://mybinder.org/badge_logo.svg" alt="Launch Binder"/></a>

<img src="https://github.com/HEADS-UPorto/${{env.REPOSITORY_SLUG}}/workflows/GitHub%20Classroom%20Workflow/badge.svg?branch=master&event=push" alt="GitHub Classroom Workflow"/>

<!-- end badges -->

Syllabus
--------

This module will cover Composite Data Types:

-   Vectors
-   Factors
-   Matrices
-   Lists
-   Data Frames

Lessons
-------

### Module 3.1: Vectors

Starting from the last class, we see that the variables only contained
one value. If we want to store several values in a variable, we use the
`c()` function. This functions means “concatenate”, or link (things)
together in a chain or series.

That is when the Vectors come to play. A vector is a combination of
values of the same **Basic** type, as for example:

``` r
my_vector <- c(1, 2, 3) # this is a vector of `numeric` with length 3
my_other_vector <- c("one", "two", "three") # this is a vector of `character`
```

Vectors can only store values of the **same** type. If you try to
combine different types, R will try its best to find a type that can
accommodate all data, so be careful.

For example:

``` r
# here we have a vector of integers
my_int <- c(1L, 2L, 3L)
typeof(my_int)
## [1] "integer"

# here we have a vector (yes! this is a vector of length 1) with one string
my_char <- "some string"
typeof(my_char)
## [1] "character"

# now we combine them
my_combined_vector <- c(my_int, my_char)
typeof(my_combined_vector)
## [1] "character"

# We can't convert a string into an integer, but we can convert an integer into a string!
my_combined_vector
## [1] "1"           "2"           "3"           "some string"
```

Vectors are flat, they have no dimensions (you will understand later),
and to get its size, you **must** use the `length()` function.

### Module 3.2: Factors

Factor is a type that encodes categorical data. Its underlying structure
is composed by integers, but linked to an attribute composed by strings,
which are the **levels** of the factors.

The factor is a Composite type because it links integers and strings
intrinsically to simbolize “categories” while keeping a low memory usage
and computational efficiency.

Check this out:

``` r
# first let's create a vector with factors
my_factor <- factor(c("male", "female", "female", "male", "male", "male"))
my_factor
## [1] male   female female male   male   male  
## Levels: female male

# now, let's inspect the structure of this variable (can you see the integers?)
str(my_factor)
##  Factor w/ 2 levels "female","male": 2 1 1 2 2 2

# now let's go further deep, let's remove the class of this object and see the structure
# It is a vector of integers, and has an attribute called "levels" that contains two strings
str(unclass(my_factor))
##  int [1:6] 2 1 1 2 2 2
##  - attr(*, "levels")= chr [1:2] "female" "male"
```

You can use the function `levels()` to see which “categories”
(i.e. levels) the factor contains, or just `nlevels()` get the count of
levels.

### Module 3.3: Matrices

A matrix, as you remember from mathematics, its a “table-like”
structure, with two dimensions (remember what I said about vectors?).
You may ask, what about multidimensional matrices? In R, there is
another type that can have more than two dimensions, but let’s keep it
simple for now.

You can check the dimensions of a matrix with the `dim()` function:

``` r
my_matrix <- matrix(30:16, 5, 3) # create a matrix with 5 rows and 3 columns

my_matrix
##      [,1] [,2] [,3]
## [1,]   30   25   20
## [2,]   29   24   19
## [3,]   28   23   18
## [4,]   27   22   17
## [5,]   26   21   16

dim(my_matrix) # in R, rows always comes first
## [1] 5 3
```

We can also check the specifically the number of rows with `nrow()` and
columns with `ncol()`:

``` r
nrow(my_matrix)
## [1] 5

ncol(my_matrix)
## [1] 3
```

Moreover, we can check the whole size of our matrix with `length()`.
This will give us the total number of elements that out matrix contains.

``` r
length(my_matrix)
## [1] 15
```

This is important to know, because we have two ways to access matrices
elements, giving the row-column value, or its flat index (we will talk
about accessing elements later), like this:

``` r
# second row, third column
my_matrix[2, 3]
## [1] 19

# or, the 12th element
my_matrix[12]
## [1] 19
```

As for vectors, matrices also can only contain one **Basic** type.

Another way to create a matrix is binding vectors by column with
`cbind()` or by row with `rbind()`:

``` r
my_vector <- c(1, 2, 3)
# when combining vectors, they must have the same length.
my_binded_matrix <- rbind(my_vector, my_vector)
my_binded_matrix
##           [,1] [,2] [,3]
## my_vector    1    2    3
## my_vector    1    2    3

my_other_matrix <- cbind(my_vector, my_vector)
my_other_matrix
##      my_vector my_vector
## [1,]         1         1
## [2,]         2         2
## [3,]         3         3
```

### Module 3.4: Lists

A List is one of the most versatile objects in R. It can contain
different types of data, like a number, a vector, functions or even
another list, forming a tree-like structure. The elements can have
different lengths.

Here is an example:

``` r
my_vector <- c(1, 2, 3)
my_list <- list(test = "string", flag = TRUE, m = matrix(0, 3, 2))
my_tree <- list(a = 1, b = my_list, 3, c = my_vector, f = function(){print("hello")})
str(my_tree)
## List of 5
##  $ a: num 1
##  $ b:List of 3
##   ..$ test: chr "string"
##   ..$ flag: logi TRUE
##   ..$ m   : num [1:3, 1:2] 0 0 0 0 0 0
##  $  : num 3
##  $ c: num [1:3] 1 2 3
##  $ f:function ()  
##   ..- attr(*, "srcref")= 'srcref' int [1:8] 4 59 4 84 59 84 4 4
##   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000171368b0>
```

Lists are dynamic, and this object is efficient for adding and removing
elements.

To remove an element, just set its value to `NULL`:

``` r
# to access an element, you can use the $ (dollar) symbol
my_tree$c <- NULL
str(my_tree)
## List of 4
##  $ a: num 1
##  $ b:List of 3
##   ..$ test: chr "string"
##   ..$ flag: logi TRUE
##   ..$ m   : num [1:3, 1:2] 0 0 0 0 0 0
##  $  : num 3
##  $ f:function ()  
##   ..- attr(*, "srcref")= 'srcref' int [1:8] 4 59 4 84 59 84 4 4
##   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000171368b0>
```

An important thing is that, as you can see above, there is an element
that has no “name” associated with it (the num 3, now at the 3rd
position of this list).

To access this element, you have to use its position, not its name. This
can be complicated if you add/remove elements. So its a good practice to
give meaningful names to the elements.

Another important difference is that lists has two levels of accessing
its elements. You can access the **element** or **the value of the
element**. This sounds complicated, but let’s see a brief example:

``` r
# here we are accessing the element:
my_tree[3] # here we are using the index, because this element has no name
## [[1]]
## [1] 3

# it still a list, with one element
class(my_tree[3])
## [1] "list"

# here we are acessing the value of the element
my_tree[["a"]] # this is the same as using the $ (dollar) sign
## [1] 1

# now we just have the numeric, no more lists
class(my_tree[["a"]])
## [1] "numeric"
```

The size of a list depends on what you want to measure:

``` r
# how many elements there are in this list?
str(my_tree)
## List of 4
##  $ a: num 1
##  $ b:List of 3
##   ..$ test: chr "string"
##   ..$ flag: logi TRUE
##   ..$ m   : num [1:3, 1:2] 0 0 0 0 0 0
##  $  : num 3
##  $ f:function ()  
##   ..- attr(*, "srcref")= 'srcref' int [1:8] 4 59 4 84 59 84 4 4
##   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x00000000171368b0>
length(my_tree) # this is the number of the top-level elements
## [1] 4

# I want to know how many values are stored inside the whole object
length(unlist(my_tree)) # we don't count the nodes
## [1] 11
```

Just for fun, let’s call the function we put inside the list:

``` r
my_tree$f()
## [1] "hello"
```

### Module 3.5: Data Frames

Finally, we will meet the Data Frame. This type shares many properties
of matrices and lists:

-   It has two dimensions. All lines must have the same number of
    columns, and all columns must have the same number of lines.
-   The values can be accessed using the matrix syntax: \[row, column\]
-   The columns have names, and we can access them using the $ (dollar)
    sign
-   Each column can have a different data type. The rows inside a column
    are from the same data type (there are weird exceptions, but let’s
    not think about that).

Data Frames are usually the output of functions that imports external
data, as `read_csv()` for example. We can also create a data frame using
the `data.frame()` function:

``` r
my_data <- data.frame(name = c("John", "Mary", "Sam", "Peter"), age = c(30, 25, 40, 37))
my_data
##    name age
## 1  John  30
## 2  Mary  25
## 3   Sam  40
## 4 Peter  37
```

Data Frames are useful for data science because:

-   Ensures that each variable (column) has an observation (row), or at
    least registers it as missing
-   Ensures that each column has a name associated (the variable name)
-   Are a stable concept across multiple languages ([read
    more](https://plateau-workshop.org/assets/papers-2019/10.pdf))

As for matrices, use `dim()`, `nrow()` and `ncol()` to inspect the shape
of the data frame. Using `length()` will return the total count of
elements the data frame has (usually rows x cols).

For retrieving the names of all variables (columns) use `colnames()`:

``` r
colnames(my_data)
## [1] "name" "age"
```

### Module 3.6: Write a simple R code

Your third task will be:

1.  Open the file `assessment.R` that is already in the project, and
    start from there.
2.  Complete the code following the instructions in the comments
