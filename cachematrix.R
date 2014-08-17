## makeCacheMatirx creates a special "matrix", which is really a list containing functions as follows
## set: to set the value of the matrix
## get: to get the value of the matrix
## setinv: to set the value of the inverse
## getinv: to get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has not been calculated, or if the matrix has changed, this function computes the inverse.
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve simply retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
