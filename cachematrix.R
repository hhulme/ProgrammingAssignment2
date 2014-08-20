## makeCacheMatirx creates a special "matrix", which is really a list containing functions as follows
## set: to set the value of the matrix
## get: to get the value of the matrix
## setinv: to set the value of the inverse
## getinv: to get the value of the inverse
## example: mycm<-makeCacheMatrix(matrix(1,-2,3,4),2,2)


makeCacheMatrix <- function(x = matrix()) {
    
    #x -  the cached matrix, default the empty matrix
    #inv -  the cached inverse, initialized to NULL
    inv <- NULL
    
    
    #set - caches the matrix. 
    #When setting a new value for the matrix, automatically reset cached inverse to NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    
    #get - returns the current value of the cached matrix
    get <- function() x
    
    #setinv - sets a new value for the cached inverse
    setinv <- function(inverse) inv <<- inverse
    
    #getinv - gets the current value of the cached inverse
    getinv <- function() inv
    
    #return value: returns a list of the functions which can be carried out
    list(set = set, 
         get = get,
         setinv = setinv,
         getinv = getinv)

}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## If the inverse has not been calculated, or if the matrix has changed, this function computes the inverse.
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve simply retrieves the inverse from the cache.

## example: mycm<-makeCacheMatrix(matrix(1,-2,3,4),2,2)
## cacheSolve(mycm)
## cacheSolve(mycm)
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of cached matrix 'x'
    
    ##look at current value of cached inverse
    inv <- x$getinv()
    
    ##if cached inverse is present, return it
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    
    ##no cached inverse is present, so calculate it and set the cached inverse:
    ## get the matrix
    data <- x$get()
    ## calculate the inverse
    inv <- solve(data, ...)
    ## cache the value of the inverse
    x$setinv(inv)
    ## return the inverse
    inv
}
