% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save_figures.R
\name{save_figure}
\alias{save_figure}
\title{Save Figures}
\usage{
save_figure(.figure, .path, create_directory = TRUE, ...)
}
\arguments{
\item{.figure}{The figure to be saved.}

\item{.path}{The path to save the figure (including file extension such as
".png")}

\item{create_directory}{If the \code{.path} argument specifies a non-existent
directory, should it be created automatically? Default is \code{TRUE}.}

\item{...}{Additional arguments passed to or from other methods.}
}
\value{
The file path for the saved object.
}
\description{
Generic function for saving figures.
}
