#' Print a panel VECM!
#'
#' @param x An object which class is 'pvecm'.
#' @param ... Unused arguments (at present).
#'
#' @export
#'
#' @examples
#' data("Grunfeld", package = "plm")
#' sales <- pvecm(Grunfeld[c(3,4)], Grunfeld[5], cross_sections = Grunfeld[1], time = Grunfeld[2],
#' deterministic_long = "drift", vecm_lags = 2)
#' print(sales)
print.pvecm <- function(x, ...) {
  cat("
       ###                         ###
       ###  GROUP MEAN PANEL VECM  ###
       ###                         ###\n")
  cat(paste("\nNumber of cross-sections: ",x$cross.section[1], "\n"))
  if (x$estimation.method == "D") {
    cat("\nLong run cointegrated vector estimated by Group Mean DOLS
         \n")
  } else {
    cat("
        \nLong run cointegrated vector estimated by Group Mean FMOLS
        \n")
  }
  print(x$long.run.vector)
  cat(paste("\nNumber of lags in the VECM:  ",x$lags.vecm[1], "\n"))
  cat("\nEstimated VECM:\n
      ")
  print(x$VECMS)
}
