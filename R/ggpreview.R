#' Preview a file that would be created by `ggsave()`
#'
#' This function saves a plot to a temporary file with `ggsave()` and opens the
#' temporary file in the system viewer. This function is useful for quickly
#' previewing how a plot will look when it is saved to a file. It is adapted
#' from TJ Mahr's package
#' ['tjmisc'](https://github.com/tjmahr/tjmisc/blob/master/R/ggplot.R).
#'
#' @param plot Plot to view (default is last displayed plot).
#' @param ... options passed onto [ggplot2::ggsave()]
#' @param device the file extension of the device to use. Defaults to `"png"`.
#'
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'   library(ggplot2)
#'   library(magrittr)
#'
#'   pl <- ggplot(mtcars, aes(x = cyl, y = mpg)) +
#'     geom_point()
#'
#'   pl %>%
#'     ggpreview(width = 1.619 * 6.6,
#'               height = 7,
#'               dpi = 300,
#'               bg = "white")
#' }
#'
ggpreview <- function(plot = ggplot2::last_plot(), ..., device = "png") {
  fname <- tempfile(fileext = paste0(".", device))
  ggplot2::ggsave(plot = plot, filename = fname, device = device, ...)
  system2("open", fname)
  invisible(NULL)
}
