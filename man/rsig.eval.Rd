\name{rsig.eval}
\alias{rsig.eval}
\title{Performance Evaluation}
\usage{
  rsig.eval(pred, surv.new, X.new, measures = "all",
    roc.time = 5)
}
\arguments{
  \item{pred}{[\code{predict.rsig}]\cr An output object
  from predict.rsig, see \code{\link[rsig]{predict.rsig}}.}

  \item{surv.new}{[\code{Surv}]\cr Survival object, see
  \code{\link[survival]{Surv}}.}

  \item{X.new}{[\code{data.frame}]\cr Data frame or matrix
  or matrix of input data (rows: examples, columns:
  features).}

  \item{measures}{[\code{list}]\cr List of performance
  measures to be evaluated, "all" or in c("cindex",
  "tauc")}

  \item{roc.time}{[\code{numeric(1)}]\cr Time to evaluate
  the time-dependent AUC. Default is \code{5}.}
}
\value{
  Performance values
}
\description{
  Evaluate performance on new data using predictions.
}
\seealso{
  \code{\link{rsig}}, \code{\link{predict.rsig}},
  \code{\link{rsig.all}}
}

