# Parliament plots

This package attempts to implement "parliament plots" - visual representations of the composition of legislatures that display seats color-coded by party. The input is a data frame containing one row per party, with columns representing party name/label and number of seats, respectively.

Inspiration from this package comes from: [parliamentdiagram](https://github.com/slashme/parliamentdiagram), which is used on Wikipedia, [parliament-svg](https://github.com/juliuste/parliament-svg), which is a javascript clone, and [a discussion on StackOverflow](http://stackoverflow.com/questions/42729174/creating-a-half-donut-or-parliamentary-seating-chart), which provided some of the code for part for the "arc" representations used in this package.

## Code Examples

Here are some examples for a "small" parliament:


```r
library("ggplot2")
library("ggparliament")

# example data (114th vs 115th US Senate)
d <- data.frame(Party = factor(c("D", "R", "I"), levels = c("D", "R", "I")),
                Number = c(46, 52, 2),
                NumberPre = c(53, 45, 2))

# dot-style
cols1 <- scale_color_manual(values = c("D" = "blue", "R" = "red", "I" = "gray40"))
ggparliament(d, party = Party, seats1 = Number, 
  style = "dots", portion = 0.5, nrows = 6, size = 5) + cols1 + 
  theme_void() + ggtitle("Partisan Composition of the 115th US Senate")
```

![plot of chunk small](figure/small-1.png)

```r
# arc-style
cols2 <- scale_fill_manual(values = c("D" = "blue", "R" = "red", "I" = "gray40"))
ggparliament(d, party = Party, seats1 = Number, 
  portion = 0.5, style = "arc") + cols1 + cols2
```

![plot of chunk small](figure/small-2.png)

```r
# double arc-style
ggparliament(d, party = Party, seats1 = Number, seats2 = NumberPre, 
  portion = 0.5, style = "arc", label = "both", total = 6) + cols1 + cols2 + 
  ggtitle("Party Seat Shares in the 115th versus 114th US Senates") +
  geom_segment(aes(x = 0.25, xend = 0.25, y = 0.5, yend = 2), linetype = "dashed")
```

![plot of chunk small](figure/small-3.png)

```r
# bar-style
ggparliament(d, party = Party, seats1 = Number, seats2 = NumberPre, 
  style = "bar", label = "both") + theme_void() + cols1 + cols2
```

![plot of chunk small](figure/small-4.png)



Here are some examples for a "large" parliament:


```r
# example
d2 <- data.frame(Party = factor(c("GUE/NGL", "S&D", "Greens/EFA", "ALDE", "EPP", "ECR", "EFD", "NA")),
                 Number = c(35, 184, 55, 84, 265, 54, 32, 27),
                 NumberPre = c(20, 166, 90, 40, 210, 130, 60, 20))

# dot-style
ggparliament(d2, party = Party, seats1 = Number, style = "dots", label = "seats", nrows = 15, total = 6)
```

![plot of chunk large](figure/large-1.png)

```r
# arc-style
ggparliament(d2, party = Party, seats1 = Number, style = "arc")
```

![plot of chunk large](figure/large-2.png)

```r
# double arc-style
ggparliament(d2, party = Party, seats1 = Number, seats2 = NumberPre, style = "arc", label = "seats")
```

![plot of chunk large](figure/large-3.png)

## Requirements and Installation

[![CRAN](http://www.r-pkg.org/badges/version/parliament)](https://cran.r-project.org/package=parliament)
[![Build Status](https://travis-ci.org/leeper/parliament.svg?branch=master)](https://travis-ci.org/leeper/parliament)
[![codecov.io](http://codecov.io/github/leeper/parliament/coverage.svg?branch=master)](http://codecov.io/github/leeper/parliament?branch=master)
[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

The development version of this package can be installed directly from GitHub using `ghit`:

```R
if (!require("ghit")) {
    install.packages("ghit")
    library("ghit")
}
install_github("leeper/ggparliament")
```

