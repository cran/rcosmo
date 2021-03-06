% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CMBDataFrameGenerics.R
\name{window.CMBDataFrame}
\alias{window.CMBDataFrame}
\title{Get a sub window from \code{\link{CMBDataFrame}}}
\usage{
\method{window}{CMBDataFrame}(x, new.window, intersect = TRUE, in.pixels,
  in.pixels.res = 0, ...)
}
\arguments{
\item{x}{A \code{\link{CMBDataFrame}}.}

\item{new.window}{Optionally specify a new window
in which case a new CMBDataFrame is returned whose CMBWindow is new.window.
\code{new.window} may also be a list (see details section and examples).}

\item{intersect}{A boolean that determines
the behaviour when \code{new.window} is a list containing BOTH
regular type and "minus" type windows together (see details).}

\item{in.pixels}{A vector of pixels at resolution
\code{in.pixels.res} whose union contains the
window(s) \code{new.window} entirely, or if \code{new.window} is
unspecified then this whole pixel is returned.}

\item{in.pixels.res}{An integer. Resolution
(i.e., \eqn{j} such that nside = \code{2^j}) at
which the \code{in.pixels} parameter is specified}

\item{...}{Unused arguments.}
}
\value{
The window attribute of \code{x} or, if new.window/in.pixels is specified,
a new CMBDataFrame.
}
\description{
When new.window or in.pixels is unspecified this function returns the
\code{\link{CMBWindow}} attribute of a
CMBDataFrame. The return value is NULL if the window is full sky.
When new.window is specified this function instead returns
a new CMBDataFrame whose CMBWindow attribute is new.window
}
\details{
Windows that are tagged with \code{set.minus} (see \code{\link{CMBWindow}})
are treated differently from other windows.

If the argument \code{new.window} is a list of CMBWindows,
then interious of all windows whose
winType does not include "minus" are united (let \eqn{A} be their union) and
exteriors of all windows whose winType does include "minus" are intersected,
(let \eqn{B} be their intersection). Then, provided that
\code{intersect = TRUE} (the default), the returned CMBDataFrame will
be the points of \code{cmbdf} in the the intersection of \eqn{A} and \eqn{B}.
Otherwise, if \code{intersect = FALSE}, the returned CMBDataFrame
consists of the points of \code{x} in the union of
\eqn{A} and \eqn{B}.

Note that if \eqn{A} (resp. \eqn{B}) is empty then the returned CMBDataFrame
will be the points of \code{x} in \eqn{B} (resp. \eqn{A}).
}
\examples{


## Example 1: Create a new CMBDataFrame with a window

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian",
                      ordering = "nested")
win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
cmbdf.win <- window(cmbdf, new.window = win)
plot(cmbdf.win)
window(cmbdf.win)

## Example 2: Change the window of an existing CMBDataFrame

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
window(cmbdf) <- win2 <- CMBWindow(theta = c(pi/6,pi/3,pi/3, pi/6),
                                   phi = c(0,0,pi/6,pi/6))
plot(cmbdf)

## Example 3: union of windows

## Create 2 windows
win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
win2 <- CMBWindow(theta = c(2*pi/3,3*pi/4,3*pi/4, 2*pi/3),
                            phi = c(pi/4,pi/4,pi/3,pi/3))
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the union of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2), intersect = FALSE)
plot(cmbdf.win)

## Example 4: intersection of windows

## Create 2 windows
win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4),
                  phi = c(pi/4,pi/4,pi/3,pi/3))
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the intersection of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win1 <- window(cmbdf, new.window = win1)
cmbdf.win12 <- window(cmbdf.win1, new.window = win2)
plot(cmbdf.win12)
plot(win1)
plot(win2)


## Example 5: intersection of windows with "minus" type

## Create 2 windows with "minus" type
win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2),
                  set.minus =TRUE)
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4),
                  phi = c(pi/4,pi/4,pi/3,pi/3),
                  set.minus =TRUE)
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the intersection of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2))
plot(cmbdf.win)


## Example 6: intersection of windows with different types

##Create 2 windows, one with "minus" type

win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4),
                  phi = c(pi/4,pi/4,pi/3,pi/3),
                  set.minus =TRUE)
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the intersection of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2), intersect = TRUE)
plot(cmbdf.win)

## Example 7: union of windows with different types

win1 <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2), set.minus =TRUE)
win2 <- CMBWindow(theta = c(pi/4,pi/3,pi/3, pi/4), phi = c(pi/4,pi/4,pi/3,pi/3))
plot(win1)
plot(win2)

## Create CMBDataFrame with points in the union of win1 and win2

cmbdf <- CMBDataFrame(nside = 64, coords = "cartesian", ordering = "nested")
cmbdf.win <- window(cmbdf, new.window = list(win1, win2), intersect = FALSE)
plot(cmbdf.win)


}
