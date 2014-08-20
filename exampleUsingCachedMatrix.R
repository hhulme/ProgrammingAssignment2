#examples using makeCacheMatrix and solveCache functions
a<-matrix(c(1,-6,3,5),2,2)

b<-matrix(c(-6,5,4,3),2,2)

x1<-makeCacheMatrix(a)
x1$get()
x1$getinv()

cacheSolve(x1)
cacheSolve(x1)

x1$set(b)

cacheSolve(x1)
cacheSolve(x1)

x2<-makeCacheMatrix()

cacheSolve(x2)
cacheSolve(x2)