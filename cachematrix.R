## Caching the Inverse of a Matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
          m <- NULL
          ## set the value of the matrix
          set <- function(y) {
            x <<- y
            m <<- NULL
          }
          
          ## get the value of the matrix
          get <- function() x
          
          ## set the value of the inverse
          setinv <- function(solve) m <<- solve
          
          ##get the value of the inverse
          getinv <- function() m
          list(set = set, get = get,
               setinv = setinv,
               getinv = getinv)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        ## If cached value is available, retrieve it.
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        ## If cached value is not available, inverse the matrix.
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
