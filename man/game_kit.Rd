% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/game_kit.R
\name{game_kit}
\alias{game_kit}
\title{Game Kit R6 object}
\usage{
game_kit(cfgs = NULL)
}
\arguments{
\item{cfgs}{A named list of \code{\link[piecepackr:pp_cfg]{piecepackr::pp_cfg()}} configuration list objects.
If \code{NULL} (default) we will use the "piecepack" configuration from
\code{\link[piecepackr:game_systems]{piecepackr::game_systems()}}.}
}
\description{
\code{game_kit} creates a game kit R6 object.
}
\examples{
  cfg <- piecepackr::game_systems()$dual_piecepacks_expansion
  gk <- game_kit(list(cfg = cfg))
  if (Sys.which("xelatex") != "") {
    output <- tempfile(fileext = ".pdf")
    save_pamphlet("tablut", gk = gk, output = output)
    # xopen::xopen(output)
    # browseURL(output)
  }
}
