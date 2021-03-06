% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CMBWindowHelpers.R
\name{winType}
\alias{winType}
\title{Get/change winType}
\usage{
winType(win, new.type)
}
\arguments{
\item{win}{a \code{CMBWindow} object or a list of such}

\item{new.type}{optionally specify a new type. Use this to
change between "polygon" and "minus.polygon" or to change
between "disc" and "minus.disc"}
}
\value{
If \code{new.type} is missing then the \code{winType} of win
is returned. Otherwise a new window is returned with \code{winType}
equal to \code{new.type}
}
\description{
Get/change the winType (polygon or disk) of a \code{\link{CMBWindow}}.
If \code{new.type} is missing then the \code{winType} of win
is returned. Otherwise, a new window is returned with \code{winType}
equal to \code{new.type}. If you want to change the
winType of \code{win} directly, then use \code{\link{winType<-}}, see
the examples below.
}
\examples{

win <- CMBWindow(theta = c(pi/2,pi/2,pi/3, pi/3), phi = c(0,pi/3,pi/3,0))
winType(win)

win1 <- CMBWindow(x=0,y=3/5,z=4/5,r=0.8)
winType(win1)
cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian",
                      ordering = "nested")
cmbdf.win1 <- window(cmbdf, new.window = win1)
plot(cmbdf.win1)


winType(win1) <- "minus.disc"
winType(win1)
cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian",
                      ordering = "nested")
cmbdf.win1 <- window(cmbdf, new.window = win1)
plot(cmbdf.win1)


}
