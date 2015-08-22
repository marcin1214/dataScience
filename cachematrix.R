
## make Cache Function, similar to makeVector

makeCacheMatrix <- function(m = matrix()) {
    invMatrix <- NULL
    set <- function(y) {
        m <<- y
        invMatrix <<- NULL
    }
    get <- function() m
    setInvMatrix <- function(iM)  invMatrix <<- iM
    getInvMatrix <- function() invMatrix
    list(set = set, get = get,
         setInvMatrix = setInvMatrix,
         getInvMatrix = getInvMatrix)
}


## similiar to cachemean, calculate inverse matrix

cacheSolve <- function(x, ...) {
    m <- x$getInvMatrix()
    if (!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInvMatrix(m)
    m
    ## Return a matrix that is the inverse of 'x'
}
