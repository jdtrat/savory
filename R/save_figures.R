#' Save Figures
#'
#' @description Generic function for saving figures.
#'
#' @param .figure The figure to be saved.
#' @param .path The path to save the figure (including file extension such as
#'   ".png")
#' @param create_directory If the `.path` argument specifies a non-existent
#'   directory, should it be created automatically? Default is `TRUE`.
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return The file path for the saved object.
#' @export
#'
save_figure <- function(.figure, .path, create_directory = TRUE, ...) {

  path_dir <- fs::path_dir(.path)

  dir_exist <- fs::dir_exists(path_dir)

  if (create_directory & !dir_exist) {
    fs::dir_create(path_dir)
  } else if (!create_directory & !dir_exist) {
    stop("It looks like you're trying to save a figure in a directory that does not exist.
         Either create it or set `create_directory` = TRUE.")
  }

  UseMethod("save_figure", .figure)
}

#' Save ggplot2 Figures
#'
#' @param .figure The figure to be saved.
#' @param .path The path to save the figure (including file extension such as
#'   ".png").
#' @param create_directory If the `.path` argument specifies a non-existent
#'   directory, should it be created automatically? Default is `TRUE`.
#' @param width The width of the plot (default is 1.619 * height)
#' @param height The height of the plot (default is 4.94)
#' @param units Units to save the plot in. Default is "in" (inches). See
#'   [ggplot2::ggsave] for more details.
#' @param ... Additional parameters to pass into [ggplot2::ggsave].
#'
#' @return The file path for the saved object.
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'   library(ggplot2)
#'
#'   car_plot <- ggplot(mtcars, aes(x = gear, y = cyl)) +
#'     geom_col()
#'
#'   save_figure(car_plot, "~/Desktop/carplot.png")
#' }
#'
save_figure.ggplot <- function(.figure, .path,
                               create_directory = TRUE,
                               width = 1.619 * height,
                               height = 4.94,
                               units = "in",
                               ...) {
  ggplot2::ggsave(
    filename = .path,
    plot = .figure,
    width = width,
    height = height,
    units = "in",
    ...
  )
  return(.path)
}

#' Save Flextable Figures
#'
#' @description Save 'flextable' objects. This is a wrapper around flextable's
#'   `save_as_*()` functions with the appropriate one chosen based on `.path`
#'   file extension.
#' @param .figure The figure to be saved.
#' @param .path The path to save the figure (including file extension such as
#'   ".png").
#' @param create_directory If the `.path` argument specifies a non-existent
#'   directory, should it be created automatically? Default is `TRUE`.
#' @param ... Additional arguments passed to or from other methods.
#'
#' @return The file path for the saved object.
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'
#'   library(flextable)
#'   library(magrittr)
#'
#'   # As PNG
#'   mtcars %>%
#'     flextable() %>%
#'     save_figure("~/Desktop/mtcars-table.png")
#'
#'   # As HTML
#'   mtcars %>%
#'     flextable() %>%
#'     save_figure("~/Desktop/mtcars-table.html")
#'
#' }
#'
#'
save_figure.flextable <- function(.figure, .path, create_directory = TRUE,
                                  ...) {

  ext <- fs::path_ext(.path)

  # flextable::save_as_image requires webshot, so I don't check for that in
  # savory.
  switch(ext,
         "png" = flextable::save_as_image(.figure, path = .path),
         "pdf" = flextable::save_as_image(.figure, path = .path),
         "jpg" = flextable::save_as_image(.figure, path = .path),
         "jpeg" = flextable::save_as_image(.figure, path = .path),
         "html" = flextable::save_as_html(.figure, path = .path),
         "doc" = flextable::save_as_docx(.figure, path = .path),
         "docx" = flextable::save_as_docx(.figure, path = .path),
         "ppt" = flextable::save_as_pptx(.figure, path = .path),
         "pptx" = flextable::save_as_pptx(.figure, path = .path)
  )

  return(.path)
}
