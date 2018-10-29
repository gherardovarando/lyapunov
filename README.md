###

Forked from https://github.com/gragusa/lyapunov

Continuous time Sylvester/ Lyapunov equations solver calling `SYLGC` subroutine

## Description

`lyapunov` is a `R` package for solving the discrete time Lyapunov equation:

![lyapunov](man/lyapunov.png)

This kind of equation arise in the context of Kalman Filter, and specifically to initialize the variance of the states in the linear filter.

The package provides a single command `dlyap`. The simple code below describes the interface, which is similar to Matlab's.

```r
M <- c(135.2810,    7.8288,   14.0392,    7.2220,
       7.8288,  100.5310,  -17.6854,  -12.2728,
      14.0392,  -17.6854,  103.4842,    4.5037,
       7.2220,  -12.2728,    4.5037,   88.2638)
M = matrix(M, 4, 4)

## Solve AXA' - X + Q = 0
dlyap(A = M, Q = diag(4))

## Solve AXA' - EXE' + Q = 0
dlyap(A = M, Q = diag(4), E = crossprod(M))
```

`lyapunov` is a simple wrapper to Algorithm 705 from the Collected Algorithms from ACM, TRANSACTIONS ON MATHEMATICAL SOFTWARE, VOL. 18, NO. 2, PP. 232-238.75.

## Installation
To install the package:

```r
library(devtools)
devtools::install_github("gragusa/lyapunov")
```

You need development tools installed.
