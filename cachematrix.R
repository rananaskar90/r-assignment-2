## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function

#please install and use matlib library,it is used to calculate inverse in cachesolve fn
install.packages("matlib")
library(matlib)

#used to cache a matrix's inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
# The below function takes output from makecachematrix fn and computes the inverse of 
#the input matrix given to makecachematrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  mat <- x$get()
  i <- inv(mat)
  x$setInverse(i)
  i
}

#use cases
mat <- makeCacheMatrix(matrix(c(3,4,5,6),2,2))
cacheSolve(mat)
