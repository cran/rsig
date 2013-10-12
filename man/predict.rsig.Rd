\name{predict.rsig}
\alias{predict.rsig}
\title{Make Prediction}
\usage{
  \method{predict}{rsig} (object, newdata, ...)
}
\arguments{
  \item{object}{[\code{rsig}]\cr An output object from
  rsig, see \code{\link[rsig]{rsig}}.}

  \item{newdata}{[\code{data.frame}]\cr Data frame or
  matrix of input data (rows: examples, columns:
  features).}

  \item{...}{[ANY]\cr Additional arguments, currently
  ignored.}
}
\value{
  Risk prediction on new data.
}
\description{
  Return risk prediction on new data.
}
\seealso{
  \code{\link{rsig}}, \code{\link{rsig.eval}},
  \code{\link{rsig.all}}
}

