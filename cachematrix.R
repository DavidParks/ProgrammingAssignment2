## Put comments here that give an overall description of what your
## functions do
# The following functions calculate the inverse of a matrix, 
# which is a computationally expensive operation, and 
# cache the result for later retrieval and use.

## Write a short comment describing this function
# This function creates an object that includes functions 
# to set and get a cached matrix and the inverse of the matrix. 
makeCacheMatrix <- function(x = matrix()) {
    # Start with a null inverse(i)
    i <- NULL
    # Set the matrix and NULL inverse in cached variables
    # in a higher level environment using <<-
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    # Retrieve the cached matrix
    get <- function() {
        x
    }
    # Set the inverse of the matrixi cache
    setinverse <- function(inv) {
        i <<- inv
    }
    # Retrieve the inverse of the matrix from cache
    getinverse <- function() {
        i
    }
    # Create a list of the setter and getter functions
    # to be called from the parent function
    list(set = set, 
         get = get, 
         setinverse = setinverse, 
         getinverse = getinverse)
}


## Write a short comment describing this function
# This function calculates and returns the inverse of a matrix
# returned by the makeCacheMatrix function.
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    # Retrieve the contents of the cached inverse variable
    i <- x$getinverse()
    # If the contents of the variable is not NULL, return it
    if(!is.null(i)) {
        message("getting cached inverse")
        return(i)
    }
    # If the contents of the cached inverse variable is NULL,
    # retrieve the matrix from cache, calculate the inverse,
    # set the inverse in cache, and return the inverse
    data <- x$get()
    i <- solve(data)
    x$setinverse(i)
    i
}
