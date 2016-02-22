## This is a pair of fuctions to create an inverse matrix and to 
## cache the matrix and inverse of the matrix

## This function a 'virutal' matrix, which is really a list of functions
## of getter/setters to both matrix and inverse matrix
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setmatrix <- function(solve) m <<- solve
      getmatrix <- function() m
      list(set=set, get=get,
           setmatrix=setmatrix,
           getmatrix=getmatrix)
}


## This function accepts a list of function pointers from the cached value in makeCacheMatrix
## and returns the inverse of a matrix, or calculates it if it doesn't yet exist
cacheSolve <- function(x, ...) {
      m<-x$getmatrix()
      if(!is.null(m)){
            message("getting cached data")
            return(m)
      }
      matrix<-x$get()
      m<-solve(matrix, ...)
      x$setmatrix(m)
      ## Return a matrix that is the inverse of 'x'
      m
}


