% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NestSearch.R
\name{pixelWindow}
\alias{pixelWindow}
\title{Find high resolution pixels falling in a lower resolution window}
\usage{
pixelWindow(j1, j2, pix.j1)
}
\arguments{
\item{j1}{An integer. The lower resolution, with j1 =< j2.}

\item{j2}{An integer. The upper resolution.}

\item{pix.j1}{An integer. The pixel index at resolution j1 within which
all pixels from resolution j2 will be returned. \code{pix.j1} can
also be a vector of non-zero pixel indices.}
}
\value{
All pixels in resolution j2 that fall within the pixel
pix.j1 specified at resolution j1
}
\description{
Find all pixels in a higher resolution that fall within the specified pixel
area at a lower resolution. All pixels are assumed to be in nested ordering.
}
\examples{

pixelWindow(3, 3, 2)
pixelWindow(3, 4, 2)
pixelWindow(3, 5, 2)

}
