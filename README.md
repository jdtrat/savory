# savory

#### Easily Save Figures from R

<!-- badges: start -->

[![R-CMD-check](https://github.com/jdtrat/savory/workflows/R-CMD-check/badge.svg)](https://github.com/jdtrat/savory/actions)

<!-- badges: end -->

------------------------------------------------------------------------

<img src="https://jdtrat.com/project/savory/featured-hex.png" width="328" height="378" align="right"/>

savory provides utility functions for easily saving and previewing figures generated from R. Currently, [flextable](https://ardata-fr.github.io/flextable-book/) and [ggplot2](http://ggplot2.tidyverse.org/) objects are supported.

## Table of contents

-   [Installation](#installation)
-   [Getting Started](#getting-started)
-   [Further Reading](#further-reading)
-   [Feedback](#feedback)
-   [Code of Conduct](#code-of-conduct)

------------------------------------------------------------------------

## Installation

You can install and load the development version of savory from GitHub as follows:

```r
# Install the development version from GitHub
if (!require("remotes")) install.packages("remotes")
remotes::install_github("jdtrat/savory")

# Load package
library(savory)
```

## Getting Started

Currently, savory only has two functions:

1. Adapted from TJ Mahr's package ['tjmisc'](https://github.com/tjmahr/tjmisc/blob/master/R/ggplot.R), `ggpreview()` saves a ggplot2 object to a temporary file with `ggsave()` and opens the temporary file in the system viewer. This function is useful for quickly previewing how a plot will look when it is saved to a file. Here's a small example for you to try out:

```r
library(ggplot2)
library(savory)

car_plot <- ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point(shape = 21, fill = "skyblue", color = "black")

ggpreview(width = 10.68, 
          height = 7, 
          dpi = 300, 
          bg = "white")
```

2. `save_figure()` is a generic function that allows you to easily save ggplot2 and flextable objects. I hope to support more options in the future. Examples for each are below:

```r
library(magrittr)
library(flextable)
library(ggplot2)

## Save ggplot2 Objects

car_plot <- ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point(shape = 21, fill = "skyblue", color = "black")
  
car_plot %>%
  save_figure("file-path.png",
              width = 10.68,
              height = 7, 
              dpi = 300, 
              bg = "white")

## Save Flextable Objects

  # As PNG
  mtcars %>%
    flextable() %>%
    save_figure("file-path.png")

  # As HTML
  mtcars %>%
    flextable() %>%
    save_figure("file-path.html")
```

## Further Reading

For a more in-depth explanation of savory, please make a feature request so there is more to this package 😄!

## Feedback

If you want to see a feature, or report a bug, please [file an issue](https://github.com/jdtrat/savory/issues) or open a [pull-request](https://github.com/jdtrat/savory/pulls)! As this package is just getting off the ground, we welcome all feedback and contributions. See our [contribution guidelines](https://github.com/jdtrat/savory/blob/main/.github/CONTRIBUTING.md) for more details on getting involved!

## Code of Conduct

Please note that the savory project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.
