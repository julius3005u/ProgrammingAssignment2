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
## changing things appropriately in cachemean

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getminv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setminv(m)
  m
}
