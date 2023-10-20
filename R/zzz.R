#' @importFrom dplyr %>% bind_rows near
#' @import grid
#' @import ppdf
#' @importFrom rlang %||% abort
#' @importFrom stringr str_glue str_sub str_sub<-
#' @importFrom utils hasName packageVersion
NULL

# We require `{snakecase}` so in `Imports`
# But we only use it indirectly from `{ppdf}` which has it in its `Suggests`
# This should suppress a CRAN NOTE about `{snakecase}` being in `Imports` but not used
dont_run <- function(x) {
    snakecase::to_snake_case(x)
}
