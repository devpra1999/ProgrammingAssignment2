## The following functions will help fasten inverse calculation by creating a cache

## Makes a special vector: a list of the functions to set and get the values of the matrix and the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function(){
        x
    }
    setmean <- function(inversemat){
        inv <<- inversemat
    }
    getmean <- function(){
        inv
    }
    list(set = set, get = get, setmean = setmean, getmean = getmean)
}


## The following function calculates the inverse if it is NULL anf returns it and otherwise returns the value of the 
## already calculated inverse
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv = x$getmean()
    if (!is.null(inv)){
        message("getting cache")
        return(inv)
    }
    data <- x$get()
    inv = solve(data)
    x$setmean(inv)
    inv
}
