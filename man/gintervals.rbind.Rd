\name{gintervals.rbind}
\alias{gintervals.rbind}
\title{
Combines several sets of intervals
}
\description{
Combines several sets of intervals into one set.
}
\usage{
gintervals.rbind([intervals]+, intervals.set.out = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{intervals}{intervals set}
  \item{intervals.set.out}{intervals set name where the function result is optionally outputed}
}
\details{
This function combines several intervals sets into one set. It works in a similar manner as 'rbind' yet it is faster. Also it supports intervals sets that are stored in files including the big intervals sets.

If 'intervals.set.out' is not 'NULL' the result is saved as an intervals set. If the format of the output intervals is set to be "big" (determined implicitly based on the result size and options), the order of the resulted intervals is altered as they are sorted by chromosome (or chromosomes pair - for 2D).
}
\value{
If 'intervals.set.out' is 'NULL' a data frame combining intervals sets.
}

\seealso{
\code{\link{gintervals}}, \code{\link{gintervals.2d}}, \code{\link{gintervals.canonic}}
}
\examples{
gdb.init_examples()

intervs1 <- gextract("sparse_track", gintervals(c(1, 2), 1000, 4000))
intervs2 <- gextract("sparse_track", gintervals(c(2, "X"), 2000, 5000))
gintervals.save("testintervs", intervs2)
gintervals.rbind(intervs1, "testintervs")
gintervals.rm("testintervs", force = TRUE)
}
\keyword{ ~rbind }

