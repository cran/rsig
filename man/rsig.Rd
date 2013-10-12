\name{rsig}
\alias{rsig}
\title{Robust Signature Selection for Survival Outcomes}
\usage{
  rsig(surv, X, model, n.rep = 10L, plapply = mclapply,
    sd.filter = NULL, verbose = TRUE)
}
\arguments{
  \item{surv}{[\code{Surv}]\cr Survival object, see
  \code{\link[survival]{Surv}}.}

  \item{X}{[\code{data.frame}]\cr Data frame or matrix or
  matrix of input data (rows: examples, columns: features).
  Columns must have names assigned.}

  \item{model}{[\code{character(1)}]\cr Model to use. One
  of \cr "rs.prlasso" (preconditioned lasso with robust
  selection), \cr "rs.lasso" (penalized Cox regression with
  robust selection), \cr "prlasso" (preconditioned lasso),
  or \cr "lasso" (penalized Cox regression)}

  \item{n.rep}{[\code{integer}]\cr The number in replicates
  to be used for model aggregation. A large enough number
  is suggested.}

  \item{plapply}{[\code{function}]\cr Function used for
  internal parallelization.  Default is
  \code{\link[parallel]{mclapply}} for multi-core parallel
  execution. Change it to \code{\link[base]{lapply}} for
  single-core execution.}

  \item{sd.filter}{[\code{list}]\cr Pre-filter features by
  their standard deviation, by one of the options
  specified:\cr topk: no. of features to be selected with
  largest standard devations, or\cr quant: the min
  percentile in standard deviations of features to be
  selected.}

  \item{verbose}{[\code{logical}]\cr Controls message
  output.}
}
\value{
  Object of class \dQuote{rsig}; a list consisting of
  \item{model}{model specified by the user}
  \item{sd.filter}{sd.filter object}
  \item{beta}{coefficient vector}
  \item{intercept}{intercept}
}
\description{
  Find a robust signature, i.e. a set of features, using
  averaged and shrucken generalized linear models.
  Subsamples are taken to fit models, via
  \eqn{\ell_1}-penalized Cox regression (lasso) or
  preconditioned lasso (prlasso) algorithm.
}
\examples{
# An example adapted from glmnet package

set.seed(11011)
n = 300
p = 10
nz = 3
X = matrix(rnorm(n*p),n,p,dimnames=list(NULL,seq_len(p)))
beta = rnorm(nz)
f = X[,seq_len(nz)] \%*\% beta
h = exp(f) / 365.25
t = rexp(n,h)
tcens = rbinom(n=n,prob=.3,size=1) # censoring indicator
S = Surv(t, 1-tcens)

fit = rsig(S, X, "rs.prlasso", n.rep=2)
pred = predict(fit, X)
perf = rsig.eval(pred, S, X)
}
\seealso{
  \code{\link{predict.rsig}}, \code{\link{rsig.eval}},
  \code{\link{rsig.all}}
}

