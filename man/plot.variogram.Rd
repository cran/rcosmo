% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Statistics.R
\name{plot.variogram}
\alias{plot.variogram}
\title{Plot sample variogram}
\arguments{
\item{x}{An object of class variogram.}

\item{...}{Extra arguments as in \code{\link[geoR]{plot.variogram}} passed to plot.default.}
}
\value{
Produces a plot with the sample variogram.
}
\description{
Plots sample (empirical) variogram. Uses \code{\link[geoR]{plot.variogram}} from
\strong{geoR} package.
}
\examples{

## Download the map first
# downloadCMBMap(foreground = "smica", nside = 1024)
# df <- CMBDataFrame("CMB_map_smica1024.fits")
# cmbdf <- sampleCMB(df, sample.size = 100000)
# varcmb <- variogramCMB(cmbdf, max.dist = 0.1, num.bins = 30, sample.size=1000)
# plot(varcmb)

}
\references{
\strong{geoR} package, \code{\link{variogramCMB}}, \code{\link[geoR]{variog}},
\code{\link[geoR]{plot.variogram}}
}
