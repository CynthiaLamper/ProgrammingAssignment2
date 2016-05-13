## To make this function, I did the same as in the example. 
## It wil set the value of the matrix and after that get that value. Then it 
## will set the value of the inverse of the matrix and then it will get the 
## value of the inverse of the matrix.

## makeCacheMatrix creates a matrix and caches it inverse in it. 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL 
}

  get <- function() x
  setinverse <- function(solve) m <<-solve
  getinverse <- function() m
  list(set = set, get = get, 
       setinverse = setinverse, 
       getinverse = getinverse)
} 

## CacheSolve displays the inverse. However, only when the value 
## of the inverse did not already exist. 

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
  
## I tested this function with:
## a <- diag(5,3)
## a
## CachedMarix <- makeCacheMatrix(a)
## cacheSolve(CachedMarix)

## To get the message: 
## cacheSolve(CachedMarix)
