#' Solve continuous-time Lyapunov/Sylvester equations
#' \code{clyap} solve the continuous-time Lyapunov equations
#' \deqn{AXE' + EXA'+Q=0.}
#' 
#' @param A Square matrix
#' @param Q Square matrix
#' @param E Square matrix or \code{NULL}
#' 
#' @return The solution matrix \eqn{X}.
#' 
#' @details 
#' `clyap` use `BKDIS` from ALGORITHM 705, COLLECTED ALGORITHMS FROM ACM
#' 
#' @examples 
#' 
#' 
#' @export
#' @useDynLib lyapunov

clyap <- function(A, Q, E=NULL) {
  if (is.null(E)) {
    E <- diag(1, NCOL(A))
  }
  sylvester_c(A = A, E = E, QQ = Q, cond.number = FALSE)
}



