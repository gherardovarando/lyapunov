#' Solve discrete-time Lyapunov equations
#' \code{dlyap} solve the discrete-time Lyapunov equations
#' \deqn{AXA'-EXE'+Q=0.}
#' 
#' @param A, E, Q: Conformable suqare matrices.
#' 
#' @return The solution matrix \eqn{X}.
#' 
#' @details 
#' `dlyap` use `BKDIS` from ALGORITHM 705, COLLECTED ALGORITHMS FROM ACM
#' 
#' @examples 
#' 
#' X <- c(135.2810,    7.8288,   14.0392,    7.2220,
#'         7.8288,  100.5310,  -17.6854,  -12.2728,
#'        14.0392,  -17.6854,  103.4842,    4.5037,
#'         7.2220,  -12.2728,    4.5037,   88.2638)
#' X = matrix(X, 4, 4)
#' dlyap(A = X, Q = diag(4))
#' dlyap(A = X, Q = diag(4), E = crossprod(X))
#' 
#' @export
#' @useDynLib lyapunov

dlyap <- function(A, Q, E = NULL) {
  if (is.null(E)) {
    E <- diag(1, NCOL(A))
  }
  sylvester(A = A, E = E, QQ = Q, cond.number = FALSE)
}



