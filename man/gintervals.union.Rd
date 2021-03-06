\name{gintervals.union}
\alias{gintervals.union}
\title{
Calculates a union of two sets of intervals
}
\description{
Calculates a union of two sets of intervals.
}
\usage{
gintervals.union(intervals1, intervals2, intervals.set.out = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{intervals1, intervals2}{set of one-dimensional intervals}
  \item{intervals.set.out}{intervals set name where the function result is optionally outputed}
}
\details{
This function returns intervals that represent a genomic space covered by either 'intervals1' or 'intervals2'.

If 'intervals.set.out' is not 'NULL' the result is saved as an intervals set. Use this parameter if the result size exceeds the limits of the physical memory.
}
\value{
If 'intervals.set.out' is 'NULL' a data frame representing the union of intervals.
}

\seealso{
\code{\link{gintervals.intersect}}, \code{\link{gintervals.diff}}, \code{\link{gintervals}}, \code{\link{gintervals.2d}}
}
\examples{
gdb.init_examples()

intervs1 <- gscreen("dense_track > 0.15 & dense_track < 0.18")
intervs2 <- gscreen("dense_track >= 0.18 & dense_track < 0.2")

## 'intervs3' and 'intervs4' are identical
intervs3 <- gintervals.union(intervs1, intervs2)
intervs4 <- gscreen("dense_track > 0.15 & dense_track < 0.2")
}
\keyword{ ~union }
