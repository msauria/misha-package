\name{gintervals.mapply}
\alias{gintervals.mapply}
\title{
Applies a function to values of track expressions
}
\description{
Applies a function to values of track expressions for each interval.
}
\usage{
gintervals.mapply(FUN, [expr]+, intervals,
                  enable.gapply.intervals = FALSE,
                  iterator = NULL, intervals.set.out = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{FUN}{function to apply, found via ‘match.fun’}
  \item{expr}{track expressions whose values are used as arguments for 'FUN'}
  \item{intervals}{intervals for which track expressions are calculated}
  \item{enable.gapply.intervals}{if 'TRUE', then a variable 'GAPPLY.INTERVALS' is available}
  \item{iterator}{track expression iterator. If 'NULL' iterator is determined implicitly based on track expressions.}
  \item{intervals.set.out}{intervals set name where the function result is optionally outputed}
}
\details{
This function evaluates track expressions for each interval from 'intervals'. The resulted vectors are passed then as arguments to 'FUN'.

If the intervals are one-dimensional and have an additional column named 'strand' whose value is '-1', the values of the track expression are placed to the vector in reverse order.

The current interval index (1-based) is stored in 'GAPPLY.INTERVID' variable that is available during the execution of 'gintervals.mapply'. There is no guarantee about the order in which the intervals are processed. Do not rely on any specific order and use 'GITERATOR.INTERVID' variable to detect the current interval id.

If 'enable.gapply.intervals' is 'TRUE', an additional variable 'GAPPLY.INTERVALS' is defined during the execution of 'gintervals.mapply'. This variable stores the current iterator intervals prior to track expression evaluation. Please note that setting 'enable.gapply.intervals' to 'TRUE' might severely affect the run-time of the function.

Note: all the changes made in R environment by 'FUN' will be void if multitasking mode is switched on. One should also refrain from performing any other operations in 'FUN' that might be not "thread-safe" such as updating files, etc. Please switch off multitasking ('options(gmultitasking = FALSE)') if you wish to perform such operations.

If 'intervals.set.out' is not 'NULL' the result is saved as an intervals set. Use this parameter if the result size exceeds the limits of the physical memory.
}
\value{
If 'intervals.set.out' is 'NULL' a data frame representing intervals with an additional column that contains the return values of 'FUN'.
}

\seealso{
\code{\link{mapply}}
}
\examples{
gdb.init_examples()
gintervals.mapply(max, "dense_track",
                  gintervals(c(1, 2), 0, 10000))
gintervals.mapply(function(x, y){ max(x + y) }, "dense_track",
                  "sparse_track", gintervals(c(1, 2), 0, 10000),
                  iterator = "sparse_track")
}
\keyword{ ~apply }
\keyword{ ~mapply }
