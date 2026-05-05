dyn.load("target/release/libexample.dylib")

add_one <- function(x) {
    .C("add_one", as.double(x))[[1]]
}

add_one(41)
