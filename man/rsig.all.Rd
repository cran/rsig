\name{rsig.all}
\alias{rsig.all}
\title{Robust Signature Selection for Survival Outcomes with Estimation of Selection Probabilities of Features}
\usage{
  rsig.all(surv, X, model, n.rep.out = 10L, n.rep.in = 10L,
    plapply = mclapply, sd.filter = NULL)
}
\arguments{
  \item{surv}{[\code{Surv}]\cr Survival object, see
  \code{\link[survival]{Surv}}.}

  \item{X}{[\code{data.frame}]\cr Data frame or matrix or
  matrix of input data (rows: examples, columns:
  features).}

  \item{model}{[\code{character(1)}]\cr Model to use. One
  of \cr "rs.prlasso" (preconditioned lasso with robust
  selection), \cr "rs.lasso" (penalized Cox regression with
  robust selection), \cr "prlasso" (preconditioned lasso),
  or \cr "lasso" (penalized Cox regression)}

  \item{n.rep.out}{[\code{integer}]\cr The number of
  replicates to be used to estimate selection probability
  of features (outer subsampling)}

  \item{n.rep.in}{[\code{integer}]\cr The number of
  replicates to be used for model aggregation (inner
  subsampling)}

  \item{plapply}{[\code{function}]\cr Function used for
  internal parallelization.  Default is
  \code{\link[parallel]{mclapply}} for multi-core parallel
  execution.}

  \item{sd.filter}{[\code{list}]\cr Pre-filter features by
  their standard deviation, by one of the options
  specified:\cr topk: no. of features to be selected with
  largest standard devations.\cr quant: the min percentile
  in standard deviations of features to be selected.}
}
\value{
  Object of class \dQuote{list}.
  \item{selection.frequency}{a named vector of selected
  features with their estimated selection frequencies
  amongst n.rep.out replicates.} \item{perf}{performance
  measured on out-of-sample data in n.rep.out replicates}
}
\description{
  Fit a specified model using subsamples and evaluate its
  performance on out-of-subsample data.
}
\seealso{
  \code{\link{rsig}}
}

