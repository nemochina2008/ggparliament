% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggparliament.R
\name{ggparliament}
\alias{ggparliament}
\title{Parliament Plots}
\usage{
ggparliament(data, party, seats1, seats2, style = c("dots", "arc", "bar",
  "pie", "rose"), label = c("name", "seats", "both", "neither"),
  portion = 0.75, nrows = 10, size = 2L, total = NULL, ...)
}
\arguments{
\item{data}{A data frame}

\item{party}{The name of a variable in \code{data} containing the names of parties. If \code{data} is missing, this can be a vector of party names.}

\item{seats1}{The name of a variable in \code{data} containing the number of seats for each party. If \code{data} is missing, this can be a vector of seat counts.}

\item{seats2}{Optionally, the name of a variable in \code{data} containing a second set of numbers of seats for each party. If \code{data} is missing, this can be a vector of seat counts. This can be useful for showing, e.g., pre-/post-election changes in numbers of seats.}

\item{style}{A character string specifying the style of the graph. Either \dQuote{arc} or \dQuote{dots}.}

\item{label}{A character string specifying the type of label to place next to each party group.}

\item{portion}{A numeric value specifying what proportion of a full circle should be used for drawing the plot.}

\item{nrows}{If \code{style = "dots"}, a numeric value indicating how many rows to use.}

\item{size}{A numeric value specifying the size of dots if \code{style = "dots"}.}

\item{total}{A numeric value indicating the font size of a text label indicating the number of seats in the parliament. If \code{NULL} (the default), this is omitted.}

\item{\dots}{Ignored}
}
\value{
A \code{\link[ggplot2]{ggplot}} object.
}
\description{
Produce a Wikipedia-style hemicycle plot of parliamentary composition
}
\details{
This transforms a data frame of party seat counts into ggplot scatterplot using \code{\link[ggplot2]{coord_polar}}.
}
\examples{
d <- data.frame(Party = c("GUE/NGL", "S&D", "Greens/EFA", 
                          "ALDE", "EPP", "ECR", "EFD", "NA"),
                Number = c(35, 184, 55, 84, 265, 54, 32, 27),
                NumberPre = c(20, 166, 90, 40, 210, 130, 60, 20))

# dot-type
ggparliament(d, party = Party, seats1 = Number)

# arc-type
ggparliament(d, party = Party, seats1 = Number, style = "arc")

# arc-type with pre/post changes
ggparliament(d, party = Party, seats1 = Number, seats2 = NumberPre, style = "arc")

}
\references{
\url{http://stackoverflow.com/questions/42729174/creating-a-half-donut-or-parliamentary-seating-chart}
}
