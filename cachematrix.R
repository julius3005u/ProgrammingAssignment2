## This function creates a special "matrix" object
## that can cache its inverse.


## structure is a copy and paste from README.txt
## changing makeVector function as be neccesary

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL ## the matrix
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    setminv <- function(minversa) m <<- minversa
    getminv <- function() m
    list(set = set, get = get,
         setminv = setminv,
         getminv = getminv)
  
}


## Find the inverse of matrix set with makeCacheMatrix
## changing things appropriately in cachemean example

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getminv()
  if(!is.null(m)) {
    message("getting cached data") ## if the inverse exists
    return(m)
  }
  data <- x$get() ## if the inverse does not exist.
  m <- solve(data, ...) ## solve is an R function
  x$setminv(m)
  m
}
