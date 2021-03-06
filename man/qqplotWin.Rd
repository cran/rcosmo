% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Statistics.R
\name{qqplotWin}
\alias{qqplotWin}
\title{Quantile-Quantile plots for \code{\link{CMBWindow}}s}
\usage{
qqplotWin(cmbdf, win1, win2, intensities = "I")
}
\arguments{
\item{cmbdf}{A \code{\link{CMBDataFrame}}.}

\item{win1}{A \code{\link{CMBWindow}}}

\item{win2}{A \code{\link{CMBWindow}}}

\item{intensities}{A \code{\link{CMBDataFrame}} column with measured values.}
}
\value{
A list with quantile components x and y and a QQ plot with a diagonal line
}
\description{
This function is a modification of standard \link{qqplot} functions to work
with \code{\link{CMBWindow}} regions.
}
\details{
\code{\link{qqplotWin}} produces a QQ plot of quantiles of observations in
two \code{\link{CMBWindow}}s against each other for
the specified \code{\link{CMBDataFrame}} column
\code{intensities}. The function automatically adds a diagonal line.
}
\examples{
## Download the map first
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 10000)

# win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
# win2 <- CMBWindow(theta = c(2*pi/3,3*pi/4,3*pi/4, 2*pi/3),
#                   phi = c(pi/4,pi/4,pi/3,pi/3))

# qqplotWin(cmbdf, win1, win2)

}
\references{
\link{qqnormWin}, \link{qqnorm}, \link{qqplot}
}
