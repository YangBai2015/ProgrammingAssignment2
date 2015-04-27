## Put comments here that give an overall description of what your
## functions do

## MakeCacheMatrix function take default argument x=matrix(), and return a list of four functions

makeCacheMatrix <- function(x = matrix()) {
    inversedMatrix <- NULL
    set_matrix <- function (y) {
        x <<- y
        inversedMatrix <<- NULL
    }
    get_matrix <- function () x
    set_inversedMatrix <- function (inversed) inversedMatrix <<- inversed
    get_inversedMatrix <- function() inversedMatrix
    list(set_matrix=set_matrix, get_matrix=get_matrix, set_inversedMatrix=set_inversedMatrix, get_inversedMatrix=get_inversedMatrix)
}


## cacheSolve function proceed the sepcial "matrix" returned by makeCacheMatrix. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
    inversedMatrix <- x$get_inversedMatrix()
## Return a matrix that is the inverse of 'x'
    if(!is.null(inversedMatrix)) {
        message("getting cached data")
        return (inversedMatrix)
    }
    else {
        matrix <- x$get_matrix()
        inversedMatrix <- solve(matrix)
        x$set_inversedMatrix(inversedMatrix)
        inversedMatrix
    }
        
}
