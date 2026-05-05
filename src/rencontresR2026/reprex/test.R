dyn.load("example.so")

add_two <- function(x) {
    .Call("add_two", as.numeric(x))
}

add_two(41)
