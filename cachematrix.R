## write a pair of functions that cache the inverse of a matrix

## makeCacheMatrix create special "matrix" object that can cache its inverse. contains 4 function. (set, get, setinverse, getinverse)

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<- solve
      getinverse <- function() m
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## Function “cacheSolve” computes the inverse of the special “matrix” 
## (which is the input of cachesolve) returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
## If the inverse has not been calculated, data gets the matrix stored with makeCacheMatrix, 
## m calculates the inverse, and x$setinverse(m) stores it in the object m in makeCacheMatrix.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
      m
}
