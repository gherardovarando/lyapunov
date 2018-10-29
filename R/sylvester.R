sylvester_d <- function(A, E, QQ, cond.number = FALSE) {
  dA  <- dim(A)
  dE  <- dim(E)
  dQQ <- dim(QQ)
  dd  <- c(dA,dE,dQQ)
  if((max(dd) - min(dd))!=0)
    stop('A, E, QQ must be conformable square matrices')
  if(cond.number)
    ierr = 1
  else
    ierr = 0
  N     <- NAE <- NC <- dd[1]
  WKV   <- rep(0, 2*N^2+3*N)
  RCOND <- 0
  out <- .Fortran('SYLGD', as.integer(NAE), as.integer(NC), as.integer(N),
                  as.double(A), as.double(E), as.double(QQ),
                  as.double(WKV), as.integer(RCOND), as.integer(ierr))
  matrix(out[[6]], N, N)
}


sylvester_c <- function(A, E, QQ, cond.number = FALSE) {
  dA  <- dim(A)
  dE  <- dim(E)
  dQQ <- dim(QQ)
  dd  <- c(dA,dE,dQQ)
  if((max(dd) - min(dd))!=0)
    stop('A, E, QQ must be conformable square matrices')
  if(cond.number)
    ierr = 1
  else
    ierr = 0
  N     <- NAE <- NC <- dd[1]
  WKV   <- rep(0, 2*N^2+3*N)
  RCOND <- 0
  out <- .Fortran('SYLGC', as.integer(NAE), as.integer(NC), as.integer(N),
                  as.double(A), as.double(E), as.double(QQ),
                  as.double(WKV), as.integer(RCOND), as.integer(ierr))
  matrix(out[[6]], N, N)
}

