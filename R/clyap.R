#' Solve continuous-time Lyapunov/Sylvester equations
#' \code{clyap} solve the continuous-time Lyapunov equations
#' \deqn{AXE' + EXA'+Q=0.}
#' 
#' @param A Square matrix
#' @param Q Square matrix
#' @param E Square matrix or \code{NULL}
#' @param WKV the working vector obtained by a first call to lyapunov solver
#' @param all logical
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

clyap <- function(A, Q, E=NULL, all = FALSE) {
  if (is.null(E)) {
    E <- diag(1, NCOL(A))
  }
  sylvester_c(A = A, E = E, QQ = Q, cond.number = FALSE, 
              all = all)
}

#' @rdname clyap
#' @export
clyap2 <- function(A, Q, WKV, E=NULL) {
  if (is.null(E)) {
    E <- diag(1, NCOL(A))
  }
  sylvester_cq(A = A, E = E, QQ = Q, WKV = WKV, cond.number = FALSE)
}


