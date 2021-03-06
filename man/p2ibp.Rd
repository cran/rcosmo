% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Conversion.R
\name{p2ibp}
\alias{p2ibp}
\title{Return pixel index within its base pixel}
\usage{
p2ibp(p, j)
}
\arguments{
\item{p}{The pixel index at resolution j, in nested order.}

\item{j}{The resolution parameter nside = 2^j}
}
\description{
Convert a pixel index \eqn{p} to its index within
the base pixel to which \eqn{p} belongs
}
\examples{

p2ibp(6, 0)
p2ibp(6, 1)

}
